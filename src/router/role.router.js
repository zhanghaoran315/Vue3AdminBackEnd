const roleRouter = require('@koa/router')()

roleRouter.prefix('/role')

const { verifyAuth } = require('../middleware/login.middleware')
const { create, remove, update, list, assignMenu, ruleMenu } = require('../controller/role.controller')


// 0.获取角色的菜单
roleRouter.get('/:roleId/menu', verifyAuth, ruleMenu)

// 1.新增角色
roleRouter.post('/', verifyAuth, create)
// 2.删除角色
roleRouter.delete('/:roleId', verifyAuth, remove)
// 3.修改角色
roleRouter.patch('/:roleId', verifyAuth, update)
// 4.角色列表
roleRouter.post('/list', verifyAuth, list)

// 5.给角色分配权限
roleRouter.post('/:roleId/menu', verifyAuth, assignMenu)



module.exports = roleRouter