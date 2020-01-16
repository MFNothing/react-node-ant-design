'use strict';

const Controller = require('egg').Controller;

class TypeController extends Controller {

  async addCategory() {
    const { categoryName = '', parentCategoryIds = '', icon = '' } = this.ctx.request.body || {};
    const result = await this.app.mysql.insert('category', {
      categoryName,
      parentCategoryIds,
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

  async getParentCategoryNames() {
    const results = await this.app.mysql.select('category', {
      where: { parentCategoryIds: '' },
    });
    this.ctx.body = { data: results };
  }

}

module.exports = TypeController;
