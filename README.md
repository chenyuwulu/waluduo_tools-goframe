# waluduo_tools-goframe

* 本项目基于[gmanager](https://github.com/goflyfox/gmanager)进行开发，并且后续更新会尽量保持同步[gmanager](https://github.com/goflyfox/gmanager)和[goframe](https://github.com/gogf/gf)的更新方向。
* 后台前端界面和客户端前端界面，是基于[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)和[uni-app](https://github.com/dcloudio/uni-app)，同样也会尽量保持同步更新到本项目。

## 总项目仓库分布
### 代码地址
* [waluduo_tools-goframe](https://github.com/chenyuwulu/waluduo_tools-goframe)：主要用于实现go后端方法。
* [waluduo_tools-vue_admin](https://github.com/chenyuwulu/waluduo_tools-vue_admin)：后台前端界面。
* [waluduo_tools-uniapp](https://github.com/chenyuwulu/waluduo_tools-uniapp)：用户(客户端)前端界面。

### 本项目结构
```
waluduo_tools-goframe
│  .gitattributes               指定git项目的主语言
│  .gitignore                   指定忽略git文件提交
│  ChangeLog.md                 更新说明
│  go.mod                       go mod
│  go.sum                       go sum
│  LICENSE                      开源协议
│  main.go                      go入口文件
│  Makefile                     Makefile
│  README.md                    项目介绍
├─app                           业务代码目录
│  ├─api                        业务接口
│  ├─component                  ├─组件
│  │  ├─middle
│  │  └─MiddlewareLog.go         └─访问日志中间件
│  ├─constants                  常量
│  ├─model                      实体对象   
│  └─service                    业务层代码
│      └─user                   
│        └─userSvc.go           用户模块的curd方法
├─boot                          启动类
│  └─boot.go                    └─初始化类
├─config                        配置目录
│  └─config.toml                └─配置文件
├─deploy                        部署项目资源
│  ├─gmanager-web.sql           ├─vue-admin对应的侧边栏菜单数据
│  └─gmanager.sql               └─数据库结构
├─library                       公共方法  
├─logs                          日志目录  
├─public                        静态文件
│  ├─favicon.ico
│  └─component                  第三方组件                          
├─router                        项目路由
├─template                      (原)模板页面
└─test                          测试代码
```

### 操作流程

1. 从git下载项目： git clone https://github.com/chenyuwulu/waluduo_tools-goframe
2. 安装mysql数据库，创建db，运行deploy下gmanager.sql脚本和gmanager-web.sql脚本
3. 修改config下config.toml配置文件
```toml
# 数据库配置
[database]
    link = "root:123456@tcp(127.0.0.1:3306)/gmanager"
            数据库帐号：数据库密码            数据库名称
```
4. go run main.go
5. 访问http://localhost:8011即可看到登录页面，账号/密码：admin/123456
