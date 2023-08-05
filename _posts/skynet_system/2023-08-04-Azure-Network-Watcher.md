---
title: Azure Network Watcher
author: harshityadav95
date: 2023-08-04 00:00:00 +0530
categories: [Software Development]
tags: [Azure, Windows, VM]

---


![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/139f4eed-1c2b-4309-815b-56fa683c2b78)

# TLDR;

- The NSG can’t be associated with Load balancer, NSGs can be associated with either subnets or individual VM instances within that subnet, so we can’t use NSG to block inbound IP address from the internet[.#1](https://stackoverflow.com/questions/41559854/azure-load-balancer-nsg-rules-remove-access-directly)

They can be applied either on a virtual machine or subnet (one NSG can be applied to multiple subnets or virtual machines):-

- **Virtual** **Machines** the rules will only get applied to Virtual Machines that are associated
- **Subnets** All Virtual Machines within the specified subnet will have get the applied ruleset

## What is Network Security Group in Azure ?

Azure NSGs control access and manage communication between:

- Individual workloads hosted on one or more Azure VNets.
- Connectivity between on-prem environments and Azure via an Application Gateway, VPN Gateway, Azure Firewall, Azure Bastion service, and Virtual Network Appliances.
- Connections to and from the Internet.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/589c2bb9-1be3-411a-b1a2-a8a6d6d5fad3)


- You can use an Azure network security group to filter network traffic between Azure resources in an Azure virtual network.
- A network security group contains [security rules](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview#security-rules) that allow or deny inbound network traffic to, or outbound network traffic from, several types of Azure resources.
- Network Security rule consist of :
    - Name
    - Priority
    - Source or destination
    - Protocol
    - Direction
    - Port Range
    - Action
- You can't create two security rules with the same priority and direction
- A flow record is created for existing connections. Communication is allowed or denied based on the connection state of the flow record
- The flow record allows a network security group to be stateful.
- If you specify an outbound security rule to any address over port 80, for example, it's not necessary to specify an inbound security rule for the response to the outbound traffic.
- You only need to specify an inbound security rule if communication is initiated externally. The opposite is also true. If inbound traffic is allowed over a port, it's not necessary to specify an outbound security rule to respond to traffic over the port.
- Existing connections may not be interrupted when you remove a security rule that enabled the flow.
- Traffic flows are interrupted when connections are stopped and no traffic is flowing in either direction, for at least a few minutes.
- Modifying network security group rules will only affect the new connections that are formed.
- When a new rule is created or an existing rule is updated in a network security group, it will only apply to new flows and new connections. Existing workflow connections aren't updated with the new rules.

### Points to remember :

Some important aspects of the Network Security groups include:

- The rules contain a 5 tuple (Source IP, Source port, Destination IP, Destination port, protocol).
- The rules are stateful. This means if there is an inbound rule that allow traffic on a port (e.g. port 80), a matching rule on the outbound side is not required for the packets to flow on the same port.
- Every Network Security Group contains default rules that allow connectivity within the Virtual Network and Outbound access to Internet . These default rules can be overridden by the user rules.
- The rules are processed based on priority. Rules with small (meaning higher priority) values are processed before rules with larger (meaning lower priority) values.
- Azure provides defaults tags such as INTERNET and VIRTUAL_NETWORK that refers to the Public IP Address space outside the Virtual Network and customer’s entire network address space respectively. The tags can be used as part of an access control rule.

## Limitation of Azure NSG

- Network Security Groups strives to provide granular access control over network traffic for services running in the VNet, and aligning with that goal a subscription is allowed to have up to 100 Network Security Groups with each Network Security Group having as many as 200 rules.
- The limits can be increased by contacting Microsoft support if there is a genuine use case that requires more rules or groups.
- Network Security Group is available only for VMs in a regional VNet.

## What is Azure Network Watcher ?

- Network performance monitoring and diagnostics solution.
- Azure Network Watcher provides tools to monitor, diagnose, view metrics, and enable or disable logs for resources in an Azure virtual network.
- Network Watcher is designed to monitor and repair the network health of IaaS (Infrastructure-as-a-Service) products including Virtual Machines (VM), Virtual Networks, Application Gateways, Load balancers, etc.

## What is Network Watcher NSG Log flow  ?

- It is vital to monitor, manage, and know your own network for uncompromised security, compliance, and performance. Knowing your own environment is of paramount importance to protect and optimize it.
- You often need to know the current state of the network, who is connecting, where they're connecting from, which ports are open to the internet, expected network behavior, irregular network behavior, and sudden rises in traffic.
- Flow logs are the source of truth for all network activity in your cloud environment.
- Whether you're an upcoming startup trying to optimize resources or large enterprise trying to detect intrusion, Flow logs are your best bet.
- You can use it for optimizing network flows, monitoring throughput, verifying compliance, detecting intrusions and more.

## Log Flow Logging Core Concept

- **Flow logs operate at [Layer 4](https://en.wikipedia.org/wiki/OSI_model#Layer_4:_Transport_Layer)** and record all IP flows going in and out of an NSG
- Logs are collected at **1-min interval** through the Azure platform and do not affect customer resources or network performance in any way.
- Logs are written in the JSON format and show outbound and inbound flows on a per NSG rule basis.
- Each log record contains the network interface (NIC) the flow applies to, 5-tuple information, the traffic decision & (Version 2 only) throughput information. See *Log Format* below for full details.
- Flow Logs have a retention feature that allows automatically deleting the logs up to a year after their creation.

## Reference :

[Azure Load Balancer + NSG Rules - Remove Access Directly](https://stackoverflow.com/questions/41559854/azure-load-balancer-nsg-rules-remove-access-directly)

[Microsoft Azure: NSGs & ASGs Simplified | Kainos](https://www.kainos.com/insights/blogs/microsoft-azure-nsgs-asgs-simplified)

[Azure Network Watcher](https://learn.microsoft.com/en-us/azure/network-watcher/network-watcher-monitoring-overview)

[](https://azure.microsoft.com/en-us/blog/network-security-groups/)

[Azure network security groups overview](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)

[How to create network security groups (NSGs) in Azure | Aviatrix](https://aviatrix.com/learn-center/cloud-security/create-network-security-groups-in-azure/)

[Azure subscription limits and quotas - Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits#networking-limits)

[Create, change, or delete an Azure network security group](https://learn.microsoft.com/en-us/azure/virtual-network/manage-network-security-group?tabs=network-security-group-portal)

[Azure traffic analytics](https://learn.microsoft.com/en-gb/azure/network-watcher/traffic-analytics)

[Introduction to flow logging for NSGs - Azure Network Watcher](https://learn.microsoft.com/en-us/azure/network-watcher/network-watcher-nsg-flow-logging-overview)
