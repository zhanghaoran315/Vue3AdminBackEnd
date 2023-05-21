const userRouter = require('@koa/router')()

userRouter.prefix('/users')

const { verifyUser, handlePassword } = require('../middleware/user.middleware')
const { verifyAuth } = require('../middleware/login.middleware')
const { create, update, detail, list, remove, avatarInfo } = require('../controller/user.controller')


// 0.获取用户详情 - 登录页
userRouter.get('/:userId', verifyAuth, detail)

// 1.创建用户
userRouter.post('/', verifyUser, handlePassword, create)
// 2.修改用户
userRouter.patch('/:userId', verifyAuth, update)
// 3.获取用户列表
userRouter.post('/list', verifyAuth, list)
// 4.删除用户
userRouter.delete('/:userId', verifyAuth, remove)

// 5.查看用户头像
userRouter.get('/avatar/:userId', avatarInfo)


module.exports = userRouter