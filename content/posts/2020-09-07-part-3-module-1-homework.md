---
layout: post
title: "第三章模块一 手写 Vue Router、手写响应式实现、虚拟 DOM 和 Diff 算法"
date: 2020-09-07 12:18:00 +0800
categories: ["大前端"]
tags: ["泰康日记", "do homework"]
---

### 一、简答题

#### 当我们点击按钮的时候动态给 data 增加的成员是否是响应式数据，如果不是的话，如何把新增成员设置成响应式数据，它的内部原理是什么。

```javascript
let vm = new Vue({
  el: '#el',
  data: {
    o: 'object',
    dog: {}
  },
  method: {
    clickHandler () {
      // 该 name 属性是否是响应式的
      this.dog.name = 'Trump'
    }
  }
})
```

1. 不是响应式的，对于已经创建的实例，Vue不允许动态添加根级别的响应式属性
2. 使用Vue.set(vm.dog, 'name', 'dog_name')或this.$set(this.dog, 'name', 'dog_name')
3. this.$set在new Vue()时候就被注入到Vue的原型上，set方法内部仍是调用了defineReactive()方法进行响应式处理

##### 请简述 Diff 算法的执行过程

1. diff的过程就是调用名为patch(el, vnode)/patch(oldVnode, vnode)的函数，比较新旧节点，一边比较一边给真实DOM打补丁
2. patch里会调用sameVnode(oldVnode, vonde)，根据返回结果：
    - true: 则执行patchVnode
    - false: 则用vnode替换oldVnode
3. patchVnode(oldNode, vnode, insertedVnodeQueue)
    - 找到对应的真实DOM，成为el
    - 判断vnode和oldVnode是否指向同一个对象，如果是，直接return
    - 如果它们都有文本节点并且不相等，那么将el的文本节点设置为vnode的文本文本节点
    - 如果oldVnode有子节点而vnode没有，则删除el的子节点
    - 如果oldVnode没有子节点而vnode有，则将vnode的子节点真实化之后加到el
    - 如果两者都有子节点，则执行updateChildren(parentElm, oldCh, newCh)函数比较子节点(key很重要)

### 二、编程题

#### 模拟 VueRouter 的 hash 模式的实现，实现思路和 History 模式类似，把 URL 中的 # 后面的内容作为路由的地址，可以通过 hashchange 事件监听路由地址的变化。

```javascript
let _Vue = null
export default class VueRouter {
  static install (Vue) {
    // 1. 判断当前插件是否已经被安装
    if (VueRouter.install.installed) return
    VueRouter.install.installed = true

    // 2. 把 Vue 构造函数记录到全局变量
    _Vue = Vue

    // 3. 把创建Vue实例时传入的router对象注入到Vue实例上
    _Vue.mixin({
      beforeCreate () {
        // 如果是vue实例就执行，如果是组件就不执行
        if (this.$options.router) {
          _Vue.prototype.$router = this.$options.router
        }
      }
    })
  }

  constructor (options) {
    this.options = options
    this.routeMap = {}
    // 创建响应式对象
    this.data = _Vue.observable({
      current: '#/'
    })
    this.init()
  }

  init () {
    this.createRouteMap()
    this.initComponents(_Vue)
    this.initEvent()
  }

  createRouteMap () {
    // 遍历所有的路由规则，把路由规则解析成键值对的形式 存储到routeMap中
    this.options.routes.forEach(route => {
      this.routeMap['#' + route.path] = route.component
    })
  }

  initComponents (Vue) {
    Vue.component('router-link', {
      props: {
        to: String
      },
      render (h) {
        return h('a', {
          attrs: {
            href: '#' + this.to
          },
        }, [this.$slots.default])
      },
    })

    const self = this;
    Vue.component('router-view', {
      render (h) {
        // 当前路由组件，找不到时返回 404 组件
        const component = self.routeMap[self.data.current] || self.routeMap['#*']
        return h(component)
      }
    })
  }

  initEvent () {
    // 初始化时，将 hash 地址，也就是 包括#以及后面的地址 存储到 this.data.current
    this.data.current = window.location.hash
    // 监听 hashchange 事件，hash 改变时更新 this.data.current
    window.addEventListener('hashchange', () => {
      this.data.current = window.location.hash
    })
  }
}
```

#### 在模拟 Vue.js 响应式源码的基础上实现 v-html 指令，以及 v-on 指令。

```javascript
// 处理 v-html 指令
function htmlUpdater (node, value, key) {
    node.innerHTML = value
    new Watcher(this.vm, key, newValue => {
        node.innerHTML = newValue
    })
}
// 处理 v-on 指令
function onUpdater (node, value, key, eventType) {
    node.addEventListener(eventType, value)
    new Watcher(this.vm, key, newValue => {
        node.removeEventListener(eventType, value)
        node.addEventListener(eventType, newValue)
    })
}
```

#### 参考 Snabbdom 提供的电影列表的示例，利用Snabbdom 实现类似的效果，如图：

![figure1](http://static.ziying.site/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Ciqc1F7zUZ-AWP5NAAN0Z_t_hDY449.jpg)

```javascript
let snabbdom = require('snabbdom');
let patch = snabbdom.init([ // Init patch function with chosen modules
  require('snabbdom/modules/class').default, // makes it easy to toggle classes
  require('snabbdom/modules/props').default, // for setting properties on DOM elements
  require('snabbdom/modules/style').default, // handles styling on elements with support for animations
  require('snabbdom/modules/eventlisteners').default, // attaches event listeners
]);
let h = require('snabbdom/h').default; // helper function for creating vnodes

// 页面容器
let container = document.getElementById('container');

// 原始数据
let data = new Array(10).fill(0).map((_, i) => i).map(index => ({
  index,
  content: '-' + index + '--' + randomString(20) + '_lxcan',
  time: Date.now()
}));

// 保存 vnode
let vnode = initVnode(data);

// 首次渲染
patch(container, vnode);

// 得到页面需要渲染的 vnode
function initVnode (data) {
  return h('div.wrap', {
    style: {
      width: '600px',
      margin: '50px auto',
      padding: '20px',
      border: '1px solid #000'
    }
  }, [
    h('header.header-wrap',  [
      h('button', { style: { 'margin-right': '10px' }, on: { click: [changeSort, 'order'] } }, '顺序排列'),
      h('button', { style: { 'margin-right': '10px' }, on: { click: [changeSort, 'reorder'] } }, '倒序排列'),
      h('button', { style: { 'margin-right': '10px' }, on: { click: [changeSort, 'random'] } }, '随机排列'),
      h('button', { on: { click: addItem } }, '添加1项')
    ]),
    h('table', [
      h('tr', [
        h('th', '序号'),
        h('th', '内容'),
        h('th', '添加时间')
      ]),
      h('tbody', data.map(getTrVnode))
    ])
  ]);
}

// 获取表格行的 vnode
function getTrVnode(item) {
  return h('tr', [
    h('td', item.index),
    h('td', item.content),
    h('td', item.time)
  ])
}

// 点击按钮，改变排序
function changeSort (type) {  
  if (type === 'order') {
    // 顺序排列
    data.sort((a, b) => a.index - b.index);
  } else if (type === 'reorder') {
    // 倒序排列
    data.sort((a, b) => b.index - a.index);
  } else if (type === 'random') {
    // 随机排列
    data.sort(() => Math.random() > 0.5 ? -1 : 1)
  }
  render(data);
}

// 添加一项
function addItem () {
  const total = data.length;
  const item = {
    index: total,
    content: '-' + total + '--' + randomString(20) + '_lxcan',
    time: Date.now()
  };
  data.unshift(item);
  render(data);
}

// 数据改变，再次渲染
function render (data) {
  vnode = patch(vnode, initVnode(data))
}

// 辅助函数，获取随机字符串
function randomString(len) {
  len = len || 32;
  var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
  var maxPos = $chars.length;
  var pwd = '';
  for (i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}
```

