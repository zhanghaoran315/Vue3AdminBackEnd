const userService = require('../service/user.service')
const fileService = require('../service/file.service')
const { dateFormat } = require('../utils/tools')
const toolService = require('../service/tool.service')

const fs = require('fs')

const { AVATAR_PATH } = require('../constants/file-path')

class UserController {
  // 创建用户
  async create(ctx, next) {
    // 1.获取用户传递过来的信息
    const { name, password, realname, cellphone, departmentId, roleId } = ctx.request.body

    const user = { name, password, realname, cellphone, departmentId, roleId }

    // 2.将user信息保存到数据库中
    const results = await userService.create(user)

    // 3.查看数据库的结果，告知前端创建成功
    ctx.body = {
      message: '创建用户成功~',
      data: results
    }
  }

  // 修改用户
  async update(ctx, next) {
    const { userId } = ctx.params
    const { name, realname, cellphone, departmentId, roleId } = ctx.request.body

    const user = { name, realname, cellphone, departmentId, roleId }

    const results = await userService.update(user, userId)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async detail(ctx, next) {
    const { userId } = ctx.params

    const results = await userService.detail(userId)

    ctx.body = {
      code: 200,
      data: results
    }
  }

  async remove(ctx, next) {
    const { userId } = ctx.params

    if (userId <= 5) {
      return ctx.body = {
        code: 500,
        message: 'id小于等于5的用户不允许删除！'
      }
    }

    const results = await userService.remove(userId)

    ctx.body = {
      code: 200,
      data: results
    }
  }

  async list(ctx, next) {
    const { offset = 0, size = 10, name, realname, cellphone, createAt, roleId, departmentId } = ctx.request.body

    const params = {}

    // 模糊查询
    if (name) params.name = name
    if (realname) params.realname = realname
    if (cellphone) params.cellphone = cellphone
    // 范围查询
    if (createAt && Array.isArray(createAt) && createAt.length === 2) params.createAt = dateFormat.times(createAt)
    // 相等查询
    if (roleId) params.roleId = roleId
    if (departmentId) params.departmentId = departmentId

    const results = await userService.list(String(offset), String(size), params)

    const totalCount = await toolService.queryListTotal('user', params)

    ctx.body = {
      code: 200,
      data: {
        list: results,
        totalCount
      }
    }
  }

  async avatarInfo(ctx, next) {
    const { userId } = ctx.params

    const results = await fileService.getAvatarInfoById(userId)

    if (!results) {
      return ctx.body = {
        code: 500,
        message: '用户暂未上传头像~'
      }
    }

    ctx.type = results.mimetype
    ctx.body = fs.createReadStream(`${AVATAR_PATH}/${results.filename}`)
  }

}

module.exports = new UserController()