---
title: Picking Storage Format
author: harshityadav95
date: 2025-05-04 00:00:00 +0530
categories: [Dev Kit]
tags: [Git, Github]

---

![Image](https://raw.githubusercontent.com/harshityadav95/staticfiles/refs/heads/main/Picking%20Format%20for%20External%20Drives/image.png)  

## TL;DR – Best File System Choices by Use Case

- **HDD for macOS:** Use *Mac OS Extended (Journaled)* (HFS+ Journaled).
- **SSD for macOS/iOS:** Use *APFS* (Apple File System), especially for SSDs and modern macOS/iOS devices.
- **Windows + Linux (read/write), macOS (read-only):** Use *NTFS*. macOS can read NTFS natively, but write access requires third-party tools.
- **Linux-only:** Use *ext4*. It’s the default and most robust choice for Linux environments.
- **SD cards for cameras/drones:** Use *FAT32* for maximum compatibility, or *exFAT* for larger files/devices. Always check device requirements.

---

## Storage Terminology

- **GB, TB:** Decimal-based (powers of 10, e.g., 1 GB = 1,000,000,000 bytes).
- **GiB, TiB, EiB:** Binary-based (powers of 2, e.g., 1 GiB = 1,073,741,824 bytes).
- **Relative sizes:**
    - 1 GiB ≈ 1.074 GB
    - 1 TiB ≈ 1.10 TB
    - 1 EiB ≈ 1.15 EB
- **Order (smallest to largest):** GB < GiB < TB < TiB < EB < EiB


## Journaled vs. Non-Journaled File Systems

- **Journaled:**
    - Keeps a log (“journal”) of intended changes before they are committed.
    - On crash/power loss, the system uses the journal to recover quickly and safely, minimizing file corruption.
    - Examples: NTFS (Windows), HFS+ Journaled (macOS), ext4 (Linux), APFS (uses copy-on-write for similar protection).
- **Non-Journaled:**
    - No log of operations; if interrupted, file system can become inconsistent and require lengthy repairs.
    - Examples: FAT32, exFAT, ext2.


![Image](https://raw.githubusercontent.com/harshityadav95/staticfiles/refs/heads/main/Picking%20Format%20for%20External%20Drives/image%201.png)

**Analogy:**
A journaled file system is like following a recipe with checkmarks for each step, so you always know where you left off after an interruption. Non-journaled is like cooking from memory—if interrupted, you might forget what you’ve done, risking mistakes.


## Journaling File System: Pros and Cons

**Advantages:**

- Higher data integrity and faster recovery after crashes.
- Reduces risk of corruption, especially in unexpected shutdowns.

**Disadvantages:**

- Slight performance overhead due to extra write operations.
- Uses some extra disk space for the journal.


## File System Comparison Table

| Feature / Use Case | NTFS | exFAT | FAT32 | APFS | HFS+ Journaled | ext4 |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Primary OS** | Windows | Cross-Platform | Cross-Platform | macOS | macOS | Linux |
| **Native R/W Support** | Win: Yes, Mac: Read-only, Linux: Yes (ntfs-3g) | Win/Mac/Linux: Yes (modern) | Win/Mac/Linux: Yes | Mac: Yes, Linux: Read-only, Win: 3P* | Mac: Yes, Linux: Yes (caveats), Win: 3P* | Linux: Yes, Win/Mac: 3P* |
| **Optimal Drive Type** | HDD/SSD | Flash/SSD | Flash | SSD | HDD/SSD | HDD/SSD |
| **Portability** | Good (Windows) | Excellent | Good | Fair (macOS) | Fair (macOS) | Fair (Linux) |
| **Power Loss Resistance** | Good (Journaled) | Poor | Very Poor | Excellent | Good | Excellent |
| **Long Term Storage** | Good | Fair | Poor | Good | Fair | Good |
| **Speed/Efficiency** | Good (Windows) | Good | Fair | Excellent | Good (macOS) | Excellent |
| **Max File Size** | ~16 EB | ~128 PB | 4 GB | ~8 EB | ~8 EB | ~16 TB |
| **Max Volume Size** | ~8 PB | ~128 PB | ~2-8 TB | Unlimited | Unlimited | ~1 EB |

**Notes:**

- *3P = Third-Party tool required for full support on some OSes.*
- *exFAT is best for large files and cross-platform flash storage, but lacks journaling and is more prone to corruption than NTFS or APFS.*
- *FAT32 is universal but limited to 4GB files and ~8TB partitions.*
- *APFS is optimized for SSDs and modern Apple devices, with advanced features like snapshots and encryption.*
- *ext4 is the standard for Linux, robust and journaled, but not natively supported by Windows/macOS without extra tools.*

## Additional Guidance

- **For Mac-only SSDs:** Use APFS for best performance and features.
- **For external drives shared between Mac and Windows:** exFAT is simplest, but be aware of its lack of journaling (higher corruption risk if unplugged unsafely).
- **For Linux/Windows shared drives:** NTFS is robust, but macOS is read-only by default; third-party drivers are needed for write support.
- **For SD cards in cameras/drones:** FAT32 is most compatible, but exFAT is needed for files larger than 4GB or high-capacity cards.



## Summary

- **APFS**: Best for modern macOS/iOS and SSDs.
- **HFS+ Journaled**: Best for older macOS and HDDs.
- **NTFS**: Best for Windows, good for Linux (with ntfs-3g), read-only on macOS unless using third-party tools.
- **exFAT**: Best for cross-platform flash drives/SD cards, but less robust than NTFS or APFS.
- **FAT32**: Universal, but with strict file size and partition limits.
- **ext4**: Best for Linux-only drives.


## References

1. [Mac OS Extended vs APFS](https://www.reddit.com/r/MacOS/comments/wz1rz6/what_format_should_i_use_for_my_new_external_ssd/)
2. [NTFS on macOS](https://discussions.apple.com/thread/253707407)
3. [Understanding File Systems](https://www.kingston.com/en/blog/personal-storage/understanding-file-systems)
4. [File Systems Explained](https://winbuzzer.com/2021/06/30/filesystems-explained-whats-the-difference-between-fat32-ntfs-exfat-hfs-and-ext4-xcxwbt/)
5. [Journaling File System Overview](https://en.wikipedia.org/wiki/Journaling_file_system)
6. [Journaling File System Details](https://iboysoft.com/wiki/journaling-file-system.html)
7. [Journaling File System Pros and Cons](https://www.minitool.com/lib/journaling-file-system.html)


