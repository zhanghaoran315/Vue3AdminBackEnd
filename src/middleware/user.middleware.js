const errorType = require('../constants/error-types')
const userService = require('../service/user.service')
const { md5Password } = require('../utils/tools')

// 1.注册用户的参数校验
const verifyUser = async (ctx, next) => {
  // 1.获取用户名和密码
  const { name, password } = ctx.request.body

  // 2.判断用户名和密码不能为空
  if (!name || !password) {
    return ctx.app.emit('error', errorType.NAME_OR_PASSWORD_IS_REQUIRED, ctx)
  }

  // 3.判断这次注册的用户有没有被注册过
  const results = await userService.getUserByName(name)
  if (results.length) {
    return ctx.app.emit('error', errorType.USER_ALREADY_EXISTS, ctx)
  }

  await next()
}

// 2.密码加密
const handlePassword = async (ctx, next) => {
  const { password } = ctx.request.body

  // 1.密码加密
  ctx.request.body.password = md5Password(password)

  await next()
}

module.exports = {
  verifyUser,
  handlePassword
}