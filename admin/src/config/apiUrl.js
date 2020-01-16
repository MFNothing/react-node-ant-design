// const ipUrl = 'http://localhost:7001/admin/'
// const ipUrl = 'http://service.mfnothing.top/admin/'
const ipUrl = process.env.REACT_APP_API_URL
const servicePath = {
    checkLogin: ipUrl + 'checkLogin',  // 检查用户名密码是否正确
    getTypeInfo: ipUrl + 'getTypeInfo',  // 获得文章类别信息
    addArticle: ipUrl + 'addArticle',  // 添加文章
    updateArticle: ipUrl + 'updateArticle',  // 修改文章第api地址
    getArticleList: ipUrl + 'getArticleList', //  文章列表
    delArticle: ipUrl + 'delArticle/' ,  //  删除文章
    getArticleById: ipUrl + 'getArticleById/', //根据文章id获取文章详情

    // 分类
    getParentCategoryNames: ipUrl + 'getParentCategoryNames', // 获取父级分类名称
    addCategory: ipUrl+ 'addCategory', // 添加分类
}

export default servicePath