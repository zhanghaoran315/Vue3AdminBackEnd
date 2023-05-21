const labelService = require('../service/label.service')
const { dateFormat } = require('../utils/tools')
const toolService = require('../service/tool.service')

class LabelController {
  async create(ctx, next) {
    const { name } = ctx.request.body

    const results = await labelService.create(name)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async remove(ctx, next) { 
    const { labelId } = ctx.params

    if (labelId <= 3) {
      return ctx.body = {
        code: 500,
        message: 'id小于等于3的部门不允许删除！'
      }
    }

    const results = await labelService.remove(labelId)

    ctx.body = {
      code: 200,
      message: '删除成功',
      data: results
    }
  }

  async list(ctx, next) {
    const { offset = 0, size = 10, name, createAt } = ctx.request.body

    const params = {}
    // 模糊查询
    if (name) params.name = name
    // 范围查询
    if (createAt && Array.isArray(createAt) && createAt.length === 2) params.createAt = dateFormat.times(createAt)

    const results = await labelService.list(String(offset), String(size), params)

    const totalCount = await toolService.queryListTotal('label', params)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: {
        list: results,
        totalCount
      }
    }
  }
}

module.exports = new LabelController()