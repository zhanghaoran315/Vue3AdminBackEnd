const menuService = require('../service/menu.service')

class MenuController {

  async create(ctx, next) {

    const { name, url, icon, sort, parentId, permission } = ctx.request.body

    const menu = { name, url, icon, sort, parentId, permission }

    if (!parentId) {
      // 创建的一级菜单
      menu.type = 1
    } else {
      const type = await menuService.getTypeByParentId(parentId)
      if (type) {
        menu.type = type
      } else {
        return ctx.body = {
          code: 500,
          message: '参数错误~'
        }
      }
    }

    const results = await menuService.create(menu)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }

  }

  async remove(ctx, next) {

    const { menuId } = ctx.params

    if (menuId <= 14) {
      return ctx.body = {
        code: 500,
        message: '系统内置菜单不允许删除！'
      }
    }

    const results = await menuService.remove(menuId)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async update(ctx, next) {
    const { menuId } = ctx.params

    const { name, url, icon, sort, parentId, permission } = ctx.request.body

    const menu = { name, url, icon, sort, parentId, permission }

    const results = await menuService.update(menu, menuId)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async wholeMenu(ctx, next) {

    const results = await menuService.wholeMenu()

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: {
        list: results
      }
    }
  }
}


module.exports = new MenuController()