---
layout: post
title: "第三章模块五 Vue.js 3.0 Composition APIs 及 3.0 原理剖析"
date: 2020-11-03 23:14:00 +0800
categories: ["大前端"]
tags: ["泰康日记", "do homework"]
---

### Vue 3.0 性能提升主要是通过哪几方面体现的？

- 响应式系统升级：vue3使用了 proxy 重写了响应式系统，因为 proxy 可以对整个对象进行监听，所以不需要对整个对象深度遍历
- 编译优化：vue3中标记和提升所有的静态节点，diff过程中只需要对比动态节点
- 源码体积优化：vue3中移除了不经常使用的API，tree-sharking减小打包体积


### Vue 3.0 所采用的 Composition Api 与 Vue 2.x使用的Options Api 有什么区别？

Options Api: 包含一个描述组件选项（data,methods,props）的对象；开发复杂组件，同一个功能代码被拆分到不同选项中；
Composition Api： 一组基于函数的API；可以灵活的组织组件的逻辑；更好的类型推导，容易集合TypeScript；

### Proxy 相对于 Object.defineProperty 有哪些优点？

可以监听动态属性的添加；可以监听到数组的索引和数组length属性；可以监听删除属性；多层属性嵌套，在访问属性过程中处理下一级属性

### Vue 3.0 在编译方面有哪些优化？

vue2中采用标记静态根节点，优化diff过程，来减少操作dom；vue3中标记和提升所有静态根节点,diff过程只需要对比动态节点；Fragments；静态提升；Patch flag；缓存事件处理函数

### Vue.js 3.0 响应式系统的实现原理？

- reactive
    - 接受一个参数，typeof判断这个参数是否是对象，不是对象直接返回这个参数，不能用reactive做响应式处理
    - 是对象，创建响应拦截器handler,里面实现get/set/deleteProperty
    - get：通过track收集依赖,通过Reflect.get获取当前key的值，注意这里如果key的值是个对象，要为该对象创建响应拦截器递归调用reactive
    - set：先比较新旧value是否相等，相等直接返回,不想等，通过Reflect.set设置新的value,并通过trigger触发更新，最后记得返回boolean值，否则会报warn
    - deleteProperty:当前对象有这个key值，删除这个key，并通过trigger触发更新，最后记得返回boolean值，否则会报warn
- effect
    - 接受一个函数作为参数，记得把函数赋值给全局对象activeEffect，作用是访问响应式对象属性时区收集依赖
- track
    - 接受两个参数target和key
    - 如果没有 activeEffect，则说明没有创建 effect 依赖
    - 如果有 activeEffect，则去判断 WeakMap 集合中是否有 target 属性
        - WeakMap 集合中没有 target 属性，则 set(target, (depsMap = new Map()))
        - WeakMap 集合中有 target 属性，则判断 target 属性的 map 值的 depsMap 中是否有 key 属性
            - depsMap 中没有 key 属性，则 set(key, (dep = new Set()))
            - depsMap 中有 key 属性，则添加这个 activeEffect
- trigger
    - 判断 WeakMap 中是否有 target 属性
        - WeakMap 中没有 target 属性，则没有 target 相应的依赖
        - WeakMap 中有 target 属性，则判断 target 属性的 map 值中是否有 key 属性，有的话循环触发收集的 effect()