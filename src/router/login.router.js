const loginRouter = require('@koa/router')()

const { verifyLogin, verifyAuth } = require('../middleware/login.middleware')
const { login, success } = require('../controller/login.controller')

// 1.登录
loginRouter.post('/login', verifyLogin, login)

// 2.鉴权
loginRouter.get('/verify', verifyAuth, success)

module.exports = loginRouter