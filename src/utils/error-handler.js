const errorType = require('../constants/error-types')

const errorHandler = (error, ctx) => {
  let status, message;

  switch (error) {
    case errorType.NAME_OR_PASSWORD_IS_REQUIRED:
      status = 400 // Bad Request
      message = '用户名或者密码不能为空~'
      break
    case errorType.USER_ALREADY_EXISTS:
      status = 409 // Conflict
      message = '用户已经存在~'
      break
    case errorType.USER_DOES_NOT_EXISTS:
      status = 400
      message = '用户不存在~'
      break
    case errorType.PASSWORD_IS_INCORRECT:
      status = 400
      message = '密码是错误的~'
      break
    case errorType.UNAUTHORIZATION:
      status = 401
      message = '无效的token~'
      break
    case errorType.UNPERMISSION:
      status = 401
      message = '您不具备操作权限~'
      break
    default:
      status = 404
      message = 'NOT FOUND'
  }

  ctx.status = status
  ctx.body = message
}

module.exports = errorHandler