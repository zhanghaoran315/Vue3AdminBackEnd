const departmentRouter = require('@koa/router')()

departmentRouter.prefix('/department')

const { verifyAuth } = require('../middleware/login.middleware')
const { create, remove, update, list } = require('../controller/department.controller')

// 1.新增部门
departmentRouter.post('/', verifyAuth, create)
// 2.删除部门
departmentRouter.delete('/:departmentId', verifyAuth, remove)
// 3.修改部门
departmentRouter.patch('/:departmentId', verifyAuth, update)
// 4.部门列表
departmentRouter.post('/list', verifyAuth, list)

module.exports = departmentRouter