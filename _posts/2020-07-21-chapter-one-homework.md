---
layout: post
title: "第一章 函数式编程与JS异步编程、手写Promise"
date: 2020-7-21 22:42:00 +0800
categories: ["大前端"]
tags: ["泰康日记", "do homework"]
---

# 简答题
---

- 谈谈你是如何理解JS异步编程的，EventLoop、消息队列都是做什么的，什么是宏任务，什么是微任务？

# 代码题
---

## 一、将下面的异步代码使用Promise的方式改进

```js
setTimeout(function () {
    var a = 'hello'
    setTimeout(function () {
        var b = 'lagou'
        setTimeout(function () {
            var c = 'I ❤️ U'
            console.log(a + b + c)
        }, 10)
    }, 10)
}, 10)
```

## 二、基于以下代码完成下面的四个练习
```js
const fp = require('lodash/fp')
// 数据
// horsepower 马力， dollar_value 价格，in_stock 库存
const cars = [
    { name: 'Ferrari FF', horsepower: 660, dollar_value: 700000, in_stock: true },
    { name: 'Spyker C12 Zagato', horsepower: 650, dollar_value: 648000, in_stock: false },
    { name: 'Jaguar XKR-S', horsepower: 550, dollar_value: 132000, in_stock: false },
    { name: 'Audi R8', horsepower: 525, dollar_value: 114200, in_stock: false },
    { name: 'Aston Martin One-77', horsepower: 750, dollar_value: 1850000, in_stock: true },
    { name: 'Pagani Huayra', horsepower: 700, dollar_value: 1300000, in_stock: false },
]
```
- 练习1：使用函数组合 fp.flowRight() 重新实现下面这个函数
```js
let isLastInStock = function (cars) {
    // 获取最后一条数据
    let last_car = fp.last(cars)
    // 获取最后一条数据的 in_stock 属性值
    return fp.prop('in_stock', last_car)
}
```
- 练习2：使用 fp.flowRight()、fp.prop()和fp.first()获取第一个 car 的 name
    
- 练习3：使用帮助函数 _average 重构 averageDollarValue， 使用函数组合的方式实现
```js
let _average = function(xs) {
  return fp.reduce(fp.add, 0, xs)/xs.length
} // <- 无须改动
let averageDollarValue = function(cars){
    let  dollar_values = fp.map(function(car) {
      return car.dollar_value
    }, cars)
    return _average(dollar_values)
}
```
- 练习4：使用flowRight写一个sanitizeNames()函数，返回一个下划线连接的小写字符串，把数组中的 name 转换为这种形式：例如：sanitizeNames(["Hello Woeld"]) => ['hello_world']
```js
let _underscore = fp.replace(/\W+/g, '_') // <-- 无须改动，并在sanitizeNames 中使用它
```

## 三、基于下面提供的代码，完成后续的四个练习 

```js

// support.js
class Container {
  static of (value) {
    return new Container(value)
  }

  constructor (value) {
    this._value = value
  }

  map (fn) {
    return Container.of(fn(this._value))
  }
}

class Maybe {
  static of (x) {
    return new Maybe(x)
  }

  isNothing () {
    return this._value === null || this._value === undefined
  }

  constructor (x) {
    this._value = x
  }

  map (fn) {
    return this.isNothing() ? this : Maybe.of(fn(this._value))
  }
}

module.exports = { Maybe, Container }
```

- 练习1：使用fp.add(x,y) 和 fp.map(f, x)创建一个能让 functor 里的值增加的函数ex1
    
```js
// app.js
const fp = require('lodash/fp')
const {Maybe,Container} = require('./support')
let maybe = Maybe.of([5,6,1])
let ex1 = ()=>{
// 你需要实现的函数。。。
}
```

- 练习2：实现一个函数 ex2， 能够使用 fp.first 获取列表中的第一个元素
    
```js
// app.js
const fp = require('lodash/fp')
const {Maybe,Container} = require('./support')
let xs = Container.of(['do','ray','me','fa','so','la','ti','do']) 
let ex2 = ()=>{
// 你需要实现的函数。。。
}
```

- 练习3：实现一个函数ex3，使用safeProp和fp.first 找到user的名字和首字母
    
```js
// app.js
const fp = require('lodash/fp')
const {Maybe,Container} = require('./support')
let safeProp = fp.curry(function(x,o) {
return Maybe.of(o[x])
  
})
let user = {id:2,name:'Albert'}
let ex3 = ()=>{
// 你需要实现的函数。。。
}
```

- 练习4： 使用Maybe重写 ex4 ，不要有 if 语句
    
```js
// app.js
const fp = require('lodash/fp')
const {Maybe,Container}= require('./support')
let ex4 = function(n) {
if(n){
return parseInt(n)
}
  
}
```

## 四、手写实现 MyPromise 源码

要求：尽可能还原Promise中的每一个API，并通过注视的方式描述思路和原理

