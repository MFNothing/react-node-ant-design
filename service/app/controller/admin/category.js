'use strict';

const Controller = require('egg').Controller;

class TypeController extends Controller {

  async addCategory() {
    const { categoryName = '', parentCategoryName = '', icon = '' } = this.ctx.request.body || {};
    const result = await this.app.mysql.insert('category', {
      categoryName,
      parentCategoryName,
      icon,
    });
    // 判断是否插入成功
    const insertSuccess = result.affectedRows === 1;
    const insertId = result.insertId;
    this.ctx.body = {
      isScuccess: insertSuccess,
      insertId: insertId || -1,
    };
  }

}

module.exports = TypeController;
