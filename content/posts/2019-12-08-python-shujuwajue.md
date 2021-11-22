---
layout: post
title: "python 数据挖掘"
date: 2019-12-08 23:14:00 +0800
categories: ["Python"]
tags: ["Python"]
---


![](http://static.ziying.site/博客图片/20210126225510.webp)



# 数据挖掘概况

1. 数据挖掘定义

数据挖掘是指从大量的数据中，通过统计学、人工智能、机器学习等方法挖掘出未知的且具有价值的信息和知识的过程。

2. 数据挖掘和数据分析的区别

| 项目 | 数据分析 | 数据挖掘 |
| -- | -- | -- |
| 定义 | 根据分析的目的，使用适当的分析方法及工具，对收集来的数据进行处理和分析，提取有价值的信息，发挥数据的作用 | 从大量的数据中，通过统计学、人工智能、机器学习等方法，挖掘出未知的、且具有价值的信息和知识的过程 |
| 作用 | 现状分析、原因分析、预测分析 | 解决四类问题：分类、聚类、关联、预测 |
| 方法 | 对比分析、分组分析、交叉分析、回归分析等 | 决策树、神经网络、关联规则、聚类分析等 |
| 结果 | 指标统计量结果，如总和、平均值 | 输出模型或者规则 |

3. 模型与算法

- 模型：定量（数学公式），定性：规则（年龄>30岁，收入>1万元）
- 算法：实现数据挖掘的技术、模型的具体步骤与方法

## 数据挖掘常见的问题

![屏幕快照 2019-07-21 下午1.37.03.png](https://upload-images.jianshu.io/upload_images/2607842-ff05764678fe803c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


-  分类特点
    - 分类型目标变量（Y）——有监督分类
    - 使用已知目标分类历史的样本来训练
    - 需要对未知分类的样本预测所属的分类

常见的分类方法：决策树、贝叶斯、KNN、支持向量机、神经网络、逻辑回归……

- 聚类特点
    - 无分类目标变量——无监督分类
    - 物以类聚的思想

常见的聚类算法：划分聚类、层次聚类、密度聚类、网格聚类、基于模型聚类……

- 关联特点
    - 无目标变量——无监督分类
    - 基于数据项关联，识别频繁发生的模式

关联常见的算法：Aprior算法、Carma算法、序列算法

- 预测特点
    - 数值型目标变量——有监督分类
    - 须有已知目标值的的历史样本来训练模型
    - 对未知的样本预测其的目标值

常见预测方法：简单线性回归分析、多重线性回归分析、时间序列。

## 数据挖掘流程

# 文本分析
## 词频统计 - 语料库的构建

语料库：使我们要分析的所有文档的集合

```python

# -*- coding: utf-8 -*-
import os
import os.path

filePaths = []
for root, dirs, files in os.walk("./Sample"):
    for name in files:
        filePaths.append(os.path.join(root, name))


import codecs

filePaths = [];
fileContents = [];
for root, dirs, files in os.walk(
    "D:\\PDM\\2.1\\SogouC.mini\\Sample"
):
    for name in files:
        filePath = os.path.join(root, name);
        filePaths.append(filePath);
        f = codecs.open(filePath, 'r', 'utf-8')
        fileContent = f.read()
        f.close()
        fileContents.append(fileContent)

import pandas;
corpos = pandas.DataFrame({
    'filePath': filePaths,
    'fileContent': fileContents
})
```
## 词频统计 - 中文分词

中文分词是指将一个汉字序列切分为一个个单独的词

停用词是指数据处理时需要过滤掉的词

```python
# -*- coding: utf-8 -*-

import jieba;

for w in jieba.cut("我爱Python"):
    print(w)

for w in jieba.cut("""
    工信处女干事
    每月经过下属科室都要亲口交代
    24口交换机等技术性器件的安装工作
"""):
    print(w)
#http://pinyin.sogou.com/dict/

seg_list = jieba.cut(
    "真武七截阵和天罡北斗阵哪个更厉害呢？"
)
for w in seg_list:
    print(w)

jieba.add_word('真武七截阵')
jieba.add_word('天罡北斗阵')
seg_list = jieba.cut(
    "真武七截阵和天罡北斗阵哪个更厉害呢？"
)
for w in seg_list:
    print(w)

jieba.load_userdict('./金庸武功招式.txt');

import os;
import os.path;
import codecs;

filePaths = [];
fileContents = [];
for root, dirs, files in os.walk("./Sample"):
    for name in files:
        filePath = os.path.join(root, name);
        filePaths.append(filePath);
        f = codecs.open(filePath, 'r', 'utf-8')
        fileContent = f.read()
        f.close()
        fileContents.append(fileContent)

import pandas;
corpos = pandas.DataFrame({
    'filePath': filePaths,
    'fileContent': fileContents
});

import jieba

segments = []
filePaths = []
for index, row in corpos.iterrows():
    filePath = row['filePath']
    fileContent = row['fileContent']
    segs = jieba.cut(fileContent)
    for seg in segs:
        segments.append(seg)
        filePaths.append(filePath)

segmentDataFrame = pandas.DataFrame({
    'segment': segments,
    'filePath': filePaths
});

```

## 词频统计 - 实现

词频是指某个词在该文档中出现的次数。

```python
# -*- coding: utf-8 -*-
import os;
import os.path;
import codecs;

filePaths = [];
fileContents = [];
for root, dirs, files in os.walk(
    "D:\\PDM\\2.3\\SogouC.mini\\Sample"
):
    for name in files:
        filePath = os.path.join(root, name);
        filePaths.append(filePath);
        f = codecs.open(filePath, 'r', 'utf-8')
        fileContent = f.read()
        f.close()
        fileContents.append(fileContent)

import pandas;
corpos = pandas.DataFrame({
    'filePath': filePaths,
    'fileContent': fileContents
});

import jieba

segments = []
filePaths = []
for index, row in corpos.iterrows():
    filePath = row['filePath']
    fileContent = row['fileContent']
    segs = jieba.cut(fileContent)
    for seg in segs:
        segments.append(seg)
        filePaths.append(filePath)

segmentDataFrame = pandas.DataFrame({
    'segment': segments,
    'filePath': filePaths
});


import numpy;
#进行词频统计        
segStat = segmentDataFrame.groupby(
            by="segment"
        )["segment"].agg({
            "计数":numpy.size
        }).reset_index().sort(
            columns=["计数"],
            ascending=False
        );

#移除停用词
stopwords = pandas.read_csv(
    "D:\\PDM\\2.3\\StopwordsCN.txt",
    encoding='utf8',
    index_col=False
)

fSegStat = segStat[
    ~segStat.segment.isin(stopwords.stopword)
]


import jieba

segments = []
filePaths = []
for index, row in corpos.iterrows():
    filePath = row['filePath']
    fileContent = row['fileContent']
    segs = jieba.cut(fileContent)
    for seg in segs:
        if seg not in stopwords.stopword.values and len(seg.strip())>0:
            segments.append(seg)
            filePaths.append(filePath)

segmentDataFrame = pandas.DataFrame({
    'segment': segments,
    'filePath': filePaths
});

segStat = segmentDataFrame.groupby(
            by="segment"
        )["segment"].agg({
            "计数":numpy.size
        }).reset_index().sort(
            columns=["计数"],
            ascending=False
        );

```

