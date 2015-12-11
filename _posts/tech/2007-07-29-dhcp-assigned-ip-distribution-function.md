---
layout: post
title: DHCP assigned IP distribution
date: '2007-07-29T16:00:00.000+05:30'
author: Vipin Madhavanunni
tags:
- Network
- Tech
- dhcp 
modified_time: '2012-07-23T00:27:28.469+05:30'
blogger_id: tag:blogger.com,1999:blog-8747000.post-4228842763782731614
blogger_orig_url: http://cblog.pattu.thekkedam.com/2007/07/dhcp-assigned-ip-distribution-function.html
thumbnail_path: "blog/DHCP-assigned-IP-distribution/dhcp_hist.png"
---

> This is one of the mad experiments.
> Trying to see the distribution of IPv4 assignment in our centre. 

## Setup : 
Getting different IP is achieved by using mac changer with some bash scripts. The MAC address is chnaged to a random mac which is not used in the network at each time. The DHCP client is run after the change and every time it gets a new ip from dhcp. 

This experiment executed from 12th Jun 2007 to 20th Jul 2007 and the IP address are stored. 

## Result : 
The result graph is shown bellow, 

{% include image.html path=page.thumbnail_path alt="DHCP assigned IP distribution function" %}

Lower IP like 1 to 10 was never got assigned as they are reserved. In the 
range most other IP are got assigned at least once. Some IPs in between are missing as they are statically assigned to some dedicated machines. IPs like 84 got assigned for more no of times.
