const permissionService = require('../service/tool.service')
const errorType = require('../constants/error-types')

// 1.验证权限
const verifyPermssion = async (ctx, next) => {

  try {
    // params参数必须是 '/:momentId' 这样的
    // 1.获取params参数的key
    const [paramsKey] = Object.keys(ctx.params)
    // 2.获取表名
    const tableName = paramsKey.replace('Id', '')
    // 3.获取查询的id
    const tableId = ctx.params[paramsKey]
    // 4.获取user_id
    const { id } = ctx.user  

    // 也可以在这里检查有没有这个资源

    const isPermission = await permissionService.queryPermission(tableName, tableId, id)
    if (!isPermission) throw new Error()

    await next()
  } catch (error) {
    return ctx.app.emit('error', errorType.UNPERMISSION, ctx)
  }
}

// 2.验证资源是否存在
const verifyResource = async (ctx, next) => {
  await next()
}

module.exports = {
  verifyPermssion,
  verifyResource
}