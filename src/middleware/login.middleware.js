const errorType = require('../constants/error-types')
const userService = require('../service/user.service')
const { md5Password } = require('../utils/tools')
const { PUBLIC_KEY } = require('../app/config')
const jwt = require('jsonwebtoken')

// 1.验证登录
const verifyLogin = async (ctx, next) => {
  // 1.获取用户名和密码
  const { name, password } = ctx.request.body

  // 2.验证用户名和密码不能为空
  if (!name || !password) {
    return ctx.app.emit('error', errorType.NAME_OR_PASSWORD_IS_REQUIRED, ctx)
  }

  // 3.判断用户是否存在
  const results = await userService.getUserByName(name)
  if (!results.length) {
    return ctx.app.emit('error', errorType.USER_DOES_NOT_EXISTS, ctx)
  }

  // 4.判断密码和数据库中的密码是否一致（加密）
  if (md5Password(password) !== results[0].password) {
    return ctx.app.emit('error', errorType.PASSWORD_IS_INCORRECT)
  }

  ctx.user = results[0]

  await next()
}

// 2.验证token
const verifyAuth = async (ctx, next) => {
  try {
    // 1.获取token
    const authorization = ctx.headers.authorization
    const token = authorization.replace('Bearer ', '')

    const result = jwt.verify(token, PUBLIC_KEY, {
      algorithms: ['RS256']
    })

    ctx.user = result

    await next()
  } catch (error) {
    console.log('error: ====> ', error);
    ctx.app.emit('error', errorType.UNAUTHORIZATION, ctx)
  }
}


module.exports = {
  verifyLogin,
  verifyAuth
}