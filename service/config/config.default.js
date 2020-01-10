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
      host: 'mfnothing.top',
      // port
      port: '3306',
      // username
      user: 'root',
      // password
      password: 'min0012',
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
    domainWhiteList: [ '*' ],
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
