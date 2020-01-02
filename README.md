## blog 环境配置

* 使用create-next-app创建blog项目
    * create-next-app就是Next.js的脚手架工具
    * `sudo npm install -g create-next-app`
    * `npx create-next-app blog`
* 安装 `@zeit/next-css` 包，使得 Next.js 可以加载 CSS 文件
    * `yarn add @zeit/next-css`
    *  在blog根目录下，新建一个`next.config.js`文件，并配置内容
* 安装 antd
    * `yarn add antd `
* 安装 babel，用于按需加载
    * `yarn add babel-plugin-import`
    * 在项目根目录建立 .babelrc 文件
* 创建 _app.js 文件，所以页面引入的地方
* 安装 `react-markdown` 用于解析markdown
    * `yarn add react-markdown`
* 安装 `markdown-navbar` 用于提供markdown导航功能
    * `yarn add markdown-navbar`
    * className： 可以为导航定义一个class名称，从而进行style样式的定义。
    * source：要解析的内容，也就是你的Markdown内容。
    * headingTopOffset:描点距离页面顶部的位置，默认值是0.
    * ordered: 显示数字编码，默认是显示的，也就是true，设置为false就不显示了。
    * 安装完要注意要引入css
        * `import 'markdown-navbar/dist/navbar.css';`
    * 有点问题，自己clone下来改一下，没有初始化替换的逻辑


## service 中台

* 全局安装egg.js的脚手架工具egg-init
    * `sudo npm i egg-init -g`
* 在 service 中使用 egg-init 脚手架
    * `sudo egg-init --type=simple`
* `npm run dev` 时，文件不可以访问的话，要使用 sudo
* 我们的所有数据的获得和业务逻辑的操作都是通过中台实现的，也就是说中台只提供接口，这里的设计我们采用RESTful的规则，让egg为前端提供Api接口，实现中台主要的功能。
    * 特点 前后端分离，简单且有约束性
    * GET(SELECT) ： 从服务端取出资源，可以同时取出一项或者多项。
    * POST(CREATE) ：在服务器新建一个资源。
    * PUT(UPDATE) ：在服务器更新资源（客户端提供改变后的完整资源）。
    * DELETE(DELETE) ：从服务器删除资源。
* 修改文件夹权限
    * `sudo chmod -R 777 react-node-ant-design`
* 安装 `egg-mysql` 使用数据库
    * `npm i egg-mysql --save`
* 安装下载mysql到mac上面
    * https://dev.mysql.com/downloads/mysql/
        * 注意下对版本，支持的你的系统版本
    * 安装后配置环境变量
        * `vim ~/.bash_profile`
        * 输入 `export PATH=$PATH:/usr/local/mysql/bin export PATH=$PATH:/usr/local/mysql/support-files`
        * 输入 `:wq` 退出
        * 让配置生效 `source ~/.bash_profile `
    * 启动mysql
        * `sudo mysql.server stop restart status`
        * 其实已经启动了
        * 直接可以使用 `mysql -u root -p ` 进入mysql
* 干掉某个端口的进程
    * `lsof -i :7001` 7001 代表端口号，查询到对应的pid
    * `kill -9 进程PID`

```

卸载mysql执行的命令

sudo rm /usr/local/mysql

sudo rm -rf /usr/local/mysql*

sudo rm -rf /Library/StartupItems/MySQLCOM

sudo rm -rf /Library/PreferencePanes/My*

vim /etc/hostconfig  (and removed the line MYSQLCOM=-YES-)

rm -rf ~/Library/PreferencePanes/My*

sudo rm -rf /Library/Receipts/mysql*

sudo rm -rf /Library/Receipts/MySQL*

sudo rm -rf /var/db/receipts/com.mysql.*

```


* egg.js 目录结构介绍
    * app文件夹:项目开发文件，程序员主要操作的文件，项目的大部分代码都会写在这里。
    * config文件夹：这个是整个项目的配置目录，项目和服务端的配置都在这里边进行设置。
    * logs文件夹：日志文件夹，正常情况下不用修改和查看里边内容。
    * node_modules:项目所需要的模块文件，这个前端应该都非常了解，不多作介绍。
    * run文件夹：运行项目时，生成的配置文件，基本不修改里边的文件。
    * test文件夹：测试使用的配合文件，这个在测试时会使用。
    * .autod.conf.js: egg.js自己生成的配置文件，不需要进行修改。
    * eslinttrc和eslintignore：代码格式化的配置文件。
    * gitgnore：git设置忽略管理的配置文件。
    * package.json： 包管理和命令配置文件，这个文件经常进行配置。

* egg.js 目录约定规范
    * controller文件夹：控制器，渲染和简单的业务逻辑都会写道这个文件里。配置路由时也会用到（路由配置需要的文件都要写在控制器里）。
    * public文件夹：公用文件夹，把一些公用资源都放在这个文件夹下。
    * router.js: 项目的路由配置文件，当用户访问服务的时候，在没有中间件的情况下，会先访问router.js文件。
    * service文件夹：这个是当我们的业务逻辑比较复杂或和数据库打交道时，会把业务逻辑放到这个文件中。
    * view文件夹：模板文件夹，相当于表现层的专属文件夹，这个项目，我们使用接口的形式，所以不需要建立view文件夹。
    * extend文件：当我们需要写一些模板中使用的扩展方法时，我们会放到这个文件夹里。
    * middleware：中间件文件夹，用来写中间件的，比如最常用的路由首位。