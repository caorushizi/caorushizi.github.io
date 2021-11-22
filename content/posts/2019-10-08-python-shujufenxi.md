---
layout: post
title: "python 数据分析"
date: 2019-10-08 23:14:00 +0800
categories: ["Python"]
tags: ["Python"]
---


![](http://static.ziying.site/博客图片/20210126225419.webp)

# python与数据分析概况

## 数据分析概况

- 数据分析，是指用**适当的**分析方法，对收集的数据进行分析，总结规律，提取有价值的信息，形成有效结论的过程。

- 数据分析的作用
    - 现状分析
    - 原因分析
    - 预测分析

- 数据分析的流程
    1. 明确目的和思路
      - 做任何事情都要有目标，一切都要以解决问题为中心
      - 搭建分析框架，确定从哪几个角度，用那些指标进行分析
    2. 数据准备
      - 主要数据来源有数据库、公开出版物、互联网以及市场调查
    3. 数据处理
      - 数据处理是指对收集到的数据进行加工整理，形成适合数据分析的样式，是数据分析必不可少的阶段
    4. 数据分析
      - 基础分析方法：对比分析、分组分析、结构分析、分布分析、交叉分析、矩阵分析等方法；
      - 高级分析方法：回归分析、聚类分析、决策树、神经网络、因子分析、时间序列分析等方法；
    5. 数据展示
      - 数据分析结果主要通过表格和图形的方式来呈现，即用图表说话
    6. 报告撰写
      - 数据分析报告是对整个数据分析的过程的一个总结和呈现，通过报告，把数据分析的起因、过程、结果以及建议完整诚信出来，供决策者参考

## python 概况（3W2H法）


- What：什么是python： 一种免费的、自由的编程语言，是一款强大的数据分析、数据挖掘的工具。
- Who：谁在使用python：系统应用、互联网、统计分析、数据挖掘、数据可视化等
- Why：为什么使用python：python之一种解释性、动态语言，具有明确而高效的语法；python不断地从其他优秀的数学软件引入高效的数据开发包；python被称为可执行的伪代码，有着优美的代码风格。
- How：如何学习python
- How Continue：如何持续地去提高python的技能：实战案例，熟练操作；理解算法，实战操作。

# python 安装

## 安装anaconda
## 使用anaconda
   
# 数据准备
## python 数据类型

1. 定义：按照python定义的格式，将数据的数据类型告知python；

  ```python
  1  '1'   True   False
  ```
2. 赋值：将定义好的数据，传递给变量的类型；

  ```python
  a = 1, b = True, c = 2
  ```

3. 变量：数据赋值的对象，通过变量去操作数据；
  ```python
  d = a * c, b = 3
  ```

## 变量的命名规则

1. 由a-z，A-Z，数字，下划线（\_）组成，首字母不能为数字和下划线（\_）；
2. 大小写敏感，变量a和变量A是不同的变量；
3. 变量名不能为python中的保留字；

```python
# python 中的保留字
and or not assert finally exec break
for pass class from print continue global
raise def if return del import try elif
in while else is with except lambda yield
```


## 三种常用的数据类型

|类型|注释|
|--|--:|
|Logical|逻辑型|
|Numberic|数值型|
|Character|字符型|

1. Logical逻辑型：布尔型，只有两种取值（0和1、真和假）

  | 值 | 注释 |
  |--|--:|
  | True | 真 |
  | False | 假 |

  运算规则

  | 运算符 | 注释 | 运算规则 |
  |-- |--: |--:|
  | & | 与 | 两个逻辑型数据中，一个逻辑型数据为假，则结果为假 |
  | \| | 或 | 两个逻辑型数据中，一个逻辑型数据为真，则结果为真 |
  | not | 非 | 取相反值，真非为假，假非为真 |

2. Numberic 数值型：实数，包含正数负数和0

  运算规则

  | 运算符 | 注释 | 运算规则 |
  |-- |--: |--:|
  | + | 加 |  |
  | - | 减 |  |
  | * | 乘 |  |
  | / | 除 |  |

3. Character字符型

  character字符型：字符型数据代表了所有可定义的字符；

  定义方式：使用''或者""或者""" """将其包含起来即可；

  运算规则：无；

## 数据结构

数据结构是指相互之间存在一种后者多种特定关系十数据类型的集合

| 类型 | 注释 |
|--|--:|
| Series | 序列 |
| DataFrame | 数据框 |



1. Series序列：序列是用来储存一行或者一列数据，以及与之相关的索引的集合

```python
from pandas import Series

x = Series(['a', True, 1])

x = Series(['a', True, 1], index=['first','second','third'])

x[1]

x['second']

# 向序列中追加值
x = x.append(Series([2]))

# 判断值是否序列中
'2' in x.values

# 切片
x[1: 3]

# 定位获取，这个方法经常用于随机抽样
x[[0, 2, 1]]

# 根据index删除
x.drop(0)
x.drop('index')

# 根据位置删除
x.drop(x.index(3))

#根据值删除
x['2'!=x.values]

```

2. DataFrame数据框：数据框适用于多行和多列的数据集合

数据框的概念图解

![屏幕快照 2019-07-20 下午5.28.22.png](https://upload-images.jianshu.io/upload_images/2607842-6f7814f64e4e9d47.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```python
from pandas import DataFrame

df = DataFrame({
    'age': [21, 22, 23],
    'name': ['KEN', 'John', 'JIMI']
})

df = DataFrame(
    data={
        'age': [21, 22, 23],
        'name': ['KEN', 'John', 'JIMI']
    },
    index=['first', 'second', 'third']
)

#按列访问
df['age']

df[['age', 'name']]

#按行访问
df[1:2]

#按行索引访问
df.loc[['first', 'second']]

#按行列号访问
df.iloc[0:1, 0:1]

#按行索引，列名访问
df.at['first', 'name']

#修改列名
df.columns
df.columns=['age2', 'name2']

#修改行索引
df.index
df.index = range(1,4)
df.index

#根据行索引删除
df.drop(1, axis=0)
#默认参数axis=0
#根据列名进行删除
df.drop('age2', axis=1)

#增加行，
#注意，这种方法，
#效率非常低，
#不应该用于遍历中
df.loc[len(df)] = [24, "KENKEN"]

#增加列
df['newColumn'] = [2, 4, 6]
```
## 向量化运算

定义：向量化运算是一种特殊的并行计算的方式，他可以在同一时间执行多次操作，通常是对不同的数据执行同样的一个或者一批指令，或者把指令应用于同一个数组（向量）。

1. 生成等差数列

```python
numpy.arange('开始值', '结束值', '步长')
```

2. 四则运算

规则：相同位置的数据进行运算，结果保留在相同的位置

3. 函数运算

规则：相同位置的数据进行函数的计算，函数返回结果留在相同的位置

4. 向量化运算的原则

原则：代码中尽可能避免显式的for循环，过早优化是魔鬼。

```python
# -*- coding: utf-8 -*-

#生成一个整数的等差序列
#局限，只能用于遍历
r1_10 = range(1, 10, 2)

for i in r1_10:
    print(i)

r1_10 = range(0.1, 10, 2)


#生成一个小数的等差序列
import numpy
numpy.arange(0.1, 0.5, 0.01)

r = numpy.arange(0.1, 0.5, 0.01)

#向量化计算，四则运算
r + r
r - r
r * r
r / r

#函数式的向量化计算
numpy.power(r, 5)

#向量化运算，比较运算
r>0.3
#结合过滤进行使用
r[r>0.3]

#矩阵运算
numpy.dot(r, r.T)

sum(r*r)

from pandas import DataFrame
df = DataFrame({
    'column1': numpy.random.randn(5),
    'column2': numpy.random.randn(5)
})

df.apply(min)

df.apply(min, axis=1)

#判断每个列，值是否都大于0
df.apply(
    lambda x: numpy.all(x>0),
    axis=1
)
#结合过滤
df[df.apply(
    lambda x: numpy.all(x>0),
    axis=1
)]

```

# 数据处理
## 数据导入、数据导出

1. 数据存在的形式

| 类型 | 存储形式 | 备注 |
| :--: | :--: | :--: |
| 文件 | CSV | 用“，”分割列的文件 |
| 文件 |Excel | 微软办公软件Excel文件 |
| 文件 | TXT | 普通文本文件 |
| 文件 | 。。。 | 其他数据 |
| 数据库 | MySQL | 广泛使用的免费开源数据库 |
| 数据库 | Access | 微软办公软件Access |
| 数据库 | SQL Server | 微软企业级数据库 |
| 数据库 | 。。。 | 其他数据库 |


2. 数据导入

- 导入CSV文件

使用read_csv函数导入CSV文件

```python
from pandas import read_csv

df = read_csv('./1.csv')

```

- 导入文本文件

使用read_table函数导入普通文本文件

| 参数 | 注释 |
| :--: | :--: |
| file | 文件路径 |
| names | 列名，默认为文件中第一行作为列名 |
| sep | 分隔符，默认为空，表示默认导入一列 |
| encoding | 设置文件编码，再导入中文的时候需要设置为UTF-8 |

```python
from pandas import read_table

df = read_table('./2.txt')

df = read_table(
    './2.txt',
    names=['age', 'name'],
    sep=','
)
```

- 导入Excel文件

使用read_excel函数导入Excel文件

| 参数 | 注释 |
| :--: | :--: |
| filename | 文件路径 |
| sheetname | Sheet的名字 |
| names | 列名，默认为文件中第一行作为列名 |

```python
from pandas import read_excel;

df = read_excel(
    './3.xlsx',
    sheetname='data'
)
```

3. 数据导出

- 导出文本文件

使用to_csv导出文本文件

| 参数 | 注释 |
| --: | --: |
| filepath | 导出文件的默认路径 |
| sep | 分隔符，默认使用“，” |
| index | 是否导出行序号，默认True |
| header | 是否导出列名，默认为True |

```python
from pandas import DataFrame;

df = DataFrame({
    'age': [21, 22, 23],
    'name': ['KEN', 'John', 'JIMI']
})

df.to_csv("./df.csv")

df.to_csv("./df.csv", index=False)
```

## 重复值处理

把数据结构中，行相同数据只保留一行

```python
from pandas import read_csv

df = read_csv('./data.csv')

df

#找出行重复的位置
dIndex = df.duplicated()

#根据某些列，找出重复的位置
dIndex = df.duplicated('id')
dIndex = df.duplicated(['id', 'key'])

#根据返回值，把重复数据提取出来
df[dIndex]

#直接删除重复值
#默认根据所有的列，进行删除
newDF = df.drop_duplicates()
#当然也可以指定某一列，进行重复值处理
newDF = df.drop_duplicates('id')
```

## 缺失值处理

缺失值的产生：有些信息暂时无法获取，有些信息被遗漏或者错误处理了

缺失值的处理方式：数据补齐，删除对应确实行，不处理

```python
from pandas import read_csv

df = read_csv('./data.csv')

df = read_csv('./data2.csv', na_values=['a','b'])

#找出空值的位置
isNA = df.isnull()

#获取出空值所在的行
df[isNA.any(axis=1)]
df[isNA[['key']].any(axis=1)]
df[isNA[['key', 'value']].any(axis=1)]

df.fillna('未知')

#直接删除空值
newDF = df.dropna()
```

## 空格值处理

清除字符型数据左右的空格

```python
from pandas import read_csv

df = read_csv('./data.csv')

newName = df['name'].str.lstrip()

newName = df['name'].str.rstrip()

newName = df['name'].str.strip()

df['name'] = newName

```

## 字段抽取

是根据已知列数据的开始和结束位置，抽取出新的列
<!-- more -->

```python
from pandas import read_csv

df = read_csv('./data.csv')

df['tel'] = df['tel'].astype(str)

#运营商
bands = df['tel'].str.slice(0, 3)
#地区
areas = df['tel'].str.slice(3, 7)
#号码段
nums = df['tel'].str.slice(7, 11)

#赋值回去
df['bands'] = bands
df['areas'] = areas
df['nums'] = nums
```
## 字段拆分

字段拆分是指按照固定的字符，拆分已有的字符

split(sep, n, expand=False)

- sep：用于分割字符串
- n：分割为多少列
- expand：是否展开数据框，默认为False

返回值：

- 如果expand为True，则返回DataFrame
- 如果expand为False，则返回series

```python
from pandas import read_csv

df = read_csv('./data.csv')

newDF = df['name'].str.split(' ', 1, True)

newDF.columns = ['band', 'name']
```

## 记录抽取

记录抽取是指根据一定的条件，对数据进行抽取。

dataframe[condition]

常用的条件类型
- 比较运算：大于（>），小鱼（<），大于等于（>=），小于等于（<=），不等于（!=）
- 范围运算：between(left, right)
- 空值匹配：pandas.isnull(colunm)
- 字符匹配：str.contains(patten, na=False)
- 逻辑运算：与（&），或（|），取反（not）

<!-- more -->

```python
import pandas

df = pandas.read_csv('./data.csv', sep="|")

#单条件
df[df.comments>10000]
#多条件
df[df.comments.between(1000, 10000)]
#过滤空值所在行
df[pandas.isnull(df.title)]
#根据关键字过滤
df[df.title.str.contains('台电', na=False)]
#~为取反
df[~df.title.str.contains('台电', na=False)]
#组合逻辑条件
df[(df.comments>=1000) & (df.comments<=10000)]
```
## 随机抽样

随机抽样是指随机从数据中按照一定的行数或者比例抽取数据

随机抽样函数：DataFrame.sample(n, frac, replace=False)
- n：按个数抽样
- frac：按百分比抽样
- replace：是否可放回抽样，默认False不可放回

<!-- more -->

```python
# -*- coding: utf-8 -*-
import numpy
import pandas

data = pandas.read_csv('./data.csv')

#设置随机种子
numpy.random.seed(seed=2)

#按照个数抽样
data.sample(n=10)
#按照百分比抽样
data.sample(frac=0.02)
#是否可放回抽样，
#replace=True，可放回,
#replace=False，不可放回
data.sample(n=10, replace=True)


#典型抽样，分层抽样
gbr = data.groupby("class")

gbr.groups

typicalNDict = {1: 2, 2: 4, 3: 6}

def typicalSampling(group, typicalNDict):
    name = group.name
    n = typicalNDict[name]
    return group.sample(n=n)

result = data.groupby(
    'class', group_keys=False
).apply(typicalSampling, typicalNDict)

typicalFracDict = {1: 0.2, 2: 0.4, 3: 0.6}

def typicalSampling(group, typicalFracDict):
    name = group.name
    frac = typicalFracDict[name]
    return group.sample(frac=frac)

result = data.groupby(
    'class', group_keys=False
).apply(typicalSampling, typicalFracDict)

```

## 记录合并

记录合并是指将两个结构相同的数据框合并成一个数据框。
<!-- more -->

```python
import pandas
from pandas import read_csv

data1 = read_csv('./data1.csv', sep="|")
data2 = read_csv('./data2.csv', sep="|")
data3 = read_csv('./data3.csv', sep="|")
data = pandas.concat([data1, data2, data3])

data = pandas.concat([
    data1[[0, 1]],
    data2[[1, 2]],
    data3[[0, 2]]
])

```

## 字段合并

字段合并是指将同一个数据框中的不同列进行合并，型号才能新的列。

```python
from pandas import read_csv

df = read_csv(
    './data.csv',
    sep=" ",
    names=['band', 'area', 'num']
)

df = df.astype(str)

tel = df['band'] + df['area'] + df['num']

df['tel'] = tel

```
## 字段匹配

字段匹配是指根据各表的关键字段把各表所需的记录下来一一对应起来

merge(x, y, left_on, right_on)
- x：第一个数据框
- y：第二个数据框
- left_on：第一个数据框用于匹配的列
- right_on：第二个数据框用于匹配的列

```python
import pandas

items = pandas.read_csv(
    './data1.csv',
    sep='|',
    names=['id', 'comments', 'title']
)

prices = pandas.read_csv(
    './data2.csv',
    sep='|',
    names=['id', 'oldPrice', 'nowPrice']
)

#默认只是保留连接上的部分
itemPrices = pandas.merge(
    items,
    prices,
    left_on='id',
    right_on='id'
)

#即使连接不上，也保留左边没连上的部分
itemPrices = pandas.merge(
    items,
    prices,
    left_on='id',
    right_on='id',
    how='left'
)

#即使连接不上，也保留右边没连上的部分
itemPrices = pandas.merge(
    items,
    prices,
    left_on='id',
    right_on='id',
    how='right'
)

#即使连接不上，也保留所有没连上的部分
itemPrices = pandas.merge(
    items,
    prices,
    left_on='id',
    right_on='id',
    how='outer'
)

```

## 简单计算

简单计算是指通过对已有字段的加减乘除等运算得出新的字段
<!-- more -->

```python
import pandas

data = pandas.read_csv('./data.csv', sep="|")

data['total'] = data.price * data.num

#注意，用点的方式，虽然可以访问，但是并没有组合进数据框中
data = pandas.read_csv('./data.csv', sep="|")

data.total = data.price * data.num
```
## 数据标准化

数据标准化是指将数据按比例缩放，使之落入到特定的区间之中

```python
import pandas

data = pandas.read_csv('./data.csv')

data['scale'] = round(
    (data.score-data.score.min())/(data.score.max()-data.score.min())
    , 2
)

```

## 数据分组

数据分组是指根据分析对象的特征，按照一定的数值指标，把数据分析对象划分为不同的区间进行研究，以揭示其内在的联系和规律。

cut函数：cut(series, bins, right=True, labels=None)
- series：需要分组的数据
- bins：分组的划分数组
- right：分组的时候右边是否闭合
- labels：分组的自定义标签，可以不自定义

```python
import pandas

data = pandas.read_csv('./data.csv', sep='|')

bins = [
    min(data.cost)-1, 20, 40, 60,
    80, 100, max(data.cost)+1
]

data['cut'] = pandas.cut(data.cost, bins)

data['cut'] = pandas.cut(data.cost, bins, right=False)

labels = [
    '20以下', '20到40', '40到60',
    '60到80', '80到100', '100以上'
]

data['cut'] = pandas.cut(
    data.cost, bins,
    right=False, labels=labels
)

```

## 时间处理

时间处理是指字符型的时间格式数据，转换成为时间型数据的过程。
<!-- more -->

```python
import pandas

data = pandas.read_csv('./data.csv', encoding='utf8')

data['时间'] = pandas.to_datetime(
    data.注册时间,
    format='%Y/%m/%d'
)

data['格式化时间'] = data.时间.dt.strftime('%Y-%m-%d')

data['时间.年'] = data['时间'].dt.year
data['时间.月'] = data['时间'].dt.month
data['时间.周'] = data['时间'].dt.weekday
data['时间.日'] = data['时间'].dt.day
data['时间.时'] = data['时间'].dt.hour
data['时间.分'] = data['时间'].dt.minute
data['时间.秒'] = data['时间'].dt.second

```

## 时间抽取

时间抽取是指根据一定条件，对时间格式的数据进行抽取。

```python
# -*- coding: utf-8 -*-
import pandas

data = pandas.read_csv('./data.csv', encoding='utf8')

dateparse = lambda dates: pandas.datetime.strptime(
    dates, '%Y%m%d'
)

data = pandas.read_csv(
    './data.csv',
    encoding='utf8',
    parse_dates=['date'],
    date_parser=dateparse,
    index_col='date'
)

#根据索引进行抽取
import datetime

dt1 = datetime.date(year=2016,month=2,day=1);
dt2 = datetime.date(year=2016,month=2,day=5);

data.ix[dt1: dt2]
data.ix[[dt1,dt2]]

#根据时间列进行抽取
data = pandas.read_csv(
    './data.csv',
    encoding='utf8',
    parse_dates=['date'],
    date_parser=dateparse,
)

data[(data.date>=dt1) & (data.date<=dt2)]

```
## 虚拟变量

虚拟变量也叫哑变量和离散特征编码，可用来表示分类变量、非数量因素可能产生的影响。

- 离散特征的取值之间有大小的意义：例如尺寸（L,XL,XXL）

    pandas.Series.map(dict)

- 离散特征的取值之间没有大小的意义：例如颜色（红色，蓝色，绿色）

    pandas.get_dummies(data, prefix=None, prefix_sep='', dummy_na=False, columns=None, drop_first=False)

    - data：要处理的dataframe
    - prefix：列名的前缀在多个列有相同的离散项时候使用
    - prefix_sep：前缀和离散值得分隔符，默认为下划线，默认即可
    - dummy_na：是否把NA值，作为一个离散值进行处理，默认不处理
    - columns：要处理的列名如果不指定该列，那默认处理所有列
    - drop_first：是否从备用选项中删除第一个，建模的时候为避免共线性使用

```python
# -*- coding: utf-8 -*-
import pandas

data = pandas.read_csv('./data.csv', encoding='utf8')

data['Education Level'].drop_duplicates()

"""
博士后    Post-Doc
博士      Doctorate
硕士      Master's Degree
学士      Bachelor's Degree
副学士    Associate's Degree
专业院校  Some College
职业学校  Trade School
高中      High School
小学      Grade School
"""
educationLevelDict = {
    'Post-Doc': 9,
    'Doctorate': 8,
    'Master\'s Degree': 7,
    'Bachelor\'s Degree': 6,
    'Associate\'s Degree': 5,
    'Some College': 4,
    'Trade School': 3,
    'High School': 2,
    'Grade School': 1
}

data['Education Level Map'] = data[
    'Education Level'
].map(
    educationLevelDict
)

data['Gender'].drop_duplicates()

dummies = pandas.get_dummies(
    data,
    columns=['Gender'],
    prefix=['Gender'],
    prefix_sep="_",
    dummy_na=False,
    drop_first=False
)

dummies['Gender'] = data['Gender']

```
# 数据分析
## 基本统计
基本统计分析：描述性统计分析，用来概括失误整体情况以及事物之间的联系（即事物的基本特征），以发现其内在规律的统计分析方法

常用统计指标



- 计数
- 求和
- 平均值
- 方差
- 标准差

```python
import pandas

data = pandas.read_csv('./data.csv')

data.score.describe()

data.score.size
data.score.max()
data.score.min()
data.score.sum()
data.score.mean()
data.score.var()
data.score.std()

#累计求和
data.score.cumsum()

#最大值和最小值所在位置
data.score.argmin()
data.score.argmax()

data.score.quantile(
    0.3,
    interpolation="nearest"
)

```

## 分组分析

分组分析是指根据分组字段，将分析对象划分为不同部分，以进行对比分析各组之间的差异性的一种分析方法。

常用的统计指标
- 计数
- 求和
- 平均值

```python
import numpy
import pandas

data = pandas.read_csv('./data.csv')

aggResult = data.groupby(
    by=['class']
)['score'].agg({
    '总分': numpy.sum,
    '人数': numpy.size,
    '平均值': numpy.mean
})

```
## 分布分析

分布分析是指根据分析目的，将数据（定量数据）进行等距后者不等距的分组，进行研究各组分布规律的一种分析方法。

```python
import numpy
import pandas

data = pandas.read_csv('./data.csv')

bins = [
    min(data.年龄)-1, 20, 30, 40, max(data.年龄)+1
]
labels = [
    '20岁以及以下', '21岁到30岁', '31岁到40岁', '41岁以上'
]

data['年龄分层'] = pandas.cut(
    data.年龄,
    bins,
    labels=labels
)

aggResult = data.groupby(
    by=['年龄分层']
)['年龄'].agg({
    '人数': numpy.size
})

pAggResult = round(
    aggResult/aggResult.sum(),
    2
)*100
pAggResult['人数'].map('{:,.2f}%'.format)

```

## 交叉分析

交叉分析是指分析两个或者两个以上的分组变量之间的关系，已交叉表的形式进行变量之间的对比分析。



交叉计数函数：pivot_table(values, index, columns, aggfunc, fill_value)
- values：数据透视表中的值
- index：数据透视表中的行
- columns：数据统计表中的列
- aggfunc：统计函数
- fill_value：NA值得统一替换

```python
import numpy
import pandas

data = pandas.read_csv('./data.csv')

bins = [
    min(data.年龄)-1, 20, 30, 40, max(data.年龄)+1
]
labels = [
    '20岁以及以下', '21岁到30岁', '31岁到40岁', '41岁以上'
]

data['年龄分层'] = pandas.cut(
    data.年龄,
    bins,
    labels=labels
)

ptResult = data.pivot_table(
    values=['年龄'],
    index=['年龄分层'],
    columns=['性别'],
    aggfunc=[numpy.size]
)

```
## 结构分析

结构分析是指在分组以及交叉的基础之上，计算各组成部分所占的比重，进而分析总体的内部特征的一种分析方法。

```python
import numpy
import pandas

data = pandas.read_csv('./data.csv')

bins = [
    min(data.年龄)-1, 20, 30, 40, max(data.年龄)+1
]
labels = [
    '20岁以及以下', '21岁到30岁', '31岁到40岁', '41岁以上'
]

data['年龄分层'] = pandas.cut(
    data.年龄,
    bins,
    labels=labels
)

ptResult = data.pivot_table(
    values=['年龄'],
    index=['年龄分层'],
    columns=['性别'],
    aggfunc=[numpy.size]
)

ptResult.sum()
# 0 按列运算
ptResult.sum(axis=0)
# 1 按行运算
ptResult.sum(axis=1)
ptResult.div(ptResult.sum(axis=1), axis=0)
ptResult.div(ptResult.sum(axis=0), axis=1)

```
## 相关分析

相关分析是指研究两个或者两个以上的随机变量之间相互依存关系的方向和密切程度的方法。

线性相关主要采用皮尔逊相关系数r来度量连续变量之间线性相关强度。
- 0<=|r|<0.3 低度相关
- 0.3<=|r|<0.8 中度相关
- 0.8<=|r|<=1 高度相关

```python
# -*- coding: utf-8 -*-
import pandas

data = pandas.read_csv('./data.csv')

#先来看看如何进行两个列之间的相关度的计算
data['人口'].corr(data['文盲率'])

#多列之间的相关度的计算方法
#选择多列的方法
data[[
    '超市购物率', '网上购物率', '文盲率', '人口'
]]

data[[
    '超市购物率', '网上购物率', '文盲率', '人口'
]].corr()

```

## RFM分析

RFM分析是根据客户活跃度和交易金额贡献，进行客户价值的细分的一种方法；



- R：客户最近交易的时间间隔
- F：客户最近的交易次数
- M：客户最近的交易金额

```python
import numpy
import pandas

data = pandas.read_csv('./data.csv')

data['DealDateTime'] = pandas.to_datetime(
    data.DealDateTime,
    format='%Y/%m/%d'
)

data['DateDiff'] = pandas.to_datetime(
    'today'
) - data['DealDateTime']

data['DateDiff'] = data['DateDiff'].dt.days

R_Agg = data.groupby(
    by=['CustomerID']
)['DateDiff'].agg({
    'RecencyAgg': numpy.min
})

F_Agg = data.groupby(
    by=['CustomerID']
)['OrderID'].agg({
    'FrequencyAgg': numpy.size
})

M_Agg = data.groupby(
    by=['CustomerID']
)['Sales'].agg({
    'MonetaryAgg': numpy.sum
})

aggData = R_Agg.join(F_Agg).join(M_Agg)

bins = aggData.RecencyAgg.quantile(
    q=[0, 0.2, 0.4, 0.6, 0.8, 1],
    interpolation='nearest'
)
bins[0] = 0
labels = [5, 4, 3, 2, 1]
R_S = pandas.cut(
    aggData.RecencyAgg,
    bins, labels=labels
)

bins = aggData.FrequencyAgg.quantile(
    q=[0, 0.2, 0.4, 0.6, 0.8, 1],
    interpolation='nearest'
)
bins[0] = 0;
labels = [1, 2, 3, 4, 5];
F_S = pandas.cut(
    aggData.FrequencyAgg,
    bins, labels=labels
)

bins = aggData.MonetaryAgg.quantile(
    q=[0, 0.2, 0.4, 0.6, 0.8, 1],
    interpolation='nearest'
)
bins[0] = 0
labels = [1, 2, 3, 4, 5]
M_S = pandas.cut(
    aggData.MonetaryAgg,
    bins, labels=labels
)

aggData['R_S']=R_S
aggData['F_S']=F_S
aggData['M_S']=M_S

aggData['RFM'] = 100*R_S.astype(int) + 10*F_S.astype(int) + 1*M_S.astype(int)

bins = aggData.RFM.quantile(
    q=[
        0, 0.125, 0.25, 0.375, 0.5,
        0.625, 0.75, 0.875, 1
    ],
    interpolation='nearest'
)
bins[0] = 0
labels = [1, 2, 3, 4, 5, 6, 7, 8]
aggData['level'] = pandas.cut(
    aggData.RFM,
    bins, labels=labels
)

aggData = aggData.reset_index()

aggData.sort(
    ['level', 'RFM'],
    ascending=[1, 1]
)

aggData.groupby(
    by=['level']
)['CustomerID'].agg({
    'size':numpy.size
})

```

## 矩阵分析

矩阵分析是指根据事物的重要属性作为分析依据，进行关联分析，找出解决问题的一种方法。

```python

import pandas
import matplotlib
import matplotlib.pyplot as plt

mainColor = (42/256, 87/256, 141/256, 1);

#设置字体
font = {
    'family': 'SimHei',
    'size': 20    
}
matplotlib.rc('font', **font);


data = pandas.read_csv('./data.csv')

fig = plt.figure(
    figsize=(30, 20),
    dpi=80
)

sp = fig.add_subplot(111)

sp.set_xlim([
    0,
    data.GDP.max()*1.1
])
sp.set_ylim([
    0,
    data.population.max()*1.1
])

#关闭坐标轴、坐标轴的刻度值
#sp.axis('off')
sp.get_xaxis().set_ticks([])
sp.get_yaxis().set_ticks([])

#画点
sp.scatter(
    data.GDP, data.population,
    alpha=0.5, s=200, marker="o",
    edgecolors=mainColor, linewidths=5
)

#画均值线
sp.axvline(
    x=data.GDP.mean(),
    linewidth=1, color=mainColor
)
sp.axhline(
    y=data.population.mean(),
    linewidth=1, color=mainColor
)

sp.axvline(
    x=0,
    linewidth=3, color=mainColor
)
sp.axhline(
    y=0,
    linewidth=3, color=mainColor
)

sp.set_xlabel('GDP')
sp.set_ylabel('人口')

#画标签
data.apply(
    lambda row: plt.text(
            row.GDP,
            row.population,
            row.province,
            fontsize=15
        ),
    axis=1
)

plt.show()


```
# 数据可视化
## 散点图

散点图是指以一个变量为横坐标，另外一个坐标为纵坐标，利用散点的分布形态反应变量之间关系的一种图形。

散点图绘制函数：plot(x, y, '.', color=(r,g,b))
- x,y：X轴和Y轴的序列
- . o 表示小点还是大点
- color：散点的颜色可用rgb来定义，也可用英文字母定义

```python
# -*- coding: utf-8 -*-

import pandas
import matplotlib
import matplotlib.pyplot as plt

data = pandas.read_csv('./data.csv')

mainColor = (42/256, 87/256, 141/256, 1)

font = {
    'size': 20,
    'family': 'SimHei'
}
matplotlib.rc('font', **font)

#%matplotlib qt

#plt.grid(True)

#小点
plt.xlabel('广告费用', color=mainColor)
plt.ylabel('购买用户数', color=mainColor)
plt.tick_params(axis='x', colors=mainColor)
plt.tick_params(axis='y', colors=mainColor)
plt.plot(
    data['广告费用'],
    data['购买用户数'],
    '.', color=mainColor
)

#大点
plt.xlabel('广告费用', color=mainColor)
plt.ylabel('购买用户数', color=mainColor)
plt.tick_params(axis='x', colors=mainColor)
plt.tick_params(axis='y', colors=mainColor)
plt.plot(
    data['广告费用'],
    data['购买用户数'],
    "o", color=mainColor
)

```


## 折线图

折线图也成趋势图，它是用直线段将个数据点链接起来而组成的图形，以折线的方式显示数据变化的趋势。

折线绘图函数：plot(x, y, style, color, lonewidth)

- style：画线的样式
    - \- 连续的曲线
    - -- 连续的虚线
    - -. 连续带圆点的曲线
    - : 由点连成的曲线
    - . 小点，散点图
    - o 大点，散点图
    - ， 像素点（更小的点）的散点图
    - \* 五角星的点的散点图
- color：画线的颜色
- linewidth：线的宽度

```python
import pandas
import matplotlib
from matplotlib import pyplot as plt

data = pandas.read_csv('./data.csv')

#对日期格式进行转换
data['购买日期'] = pandas.to_datetime(
    data['日期']
)


mainColor = (42/256, 87/256, 141/256, 1);

font = {
    'size': 20,
    'family': 'SimHei'
}
matplotlib.rc('font', **font)

#%matplotlib qt

plt.xlabel(
    '购买日期',
    color=mainColor
)
plt.ylabel(
    '购买用户数',
    color=mainColor
)
plt.tick_params(
    axis='x',
    colors=mainColor
)
plt.tick_params(
    axis='y',
    colors=mainColor
)

#'-'	顺滑的曲线
plt.plot(
    data['购买日期'],
    data['购买用户数'],
    '-', color=mainColor
)

plt.title('购买用户数')
plt.show()

#设置线条粗细
plt.plot(
    data['购买日期'],
    data['购买用户数'],
    '-', color=mainColor,
    lineWidth=10
)

#'--'	虚线
plt.plot(data['购买日期'], data['购买用户数'], '--');
#'-.'	线加点
plt.plot(data['购买日期'], data['购买用户数'], '-.');
#':'	由点组成的曲线
plt.plot(data['购买日期'], data['购买用户数'], ':');
#'.'	散点图
plt.plot(data['购买日期'], data['购买用户数'], '.');
#','	像素点的散点图
plt.plot(data['购买日期'], data['购买用户数'], ',');
#'o'	大点的散点图
plt.plot(data['购买日期'], data['购买用户数'], 'o');
#'v'	下三角标记的散点图
plt.plot(data['购买日期'], data['购买用户数'], 'v');
#'^'	上上角标记的散点图
plt.plot(data['购买日期'], data['购买用户数'], '^');
#'<'	左角标记的散点图
plt.plot(data['购买日期'], data['购买用户数'], '<');
#'>'	右角标记的散点图
plt.plot(data['购买日期'], data['购买用户数'], '>');
#'1'	伞形下的标记散点图
#'2'	伞形上的标记散点图
#'3'	伞形左的标记散点图
#'4'	伞形右的标记散点图
plt.plot(data['购买日期'], data['购买用户数'], '4');
#'s'	正方形标记的散点图
plt.plot(data['购买日期'], data['购买用户数'], 's');
#'p'	五角形标记的散点图
plt.plot(data['购买日期'], data['购买用户数'], 'p');
#'*'	五角星标记的散点图
plt.plot(data['购买日期'], data['购买用户数'], '*');
#'h'	多边形标记的散点图
#'H'	hexagon2 marker
plt.plot(data['购买日期'], data['购买用户数'], 'h');
#'+'	plus marker
#'x'	x marker
#'D'	diamond marker
#'d'	thin_diamond marker
plt.plot(data['购买日期'], data['购买用户数'], 'D');
#'|'	vline marker
#'_'	hline marker
plt.plot(data['购买日期'], data['购买用户数'], '|');


```

## 饼图


饼图又称圆形图，是一个划分为几个扇形的圆形统计图，它能够直观的反映出来个体与总体之间的比例关系

绘制饼图的函数：pie(x, labels, colors, explode, autopct)
- x：绘制图形的序列
- labels：饼图各部分的标签的序列
- colors：饼图各部分的颜色
- explode：需要突出的块状序列
- autopct：饼图占比的显示格式，%.02f：保留两位小数

```python
# -*- coding: utf-8 -*-

import numpy
import pandas
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager

#%matplotlib qt
#设置不在交互式命令行绘图，在弹出新的窗口进行绘图

data = pandas.read_csv('./data.csv')

result = data.groupby(
    by=['通信品牌'],
    as_index=False
)['号码'].agg({
    '用户数': numpy.size
})

#设置长宽分辨率
plt.figure(figsize=(30, 30), dpi=80)

#使用绝对路径获取字体的名称的方法
fontProp = font_manager.FontProperties(
    fname="C:\\Windows\\Fonts\\FZSTK.TTF"
)
#设置字体
font = {
    'family': fontProp.get_name(),
    'size': 20
}
matplotlib.rc('font', **font)

#设置为横轴和纵轴等长的饼图
#也就是圆形的饼图，而非椭圆形的饼图
plt.axis('equal')

plt.pie(
    result['用户数'],
    labels=result['通信品牌'],
    autopct='%.2f%%'
)


#设置突出的部分
explode = (0.1, 0.2, 0.3)
plt.axis('equal')
plt.pie(
    result['用户数'],
    labels=result['通信品牌'],
    autopct='%.2f%%',
    explode=explode,
    startangle=67
)

plt.show()

```


## 柱形图

柱形图是一种以长方形的单位长度，根据数据大小绘制的统计图，用来比较两个或者两个以上的数据（时间或者类别）

柱状图的绘制函数：
- bar(left, height, width, color)
- barh(bottom, width, height, color)

1. 柱形图的绘制

```python
# -*- coding: utf-8 -*-

import numpy
import pandas
import matplotlib
from matplotlib import pyplot as plt

font = {
    'family' : 'SimHei'
}
matplotlib.rc('font', **font)

data = pandas.read_csv('./data.csv')

result = data.groupby(
    by=['手机品牌'],
    as_index=False
)['月消费（元）'].agg({
    '月消费': numpy.sum
})

#竖向柱形图
index = numpy.arange(
    result.月消费.size
)
plt.bar(index, result['月消费'])
plt.show()

#优化点1、配置颜色
mainColor = (42/256, 87/256, 141/256, 1)
plt.bar(
    index, result['月消费'],
    color=mainColor
)
plt.show()

#优化点2、配置X轴刻度
plt.bar(
    index, result['月消费'],
    color=mainColor
)
plt.xticks(index, result.手机品牌)
plt.show()

#优化点3、对数据排序后再绘图
sgb = result.sort_values(
    by="月消费",
    ascending=False
)
plt.bar(
    index, sgb.月消费,
    color=mainColor
)
plt.xticks(index, sgb.手机品牌)
plt.show()


#横向柱形图
plt.barh(
    index, sgb.月消费,
    color=mainColor
)
plt.yticks(index, sgb.手机品牌)
plt.show()

```

2. 分组柱形图
```python
# -*- coding: utf-8 -*-

import numpy
import pandas
import matplotlib
from matplotlib import pyplot as plt

font = {
    'family' : 'SimHei'
};
matplotlib.rc('font', **font);

data = pandas.read_csv('./data.csv')

result = data.pivot_table(
    values='月消费（元）',
    index='手机品牌',
    columns='通信品牌',
    aggfunc=numpy.sum
)

index = numpy.arange(len(result))
minColor = (42/256, 87/256, 141/256, 1/3)
midColor = (42/256, 87/256, 141/256, 2/3)
maxColor = (42/256, 87/256, 141/256, 3/3)

#使用排列的方式，把数据排列放好，即为多维条形图
plt.bar(
    index, result['全球通'],
    color=minColor, width=1/4
)
plt.bar(
    index+1/4, result['动感地带'],
    color=midColor, width=1/4
)
plt.bar(
    index+2/4, result['神州行'],
    color=maxColor, width=1/4
)
plt.xticks(index+1/3, result.index)
plt.legend(['全球通', '动感地带', '神州行'])
plt.show()

#优化一下，对数据进行一个排序
result = result.sort_values(
    by="神州行", ascending=False
)

plt.bar(
    index, result['神州行'],
    color=maxColor, width=1/4
)
plt.bar(
    index+1/4, result['动感地带'],
    color=midColor, width=1/4
)
plt.bar(
    index+2/4, result['全球通'],
    color=minColor, width=1/4
)
plt.xticks(index+1/3, result.index)
plt.legend(['神州行', '动感地带', '全球通'])
plt.show()

```

3. 堆积柱形图

```python
# -*- coding: utf-8 -*-

import numpy
import pandas
import matplotlib
from matplotlib import pyplot as plt

font = {
    'family' : 'SimHei'
}
matplotlib.rc('font', **font)

data = pandas.read_csv('./data.csv')

result = data.pivot_table(
    values='月消费（元）',
    index='手机品牌',
    columns='通信品牌',
    aggfunc=numpy.sum
)

index = numpy.arange(len(result))
minColor = (42/256, 87/256, 141/256, 1/3)
midColor = (42/256, 87/256, 141/256, 2/3)
maxColor = (42/256, 87/256, 141/256, 3/3)

result = result.sort_values(
    by="神州行", ascending=False
)

#使用排列的方式，把数据堆叠放好，即为多维条形图
plt.bar(
    index, result['神州行'],
    color = maxColor
)
plt.bar(
    index, result['动感地带'],
    bottom=result['神州行'],
    color = midColor
)
plt.bar(
    index, result['全球通'],
    bottom=result['神州行']+result['动感地带'],
    color = minColor
)
plt.xticks(index, result.index)
plt.legend(['神州行', '动感地带', '全球通'])
plt.show()

```

4. 双向柱形图

```python
# -*- coding: utf-8 -*-
import numpy
import pandas
import matplotlib
from matplotlib import pyplot as plt

font = {
    'family' : 'SimHei'
}
matplotlib.rc('font', **font)

#解决负号是一个矩形的问题
matplotlib.rcParams['axes.unicode_minus']=False  

data = pandas.read_csv('./data.csv')

result = data.pivot_table(
    values='月消费（元）',
    index='手机品牌',
    columns='通信品牌',
    aggfunc=numpy.sum
);

index = numpy.arange(len(result));
minColor = (42/256, 87/256, 141/256, 1/3)
midColor = (42/256, 87/256, 141/256, 2/3)
maxColor = (42/256, 87/256, 141/256, 3/3)

result = result.sort_values(
    by="神州行",
    ascending=False
)

#使用排列的方式，把数据堆叠放好，即为多维条形图
plt.barh(
    index,
    result['动感地带'],
    color = minColor
)
plt.barh(
    index,
    -result['神州行'],
    color = maxColor
)
plt.yticks(index, result.index)
plt.legend(['动感地带', '神州行'])
plt.show()

```

## 直方图

直方图是用一系列等宽不等高的长方形来绘制的，高度表示数据范围的间隔，高度表示在给定间隔内数据出现的频数，变化的高度形态表示数据的分布。

直方图绘图的函数：hist(x, color, bins, cumulative=False)
- x：需要进行绘制的向量
- color：直方图的填充颜色
- bins：设置直方图的分组个数
- cumulative：设置是否累计，默认为False

```python
# -*- coding: utf-8 -*-
import pandas
import matplotlib
from matplotlib import pyplot as plt

font = {
    'family' : 'SimHei'
}
matplotlib.rc('font', **font)

data = pandas.read_csv('./data.csv')

mainColor = (42/256, 87/256, 141/256, 1)

plt.hist(data['购买用户数'], color=mainColor)
plt.show()

plt.hist(data['购买用户数'], bins=20, color=mainColor)
plt.show()

plt.hist(
    data['购买用户数'], bins=20,
    cumulative=True, color=mainColor
)
plt.show()

```


## 地图

```python

```

## 热力地图

```python

```
