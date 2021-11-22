---
layout: post
title: "第二章模块一 开发脚手架及封装自动化构建工作流"
date: 2020-8-5 13:35:00 +0800
categories: ["大前端"]
tags: ["泰康日记", "do homework"]
---

### 简答题

#### 1、谈谈你对工程化的初步认识，结合你之前遇到过的问题说出三个以上工程化能够解决问题或者带来的价值。

答：前端工程化课题提高开发效率，避免人工操作失误。可以开发业务工程脚手架，自动化构建，以及组件化、模块化等；可以使用工程化在发布生产前添加代码质量检查工具，提升开发时的效率以及在开发中不必要的错误；

#### 2、你认为脚手架除了为我们创建项目结构，还有什么更深的意义？

提升效率，可以快速搭建一个基础项目架构；规范化 对技术选型、项目结构等做一些规范，以降低沟通成本

### 编程题
#### 1、概述脚手架实现的过程，并使用 NodeJS 完成一个自定义的小型脚手架工具

答：1、创建一个仓库(目录) 2、通过npm init 初始化 3、创建一个入口js文件 4、package.json 文件增加"bin":"入口文件路径" 5、通过npm link命令连接全局 6、命令行运行脚手架命令 7、后面可以通过npm publish发布到npm仓库

#### 2、尝试使用 Gulp 完成项目的自动化构建

package.json
```json
{
  "name": "pages-boilerplate",
  "version": "0.1.0",
  "private": true,
  "description": "Always a pleasure scaffolding your awesome static sites.",
  "keywords": [
    "pages-boilerplate",
    "boilerplate",
    "pages",
    "zce"
  ],
  "homepage": "https://github.com/zce/pages-boilerplate#readme",
  "bugs": {
    "url": "https://github.com/zce/pages-boilerplate/issues"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/zce/pages-boilerplate.git"
  },
  "license": "MIT",
  "author": {
    "name": "zce",
    "email": "w@zce.me",
    "url": "https://zce.me"
  },
  "scripts": {
    "clean": "gulp clean",
    "lint": "gulp lint",
    "serve": "gulp serve",
    "build": "gulp build",
    "start": "gulp start",
    "deploy": "gulp deploy --production"
  },
  "browserslist": [
    "last 1 version",
    "> 1%",
    "maintained node versions",
    "not dead"
  ],
  "dependencies": {
    "bootstrap": "4.4.1",
    "jquery": "3.4.1",
    "popper.js": "1.16.1"
  },
  "devDependencies": {
    "@babel/core": "^7.11.4",
    "@babel/preset-env": "^7.11.0",
    "browser-sync": "^2.26.12",
    "del": "^5.1.0",
    "gulp": "^4.0.2",
    "gulp-babel": "^8.0.0",
    "gulp-clean-css": "^4.3.0",
    "gulp-htmlmin": "^5.0.1",
    "gulp-if": "^3.0.0",
    "gulp-imagemin": "^7.1.0",
    "gulp-load-plugins": "^2.0.4",
    "gulp-sass": "^4.1.0",
    "gulp-swig": "^0.9.1",
    "gulp-uglify": "^3.0.2",
    "gulp-useref": "^4.0.1"
  },
  "engines": {
    "node": ">=6"
  }
}
```

gulpfile.js
```js
// 实现这个项目的构建任务
const { src, dest, watch, series, parallel } = require('gulp')
const del = require('del')
const gulpLoadPlugins = require('gulp-load-plugins')
const plugins = gulpLoadPlugins()

const browserSync = require('browser-sync')
const bs = browserSync.create()

const data = require('./package.json')

// 编译scss
const style = () => {
  return src('src/assets/styles/*.scss')
    .pipe(plugins.sass({ outputStyle: 'expanded' }))
    .pipe(dest('dist/css'))
}

// 编译JS
const js = () => {
  return src('src/assets/scripts/*.js')
    .pipe(plugins.babel({ presets: ['@babel/preset-env'] }))
    .pipe(dest('dist/js'))
}
// 处理图片
const img = () => {
  return src('src/assets/images/**')
    .pipe(plugins.imagemin())
    .pipe(dest('dist/img'))
}
// 处理字体
const font = () => {
  return src('src/assets/fonts/**')
    .pipe(plugins.imagemin())
    .pipe(dest('dist/font'))
}

// 拷贝静态资源
const extra = () => {
  return src('public/**')
    .pipe(dest('dist/public'))
}
// 处理HTML文件
const html = () => {
  return src(['src/*.html', 'src/layouts/*.html', 'src/partials/*.html'])
    .pipe(plugins.swig({ data: { pkg: data } }))
    .pipe(dest('dist'))
}

// 清除构建后的目录
const clean = () => {
  return del('dist')
}

const server = () => {
  watch('src/assets/styles/*.scss', style)
  watch('src/assets/scripts/*.js', js)
  watch(['src/assets/fonts/**', 'src/assets/images/**'], bs.reload)

  bs.init({
    notify: false,
    files: 'dist',
    server: {
      baseDir: ['dist', 'src', 'public'],
      routes: {
        '/node_modules': 'node_modules'
      }
    }
  })
}

// 文件引用处理
const ref = () => {
  return src('dist/*.html')
    .pipe(plugins.useref({ searchPath: ['dist', '.'] }))
    .pipe(plugins.if(/\.js$/, plugins.uglify()))
    .pipe(plugins.if(/\.html$/, plugins.htmlmin({ collapseWhitespace: true, minifyCSS: true, minifyJS: true })))
    .pipe(plugins.if(/\.css$/, plugins.cleanCss()))
    .pipe(dest('dist'))
}

const develop = series(parallel(style, js, html), ref, server)
const build = series(clean, parallel(style, js, html, img, extra, font))
module.exports = {
  clean,
  develop,
  build
}

```

#### 3、使用 Grunt 完成项目的自动化构建

package.json
```json
{
  "name": "pages-boilerplate",
  "version": "0.1.0",
  "private": true,
  "description": "Always a pleasure scaffolding your awesome static sites.",
  "keywords": [
    "pages-boilerplate",
    "boilerplate",
    "pages",
    "zce"
  ],
  "homepage": "https://github.com/zce/pages-boilerplate#readme",
  "bugs": {
    "url": "https://github.com/zce/pages-boilerplate/issues"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/zce/pages-boilerplate.git"
  },
  "license": "MIT",
  "author": {
    "name": "zce",
    "email": "w@zce.me",
    "url": "https://zce.me"
  },
  "scripts": {
    "clean": "gulp clean",
    "lint": "gulp lint",
    "serve": "gulp serve",
    "build": "gulp build",
    "start": "gulp start",
    "deploy": "gulp deploy --production"
  },
  "browserslist": [
    "last 1 version",
    "> 1%",
    "maintained node versions",
    "not dead"
  ],
  "dependencies": {
    "bootstrap": "4.4.1",
    "jquery": "3.4.1",
    "popper.js": "1.16.1"
  },
  "devDependencies": {
    "@babel/core": "^7.11.4",
    "@babel/preset-env": "^7.11.0",
    "grunt": "^1.3.0",
    "grunt-babel": "^8.0.0",
    "grunt-contrib-clean": "^2.0.0",
    "grunt-contrib-uglify": "^5.0.0",
    "grunt-contrib-watch": "^1.1.0",
    "grunt-copy": "^0.1.0",
    "grunt-sass": "^3.1.0",
    "load-grunt-tasks": "^5.1.0",
    "sass": "^1.26.10"
  },
  "engines": {
    "node": ">=6"
  }
}
```

gruntfile.js

```js
const sass = require('sass')
const loadGruntTask = require('load-grunt-tasks')// 加载grunt插件
module.exports = grunt => {
  grunt.initConfig({
    babel: {
      options: {
        presets: ['@babel/preset-env']
      },
      main: {
        files: {
          'dist/assets/scripts/main.js': 'src/assets/scripts/main.js'
        }
      }
    },
    // 压缩js
    uglify: {
      my_target: {
        files: {
          'dist/assets/scripts/main.min.js': ['dist/assets/scripts/main.js']
        }
      }
    },
    // 处理scss文件
    sass: {
      options: {
        sourceMap: true,
        implementation: sass//使用sass处理编译
      },
      main: {//配置目标
        files: {
          'dist/assets/styles/main.css': 'src/assets/styles/main.scss'
        }
      }
    },
    // 拷贝静态文件
    copy: {
      main: {
        expand: true,
        src: 'public/*',
        dest: 'dist/',
      }
    },
    clean: {
      dist: 'dist/**'
    },
    // 监视文件变化
    watch: {
      js: {
        files: ['src/assets/scripts/*.js'],
        task: ['babel']
      },
      css: {
        files: ['src/assets/styles/*.scss'],
        task: ['sass']
      }
    }
  })
  grunt.loadNpmTasks('grunt-contrib-clean') //删除构建后的文件
  loadGruntTask(grunt)//自动加载所有插件
  grunt.registerTask('develop', ['sass', 'babel', 'watch'])
  grunt.registerTask('default', ['clean', 'copy', 'sass', 'babel', 'uglify'])
}
```


### 2-3 题项目基础代码下载地址：

> 百度网盘：https://pan.baidu.com/s/1AyGApMTFEfCeGfQBdykOGg 提取码: bw3r

说明：

本次作业中的编程题要求大家完成相应代码后（二选一）

1.  简单录制一个小视频介绍一下实现思路，并演示一下相关功能。
2.  提交一个项目说明文档，要求思路流程清晰。
> 最终将录制的视频或说明文档和代码统一提交至作业仓库。

