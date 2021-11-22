---
layout: post
title: "第二章模块二 开发脚手架及封装自动化构建工作流"
date: 2020-08-23 09:28:00 +0800
categories: ["大前端"]
tags: ["泰康日记", "do homework"]
---

### 一、简答题
#### 1、Webpack 的构建流程主要有哪些环节？如果可以请尽可能详尽的描述 Webpack 打包的整个过程。

1. 根据用户在命令窗口输入的参数以及 webpack.config.js 文件的配置，得到最后的配置。
2. 根据上一步得到的最终配置初始化得到一个 compiler 对象，注册所有的插件 plugins，插件开始监听 webpack 构建过程的生命周期的环节（事件），不同的环节会有相应的处理，然后开始执行编译。
3. 根据 webpack.config.js 文件中的 entry 入口，开始解析文件构建 AST 语法树，找出依赖，递归下去。
4. 递归过程中，根据文件类型和 loader 配置，调用相应的 loader 对不同的文件做不同的转换处理，再找出该模块依赖的模块，然后递归本步骤，直到项目中依赖的所有模块都经过了本步骤的编译处理。编译过程中，有一系列的插件在不同的环节做相应的事情，比如 UglifyPlugin 会在 loader 转换递归完对结果使用 UglifyJs 压缩覆盖之前的结果；再比如 clean-webpack-plugin ，会在结果输出之前清除 dist 目录等等。
5. 递归结束后，得到每个文件结果，包含转换后的模块以及他们之间的依赖关系，根据 entry 以及 output 等配置生成代码块 chunk。
6. 根据 output 输出所有的 chunk 到相应的文件目录。

#### 2、Loader 和 Plugin 有哪些不同？请描述一下开发 Loader 和 Plugin 的思路。

答：Loader 专注实现资源模块的转换和加载（编译转换代码、文件操作、代码检查）；Plugin 解决其他自动化工作（打包之前清除 dist 目录、拷贝静态文件、压缩代码等等）

### 二、编程题
#### 1、使用 Webpack 实现 Vue 项目打包任务
> 具体任务及说明：
> 先下载任务的基础代码  百度网盘链接: https://pan.baidu.com/s/1pJl4k5KgyhD2xo8FZIms8Q 提取码: zrdd
>
> 这是一个使用 Vue CLI 创建出来的 Vue 项目基础结构；有所不同的是这里我移除掉了 vue-cli-service（包含 webpack 等工具的黑盒工具）；这里的要求就是直接使用 webpack 以及你所了解的周边工具、Loader、Plugin 还原这个项目的打包任务；尽可能的使用上所有你了解到的功能和特性

package.json
```json
{
  "name": "vue-app-base",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "serve": "webpack-dev-server --config webpack.dev.js",
    "build": "webpack --config webpack.prod.js",
    "lint": "eslint --ext .js,.vue src",
    "lintfix": "eslint --fix --ext .js,.vue src"
  },
  "dependencies": {
    "core-js": "^3.6.5",
    "vue": "^2.6.11"
  },
  "devDependencies": {
    "@babel/core": "^7.6.3",
    "@babel/preset-env": "^7.11.0",
    "@vue/eslint-config-standard": "^5.1.2",
    "babel-eslint": "^10.1.0",
    "babel-loader": "^8.0.6",
    "clean-webpack-plugin": "^3.0.0",
    "copy-webpack-plugin": "^5.0.4",
    "css-loader": "^3.2.0",
    "eslint": "^6.7.2",
    "eslint-friendly-formatter": "^4.0.1",
    "eslint-loader": "^4.0.2",
    "eslint-plugin-import": "^2.20.2",
    "eslint-plugin-node": "^11.1.0",
    "eslint-plugin-promise": "^4.2.1",
    "eslint-plugin-standard": "^4.0.0",
    "eslint-plugin-vue": "^6.2.2",
    "file-loader": "^4.2.0",
    "html-webpack-plugin": "^3.2.0",
    "less": "^3.0.4",
    "less-loader": "^5.0.0",
    "style-loader": "^1.0.0",
    "url-loader": "^2.2.0",
    "vue-loader": "15.2.1",
    "vue-style-loader": "^4.1.0",
    "vue-template-compiler": "^2.6.11",
    "webpack": "^4.41.2",
    "webpack-cli": "^3.3.9",
    "webpack-dev-server": "^3.9.0",
    "webpack-merge": "^4.2.2"
  },
  "eslintConfig": {
    "root": true,
    "env": {
      "node": true
    },
    "extends": [
      "plugin:vue/essential",
      "eslint:recommended"
    ],
    "parserOptions": {
      "parser": "babel-eslint"
    },
    "rules": {}
  },
  "browserslist": [
    "> 1%",
    "last 2 versions",
    "not dead"
  ]
}
```

.eslintrc
```json
{
  "root": true,
  "env": {
    "node": true
  },
  "extends": [
    "plugin:vue/essential",
    "eslint:recommended",
    "@vue/standard"
  ],
  "parserOptions": {
    "parser": "babel-eslint"
  },
  "rules": {
    "indent": [
      "error",
      4
    ]
  }
}
```

webpack.common.js
```js
const webpack = require('webpack')
const VueLoaderPlugin = require('vue-loader/lib/plugin') // 配合 vue-loader 使用，用于编译转换 .vue 文件
const HtmlWebpackPlugin = require('html-webpack-plugin') // 用于生成 index.html 文件

module.exports = {
  entry: './src/main.js',
  output: {
    filename: 'js/bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      // 它会应用到普通的 `.js` 文件
      // 以及 `.vue` 文件中的 `<script>` 块
      {
        test: /.js$/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      },
      // 配置 eslint-loader 检查代码规范，应用到 .js 和 .vue 文件
      {
        test: /\.(js|vue)$/,
        use: {
          loader: 'eslint-loader',
          options: {
            formatter: require('eslint-friendly-formatter') // 默认的错误提示方式
          }
        },
        enforce: 'pre', // 编译前检查
        exclude: /node_modules/, // 不检查的文件
        include: [__dirname + '/src'], // 要检查的目录
      },
      // 它会应用到普通的 `.css` 文件
      // 以及 `.vue` 文件中的 `<style>` 块
      {
        test: /\.css$/,
        use: ['vue-style-loader', 'css-loader']
      },
      // 配置 less-loader ，应用到 .less 文件，转换成 css 代码
      {
        test: /\.less$/,
        // loader: ['style-loader', 'css-loader', 'less-loader'],
        use: [{
          loader: 'style-loader' // creates style nodes from JS strings
        }, {
          loader: 'css-loader' // translates CSS into CommonJS
        }, {
          loader: 'less-loader' // compiles Less to CSS
        }]
      },
      {
        test: /\.(png|jpe?g|gif)$/,
        use: {
          loader: 'file-loader',
          options: {
            name: 'img/[name].[ext]'
          }
        }
      },
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      // 值要求的是一个代码片段
      BASE_URL: JSON.stringify('')
    }),
    new VueLoaderPlugin(),
    new HtmlWebpackPlugin({
      title: 'test',
      template: './public/index.html'
    }),
  ]
}
```

webpack.dev.js
```js
const webpack = require('webpack')
const merge = require('webpack-merge')
const common = require('./webpack.common')

module.exports = merge(common, {
  mode: 'development',
  devtool: 'cheap-eval-module-source-map',
  devServer: {
    host: 'localhost',
    port: '7789',
    open: true, // 启动服务时，自动打开浏览器
    hot: true, // 开启热更新功能
    contentBase: 'public'
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ]
})
```

webpack.prod.js
```js
const common = require('./webpack.common')
const merge = require('webpack-merge')
const { CleanWebpackPlugin } = require('clean-webpack-plugin') // 打包之前清除 dist 目录
const CopyWebpackPlugin = require('copy-webpack-plugin') // 拷贝静态文件至输出目录

module.exports = merge(common, {
  mode: 'none',
  output: {
    filename: 'js/bundle-[contenthash:8].js'
  },
  plugins: [
    new CleanWebpackPlugin(),
    new CopyWebpackPlugin(['public'])
  ]
})
```

### 作业要求

> 本次作业中的编程题要求大家完成相应代码后（二选一）
1.  简单录制一个小视频介绍一下实现思路，并演示一下相关功能。
2.  提交一个项目说明文档，要求思路流程清晰。
> 最终将录制的视频或说明文档和代码统一提交至作业仓库
