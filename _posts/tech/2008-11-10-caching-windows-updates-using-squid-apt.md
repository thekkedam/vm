---
layout: post
title: Caching Windows Updates using Squid apt-cacher jesred
date: '2008-11-10T11:47:00.003+05:30'
author: Vipin Madhavanunni
tags:
- squid
- Windows
- Tech
modified_time: '2008-11-10T12:06:55.924+05:30'
blogger_id: tag:blogger.com,1999:blog-8747000.post-1811315844838996113
blogger_orig_url: http://cblog.pattu.thekkedam.com/2008/11/caching-windows-updates-using-squid-apt.html
thumbnail_path: "blog/Squid-cache/squid.jpg"
---

If there are lot of windows 2000/Xp/etc. system in your network and all run schedule update, not only it eat some of your bandwidth but also  same update file will be downloaded individual by every systems. If you have a windows domain server that can handl the centralized updates. This is an alternate way with caching.

Even though Squid do a good level of caching with refresh pattern for the specific domain/files.
I found [Squid](http://www.squid-cache.org/) + [Jesred](http://www.linofee.org/%7Eelkner/webtools/jesred/) + [apt-cacher](http://www.nick-andrew.net/projects/apt-cacher/) is better. 
By using this we get update as it from local. In my previous blog i put how to use [Caching deb package using Squid cache proxy and apt-cacher](http://vm.thekkedam.org/writing/2008/05/30/squid-cache-proxy-with-apt-cacher). With minor cahges to this will make to cache windows update also in apt-cacher. 

## New rules in jesred

The jesred will work for Windows updates with these changes. 

**in abort files**

```abort .asmx 
abort .txt 
abort .aspx
``` 

**in the redirect rules**

```regexi ^http://((.*).windowsupdate.com/msdownload/(.*).(exe|msi))$ http://127.0.0.1:3142/\1 
regexi ^http://((.+).download.windowsupdate.com/msdownload/.*)$ http://127.0.0.1:3142/\1 
```

> **Note** : I found HITs are not recorded as HIT in the "/var/log/apt-cacher/access.log"
