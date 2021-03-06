/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1577950985608_1655';

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  config.mysql = {
    // database configuration
    client: {
      // host
      host: process.env.NODE_ENV === 'production' ? 'mfnothing.top' : 'localhost',
      // port
      port: '3306',
      // username
      user: 'root',
      // password
      password: process.env.NODE_ENV === 'production' ? 'min0012' : 'Sercuixin2010',
      // database
      database: 'react_blog',
    },
    // load into app, default is open
    app: true,
    // load into agent, default is close
    agent: false,
  };

  // 不设置 cors中的orgin 会走 security 中的domainWhiteList，如果设置了，会忽略 domainWhiteList
  config.cors = {
    // origin: 'http://localhost:3000',
    credentials: true, // 允许Cook可以跨域
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH,OPTIONS',
  };

  config.security = {
    csrf: {
      enable: false,
    },
    // 当credentials这个配置为true时，不能设置origin为*
    domainWhiteList: [ 'http://localhost:3000', 'http://service.mfnothing.top/', 'http://admin.mfnothing.top:3000', 'http://admin.mfnothing.top' ],
  };

  /*
  config.cors = {
    origin: 'http://localhost:3000', //只允许这个域进行访问接口
    credentials: true,   // 开启认证
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH,OPTIONS'
    };
  */

  return {
    ...config,
    ...userConfig,
  };
};
