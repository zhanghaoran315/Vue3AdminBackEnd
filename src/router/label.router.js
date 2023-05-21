const labelRouter = require('@koa/router')()

labelRouter.prefix('/label')

const { verifyAuth } = require('../middleware/login.middleware')
const { create, remove, list } = require('../controller/label.controller')

// 1.新增标签
labelRouter.post('/', verifyAuth, create)
// 2.标签列表
labelRouter.post('/list', verifyAuth, list)
// 3.删除标签
labelRouter.delete('/:labelId', verifyAuth, remove)


module.exports = labelRouter