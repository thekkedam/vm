---
layout: post
title: Compiling D-ITG 2.7.0 Beta
date: '2009-02-05T15:27:00.007+05:30'
author: Vipin Madhavanunni
tags:
- Network
- Errors
- D-ITG
modified_time: '2009-02-20T13:06:28.327+05:30'
blogger_id: tag:blogger.com,1999:blog-8747000.post-2221670911186381695
blogger_orig_url: http://cblog.pattu.thekkedam.com/2009/02/compiling-d-itg-270-beta.html
---

Compile D-ITG 2.7.0 Beta version in gcc version 4.3.2 with X86_64 bit you will get errors like this. 

<pre>
g++  -DLINUX_OS -Wall -Wno-deprecated   -c -o common/serial.o 
common/serial.cpp 
common/serial.cpp:87:21: error: stropts.h: No such file or directory 
make: *** [common/serial.o] Error 1
</pre> 

The solution is 

```diff -r a/src/common/serial.cpp b/src/common/serial.cpp 
87c87,88 
< #include <stropts.h> 
--- 
> //#include <stropts.h> 
> #include <unistd.h> 
diff -r a/src/Makefile b/src/Makefile 
42,43c42,44 
< cxxflags =" $(CXXOPT)" ldflags =" -lpthread"> export CXX = g++34 
> export CXXFLAGS = $(CXXOPT) -D$(OS) -Wall -Wno-deprecated -fPIC 
> export LDFLAGS = -lpthread $(LDOPT) -g
```

> The reason for this is missing of stopts.h and gcc compatibly. you can change that include to unistd.h. And change CXX compiler to g++34.

