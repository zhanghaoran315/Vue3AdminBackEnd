const menuRouter = require('@koa/router')()

menuRouter.prefix('/menu')

const { verifyAuth } = require('../middleware/login.middleware')
const { create, remove, update, wholeMenu } = require('../controller/menu.controller')

// 1.新增菜单
menuRouter.post('/', verifyAuth, create)
// 2.删除菜单
menuRouter.delete('/:menuId', verifyAuth, remove)
// 3.修改菜单
menuRouter.patch('/:menuId', verifyAuth, update)
// 4.获取完整菜单树
menuRouter.post('/list', verifyAuth, wholeMenu)


module.exports = menuRouter