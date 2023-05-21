const jwt = require('jsonwebtoken')
const { PRIVATE_KEY } = require('../app/config')

class LoginController {
  // 1.登录
  login(ctx, next) {
    const { id, name } = ctx.user
    const token = jwt.sign({ id, name }, PRIVATE_KEY, {
      expiresIn: '2 days',
      algorithm: 'RS256'
    })

    ctx.body = {
      code: 200,
      data: {
        id,
        name,
        token
      }
    }
  }

  // 2.验证token
  success(ctx, next) {
    ctx.body = {
      code: 200,
      message: '授权成功~',
      data: ctx.user
    }
  }
}

module.exports = new LoginController()