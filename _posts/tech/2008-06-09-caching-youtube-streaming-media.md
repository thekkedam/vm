---
layout: post
title: Caching Youtube streaming media
date: '2008-06-09T17:11:00.004+05:30'
author: Vipin Madhavanunni
tags:
- squid
- YouTube
modified_time: '2008-06-09T18:58:57.685+05:30'
blogger_id: tag:blogger.com,1999:blog-8747000.post-2646589034629954748
blogger_orig_url: http://cblog.pattu.thekkedam.com/2008/06/caching-youtube-streaming-media.html
thumbnail_path: "blog/Squid-cache/squid.jpg"
---

We found YouTub and other streaming media is the major share in the bandwidth conception. For a better performance, we decided to  find ways to cache them. We did a search in google and found some useful links and we made a work out from this. 

The squid.conf extra lines look like this. 

## YouTube options 

```acl youtube dstdomain .youtube.com .googlevideo.com video.google.com  video.google.co.in 
acl youtubeip dst 74.125.15.0/24 64.15.0.0/16 
cache allow youtube 
cache allow youtubeip 
refresh_pattern -i \.(flv)$ 20080 90% 999999 ignore-no-cache override-expire ignore-private 
refresh_pattern ^http://sjl-v[0-9]+.sjl.youtube.com 20080 90% 999999  ignore-no-cache override-expire ignore-private 
refresh_pattern get_video?video_id 20080 90% 999999 ignore-no-cache 
override-expire ignore-private 
refresh_pattern youtube.com/get_video? 20080 90% 999999 ignore-no-cache override-expire ignore-private 
```

## Google Earth 

```refresh_pattern -i m/^http:\/\/kh(.*?)\.google\.com(.*?)\/(.*?)$/ 20080 90% 
999999 ignore-no-cache override-expire ignore-private 
```

## Problem

I don't think the above given is effective, we need suggestions. If anyone have a better way around for this problem, please help us. 

## Reference 

1. [Squid User Mailing 
list](http://www.mail-archive.com/squid-users@squid-cache.org/msg55485.html) 
2. [Technical Nuggest](http://www.techienuggets.com/Detail?tx=32811) 
3. [Squid Wiki](http://wiki.squid-cache.org/Features/StoreUrlRewrite)
