const roleService = require('../service/role.service')
const { dateFormat } = require('../utils/tools')
const toolService = require('../service/tool.service')

class RoleController {
  async create(ctx, next) {
    const { name, intro, menuList } = ctx.request.body

    const role = { name, intro }

    // 新增角色前需要判断一下，这个角色存不存在

    const results = await roleService.create(role)

    if (menuList) {
      const insertId = results.insertId
      await roleService.assignMenu(insertId, menuList)
    }

    ctx.body = {
      code: 200,
      message: '创建角色成功~',
      data: results
    }
  }

  async remove(ctx, next) { 
    const { roleId }  = ctx.params

    if (roleId <= 3) {
      return ctx.body = {
        code: 500,
        message: 'id小于等于3的角色不允许删除！'
      }
    }

    const results = await roleService.remove(roleId)

    ctx.body = {
      code: 200,
      data: results
    }
  }

  async update(ctx, next) {
    const { roleId } = ctx.params
    const { name, intro, menuList } = ctx.request.body

    const role = { name, intro }

    const results = await roleService.update(role, Number(roleId))

    if (menuList) {
      await roleService.assignMenu(roleId, menuList)
    }

    ctx.body = {
      code: 200,
      message: '修改角色成功~',
      data: results
    }
  }

  async list(ctx, next) {

    // 1.获取角色列表信息
    const { offset = 0, size = 10, name, intro, createAt } = ctx.request.body

    const params = {}

    // 模糊查询
    if (name) params.name = name
    if (intro) params.intro = intro
    // 范围查询
    if (createAt && Array.isArray(createAt) && createAt.length === 2) params.createAt = dateFormat.times(createAt)

    const results = await roleService.list(String(offset), String(size), params)

    const totalCount = await toolService.queryListTotal('role', params)

    // 2.在角色的基本信息中添加这个角色的菜单信息
    for (const role of results) {
      const menu = await roleService.getRoleMenu(role.id)
      role.menuList = menu
    }

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: {
        list: results,
        totalCount
      }
    }
  }

  async assignMenu(ctx, next) {
    const { roleId } = ctx.params
    const { menuIds } = ctx.request.body

    await roleService.assignMenu(roleId, menuIds)

    ctx.body = {
      code: 200,
      message: '分配权限成功~'
    }
  }

  async ruleMenu(ctx, next) {
    const { roleId } = ctx.params

    const results = await roleService.getRoleMenu(roleId)

    ctx.body = {
      code: 200,
      data: results
    }
  }
}

module.exports = new RoleController()