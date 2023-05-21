const departmentService = require('../service/department.service')
const { dateFormat } = require('../utils/tools')
const toolService = require('../service/tool.service')

class DepartmentController {
  async create(ctx, next) {
    const { name, parentId, leader } = ctx.request.body

    const department = { name, parentId, leader }

    const results = await departmentService.create(department)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async remove(ctx, next) { 
    const { departmentId } = ctx.params

    if (departmentId <= 3) {
      return ctx.body = {
        code: 500,
        message: 'id小于等于3的部门不允许删除！'
      }
    }

    const results = await departmentService.remove(departmentId)

    ctx.body = {
      code: 200,
      message: '删除成功',
      data: results
    }
  }

  async update(ctx, next) { 

    const { departmentId } = ctx.params

    const { name, parentId, leader } = ctx.request.body

    const department = { name, leader, parentId }

    // if (parentId) department.parentId = parentId

    const results = await departmentService.update(department, Number(departmentId))

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }

  }

  async list(ctx, next) {
    const { offset = 0, size = 10, name, leader, createAt } = ctx.request.body

    const params = {}
    // 模糊查询
    if (name) params.name = name
    if (leader) params.leader = leader
    // 范围查询
    if (createAt && Array.isArray(createAt) && createAt.length === 2) params.createAt = dateFormat.times(createAt)

    const results = await departmentService.list(String(offset), String(size), params)

    const totalCount = await toolService.queryListTotal('department', params)

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

module.exports = new DepartmentController()