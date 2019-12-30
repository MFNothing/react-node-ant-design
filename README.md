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