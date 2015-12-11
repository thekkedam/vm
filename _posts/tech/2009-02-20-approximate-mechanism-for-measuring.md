---
layout: post
title: Approximate mechanism for measuring Stability of Internet Link in aggregated
  Internet Pipe
date: '2009-02-20T00:05:00.033+05:30'
author: Vipin Madhavanunni
tags:
- Network
- Tech
- e-Print
modified_time: '2009-08-07T12:19:43.434+05:30'
blogger_id: tag:blogger.com,1999:blog-8747000.post-2083794857576983858
blogger_orig_url: http://cblog.pattu.thekkedam.com/2009/02/approximate-mechanism-for-measuring.html
---

## Abstract

In this article we propose a method for 
measuring internet connection stability which is fast and has negligible 
overhead for the process of its complexity. This method finds a relative value 
for representing the stability of internet connections and can also be 
extended for aggregated internet connections. The method is documented with 
help of a real time implementation and results are shared. This proposed 
measurement scheme uses HTTP GET method for each connection(s). The normalized 
responses to identified sites like gateways of ISP’s, google.com etc are used 
for calculating current link stability. The novelty of the approach is that 
historic values are used to calculate overall link stability. In this 
discussion, we also document a method to use the calculated values as a 
dynamic threshold metric. This is used in routing decisions and for 
load-balancing each of the connections in an aggregated bandwidth pipe. This 
scheme is a very popular practice in aggregated internet connections. 

**Keyword: Internet measurement, routing, load balancing, fail over.**

Download the document :  [[Abstract](http://arxiv.org/abs/0907.4881)] 
[[PDF](http://arxiv.org/pdf/0907.4881v1)] 

## Live Details - 

This may not load sometime ... 

[<img style="margin: 0px auto 10px; display: 
block; text-align: center; cursor: pointer; width: 500px; height: 135px;" 
src="http://122.165.25.137/status/bsnl/bsnllines-day.png" alt="" border="0" 
/>](http://122.165.25.137/status/bsnl/bsnllines-day.png)L1 [ ISP 1 ] 

[<img style="margin: 0px auto 10px; display: 
block; text-align: center; cursor: pointer; width: 500px; height: 135px;" 
src="http://122.165.25.137/status/air/airtellines-day.png" alt="" border="0" 
/>](http://122.165.25.137/status/air/airtellines-day.png)L 2 [ ISP 2 ] 

[<img style="margin: 0px auto 10px; display: 
block; text-align: center; cursor: pointer; width: 500px; height: 135px;" 
src="http://122.165.25.137/status/mit/mitlines-day.png" alt="" border="0" 
/>](http://122.165.25.137/status/mit/mitlines-day.png)L 3 [ University WAN ]


