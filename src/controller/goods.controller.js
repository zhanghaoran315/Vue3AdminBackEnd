const goodsService = require('../service/goods.service')
const toolService = require('../service/tool.service')


class GoodsController {
  async create(ctx, next) {
    const goods = ctx.request.body

    const result = await goodsService.create(goods)

    ctx.body = {
      code: 200,
      message: '创建商品成功~',
      data: result
    }
  }

  async remove(ctx, next) {

  }

  async update(ctx, next) {

  }

  async list(ctx, next) {
    // 1.获取角色基本信息
    const { offset = 0, size = 10 } = ctx.request.body

    const result = await goodsService.list(Number(offset), Number(size))

    const totalCount = await toolService.queryListTotal('goods')

    ctx.body = {
      code: 200,
      message: '获取商品列表~',
      data: {
        list: result,
        totalCount
      }
    }
  }

  async detail(ctx, next) {

  }

  async assignMenu(ctx, next) {
    // 1.获取参数
    const roleId = ctx.params.roleId
    const menuIds = ctx.request.body.menuIds

    // 2.分配权限
    await roleService.assignMenu(roleId, menuIds)

    // 3.返回结果
    ctx.body = {
      code: 0,
      message: '分配权限成功~'
    }
  }
}

module.exports = new GoodsController()