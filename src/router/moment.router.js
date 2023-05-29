const momentRouter = require('@koa/router')()

momentRouter.prefix('/moment')

const { verifyAuth } = require('../middleware/login.middleware')
const { verifyPermssion } = require('../middleware/tool.middleware')
const { verifyLabelExists } = require('../middleware/label.middleware')
const { create, list, detail, update, remove, addLabels, pictureInfo } = require('../controller/moment.controller')

// 1.发表动态
momentRouter.post('/', verifyAuth, create)
// 2.动态列表 - 展示评论的数量
momentRouter.post('/list', list)
// 3.动态详情 - 展示评论的列表
momentRouter.get('/:momentId', detail)
// 4.修改/删除动态
// 满足两个条件 1.用户必须登录 2.用户具备权限
// 4.1 修改动态
momentRouter.patch('/:momentId', verifyAuth, verifyPermssion, update)
// 4.2 删除动态
momentRouter.delete('/:momentId', verifyAuth, verifyPermssion, remove)

// 5.给动态添加标签
// 满足两个条件
// 1.用户必须登录
// 2.用户具备权限（只能给自己的动态添加）
// 3.添加标签的处理，没有这个标签
momentRouter.post('/:momentId/labels', verifyAuth, verifyPermssion, verifyLabelExists, addLabels)

// 6.动态配图服务
momentRouter.get('/images/:filename', pictureInfo)


module.exports = momentRouter