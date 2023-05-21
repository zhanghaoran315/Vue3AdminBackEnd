const Koa = require('koa')
const bodyparser = require('koa-bodyparser')
const useRoutes = require('../router')
const errorHandler = require('../utils/error-handler')

const app = new Koa()

app.use(bodyparser())
// 解析 json 和 urlencoded 参数与 ctx.request.body

// 注册路由
app.useRoutes = useRoutes
app.useRoutes()

// 错误处理
app.on('error', errorHandler)

module.exports = app