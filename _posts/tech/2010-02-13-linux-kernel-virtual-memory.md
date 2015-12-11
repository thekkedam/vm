---
layout: post
title: Linux kernel virtual memory
date: '2010-02-13T10:58:00.000+05:30'
author: Vipin Madhavanunni
tags:
- Tech
- Open Source
- Linux kernel
modified_time: '2010-02-13T10:58:39.900+05:30'
blogger_id: tag:blogger.com,1999:blog-8747000.post-4526234318233220540
blogger_orig_url: http://cblog.pattu.thekkedam.com/2010/02/linux-kernel-virtual-memory.html
---

In any high load system memory management is a important issue. Linux kernel allow to modify the way it allocate virtual memory based multiple factors. These parameters can be controlled and obtain a better performance as the requirement. Linux systems typically let you allocate as much virtual memory as you like, then kill the process if it uses too much of it. Virtual memory allocation is based on mode of overcommitting, and this is decided based on the value set in `/proc/sys/vm/overcommit_memory`. 

Values are:

<pre>
0 - heuristic overcommit 
1 - always overcommit, never check 
2 - always check, never overcommit
</pre>

**Mode 0** - This is the default mode of 
operation. Calls of mmap(2) with MAP_NORESERVE are not checked and the default 
check is very weak, leading to the risk of get- ting a process "OOM-killed". 

**Mode 1** -  This is a disaster when the system is in over loaded mode.

**Mode 2**  - The total  virtual  address  space 
on the system is limited to based on virtual memory commit 
calculation.


Totel Virtual Memory is, 

> Vm = (Ss +Spm * ( Or / 100 ) ) 

where 
<pre>
Ss - Size of the Swap space 
Spm - Size  of  the physical memory ( RAM ) 
Or - Overcommit Ratio
</pre>

In the above two variables are known and the Overcommit ratio is set in 
`/proc/sys/vm/overcommit_ratio`.

Os kill the process if it uses too much of 
memory, this happens can avoid this by switching to mode 2 
<pre>
echo 2 > /proc/sys/vm/overcommit_memory
</pre>

