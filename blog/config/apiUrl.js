const ipUrl = 'http://127.0.0.1:7001/default/'

const servicePath = {
    getArticleById: ipUrl + 'getArticleById/', // 详情页接口
    getArticleList: ipUrl + 'getArticleList', // 首页接口
    getTypeInfo: ipUrl + 'getTypeInfo', // 文章类别接口
    getListById: ipUrl + 'getListById/', // 列表页接口
}

export default servicePath

