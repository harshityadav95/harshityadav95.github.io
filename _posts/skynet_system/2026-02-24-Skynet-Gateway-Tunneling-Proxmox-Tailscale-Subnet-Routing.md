---
title: "The Skynet Gateway: Tunneling into Proxmox with Tailscale Subnet Routing"
author: harshityadav95
date: 2026-02-24 00:00:00 +0530
categories: [Dev Kit]
tags: [Linux, Homelab, Proxmox, Tailscale, Networking, WireGuard, LXC]

---

## The "Skynet" Gateway: Tunneling into Proxmox with Tailscale Subnet Routing

Today, we are looking at a beautiful piece of networking architecture. We have a Proxmox host—let's call it **Skynet**—and we want to access its guts. We're talking about the Proxmox GUI, the LXCs, and the VMs, all from a remote coffee shop, without the mess of port forwarding or exposed firewalls.

Let's break down exactly what we did, why we did it, and how the underlying networking magic actually works.

---

### The Goal: Universal Access

The user wanted to treat their Tailscale network (the Tailnet) as a bridge into their physical home network. Instead of installing Tailscale on every single container (which is tedious and increases the attack surface), we turned the **Proxmox Host** into a **Subnet Router**.

### Recap: Bridge & Gateway

**The Bridge (vmbr0)**

Think of the Bridge as a virtual "unmanaged switch" living inside your Proxmox RAM. When you create an LXC, you "plug" its virtual cable into vmbr0. The bridge doesn't care about routing or the internet; its only job is to let the Proxmox host and the containers communicate over the local wire. It's a layer-2 construct—it deals with MAC addresses. When you ran that ethtool command, you were essentially cleaning the "pipes" of this bridge to handle UDP traffic better.

**The Gateway**

The Gateway is the "Exit Sign" on the door. For your LXCs, the gateway is usually your home router (192.168.1.1). But in our context, Tailscale turned Skynet into a Subnet Gateway.

When you're at a coffee shop, your laptop doesn't know where 192.168.1.50 is. It asks Tailscale. Tailscale says, "I know a guy," and sends the data to Skynet. Skynet receives it, looks at the destination, and acts as the Gateway to pass that traffic off the Tailscale "highway" and onto the vmbr0 "local road."

---

### Step 1: Laying the Foundation (Installation)

First, we pulled the Tailscale binary onto the host.

```bash
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up
```

**Why?** This puts Skynet on the Tailnet map. It gets its own 100.x.y.z IP address. But at this stage, it's an island. It can talk to your phone, but it won't share its "friends" (the LXCs) with you yet.

---

### Step 2: Enabling the Linux Router Brain

By default, Linux is a selfish OS. If it receives a packet meant for someone else, it drops it. To make Skynet act as a gateway, we had to enable **IP Forwarding**.

We modified `/etc/sysctl.conf` to set:

```bash
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
```

**The "Why":** This tells the Linux kernel: *"If you get a packet for `192.168.1.50` (an LXC), don't kill it. Pass it along to the bridge."*

---

### Step 3: Advertising the Routes

This is where the magic happens. We told Tailscale to tell the rest of the world that Skynet knows the way to the `192.168.1.0/24` network.

```bash
tailscale up --advertise-routes=192.168.1.0/24 --accept-dns=false
```

But wait! The terminal screamed at us. **Warning: UDP GRO forwarding is suboptimally configured.**

---

### Step 4: The Performance Optimization (The "Ethtool" Fix)

Tailscale uses **WireGuard**, which relies heavily on UDP. In Proxmox, your physical NIC (in this case, `nic0`) is usually plugged into a virtual bridge (`vmbr0`).

The hardware was trying to be "smart" by grouping packets (Generic Receive Offload), but when those packets need to be forwarded to a virtual machine, that "smart" grouping actually breaks things or slows them down.

**The Fix:**
We identified the physical device as `nic0` using `ip a`, and then we tuned it:

```bash
ethtool -K nic0 rx-udp-gro-forwarding on rx-gro on
```

**The "Why":** This aligns the hardware offloading with the kernel's forwarding requirements. It's the difference between a traffic jam and a carpool lane.

---

### Step 5: Making it Permanent

In Linux, if you don't write it to a file, it didn't happen (at least after a reboot). We went into `/etc/network/interfaces` to ensure that every time Skynet boots, `nic0` is configured correctly.

**The final config looks like this:**

```text
iface vmbr0 inet static
    address 192.168.1.20/24
    gateway 192.168.1.1
    bridge-ports nic0
    ...
    post-up /usr/sbin/ethtool -K nic0 rx-udp-gro-forwarding on rx-gro on
```

---

### Summary of Commands

Here is your "Skynet" cheat sheet:

1. **Install:** `curl -fsSL https://tailscale.com/install.sh | sh`
2. **Auth:** `tailscale up`
3. **Route:** `tailscale up --advertise-routes=192.168.1.0/24`
4. **Tune:** `ethtool -K nic0 rx-udp-gro-forwarding on rx-gro on`
5. **Persist:** Add the `post-up` line to `/etc/network/interfaces`.

---

### What's Next?

Now that the plumbing is done, you have a high-performance, encrypted tunnel into your entire Proxmox lab. You can hit your Proxmox GUI at `https://100.x.y.z:8006` or SSH into any container using its internal `192.168.1.x` address.
