---
layout: post
title: Caching deb package using Squid cache proxy and apt-cacher
date: '2008-05-30T21:00:00.006+05:30'
author: Vipin Madhavanunni
tags:
- apt-get
- squid
- Tech
modified_time: '2008-05-31T14:57:53.523+05:30'
blogger_id: tag:blogger.com,1999:blog-8747000.post-7954690574519052236
blogger_orig_url: http://cblog.pattu.thekkedam.com/2008/05/squid-cache-proxy-with-apt-cacher-for.html
thumbnail_path: "blog/Squid-cache/squid.jpg"
---
[apt-cacher](http://www.nick-andrew.net/projects/apt-cacher/) is a useful tool for caching the deb packages. The problem with this is user should change there /etc/apt/sources.list to use this. The object is to make use of apt-cacher without user side modification. 

{% include image.html path=page.thumbnail_path alt="Squid" %}

> **Components :** [Squid](http://www.squid-cache.org/) +  Iptables for transparent proxy +  apt-cacher for caching + [jesred](http://www.linofee.org/%7Eelkner/webtools/jesred/) Url redirect. 

## Squid configuration

The squid needs to be configured with transparent enabled and new entries required to work with jesred redirect. The children no entry can be changed in case of a higher number of clients. 

```http_port 3128 transparent 
*redirect_program /usr/lib/squid/jesred* 
*redirect_children 15*
```

## Rule to make transparent 

In the iptables rules should be made to work for the transparent proxy. This makes the client go through squid cache server with out setting proxy server or changing apt-get repo configuration.

```iptables -t nat -N proxy 
iptables -t nat -A PREROUTING -I eth0 -p tcp --dport 80 -j proxy 
```
 
## apt-get cacher configuration

apt-cacher is developed based on perl and its configuration file is  in /etc/apt-cacher/apt-cacher.conf. The basic information can be configured here.

```cache_dir=/var/cache/apt-cacher 
admin_email=admin@xxx.org 
daemon_port=3142 
group=www-data 
user=www-data 
allowed_hosts=* 
denied_hosts= 
denied_hosts_6= 
generate_reports=1 
clean_cache=1 
logdir=/var/log/apt-cacher 
expire_hours=0 
limit=0
```

And start apt-cacher service. 

## Rules in jesred 

The transparent proxy setting makes all connection from apt-get requests to go through the squid. The Jesred redirector needs to configured handle this. The jesred.conf should be configured to take redirect rules from /etc/jesred.rules.

```allow = /etc/jesred.acl 
rules = /etc/jesred.rules 
redirect_log = /var/log/squid/jesred-redirect.log 
rewrite_log = /var/log/squid/jesred-rewrite.log
```

The jesred redirector rules should be writen for debian repo Urls to be forward.

```regexi ^http://((.*)/debian/(dists|pool)/.*)$
http://127.0.0.1:3142/\1 
regexi ^http://((.*)/ubuntu/(dists|pool)/.*)$
http://127.0.0.1:3142/\1
```

The above regular expression makes the redirector forward the Debian and ubuntu dists and pool requests to the apt-cacher which is listening on 3142 port. By enabling the redirect log in jesred.conf we can find is it redirecting all required URLs. 

This makes simple for a big organisation to reduce their internet traffic to some level if there are significant number of Debian / Ubuntu users.
