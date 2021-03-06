---
layout: post
title: "m3u8 视频下载（media downloader 使用说明）"
date: 2021-02-06 20:23:00 +0800
categories: ["我的开源软件"]
tags: ["electron", "m3u8", "流媒体下载", "m3u8 download"]
---

### 软件下载【暂时仅支持 windows】

- 【2021.03.07 v1.0.1】 
  [media-downloader-windows-v1.0.1.exe](http://static.ziying.site/media-downloader-1.0.1%20Setup.exe)
- 【2021.02.21 v1.0.0】 
   [media-downloader-windows-v1.0.0.exe](http://static.ziying.site/media-downloader-1.0.0%20Setup.exe)


### 使用说明

1. 首先选择文件下载路径，配置完成之后再选择执行程序，提供两种选项
    - mediago: 源码地址[github](https://github.com/caorushizi/mediago)，使用go开发，支持windows和mac
    - N_m3u8DL-CLI: 源码地址[github](https://github.com/nilaoda/N_m3u8DL-CLI)，使用C#开发暂时仅支持windows
2. 其他选项
   - 第一种方式：可以使用浏览器抓包，获取抓包后的m3u8地址，填上视频的名称。
   - **第二种方式：可以使用打开浏览器，再页面地址栏中输入想要观看的视频，届时首页中会出现m3u8链接地址，点击可以带出请求地址、请求标头和视频名称。（推荐）**
   
   ![操作说明-1.png](http://static.ziying.site/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/bf6887d0-7f1d-11eb-8231-759fb278b8a8.png)
   ![操作说明-2.png](http://static.ziying.site/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/52149880-7f1e-11eb-8231-759fb278b8a8.png)
3. 点击开始下载即可。

### 源码地址
[Github：https://github.com/caorushizi/media-downloader](https://github.com/caorushizi/media-downloader)

<div style="color:red;font-size:30px;font-weight: bold;">使用中有什么问题欢迎在下面评论区留言</div>
