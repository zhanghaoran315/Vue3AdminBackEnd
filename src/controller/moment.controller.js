const momentService = require('../service/moment.service')
const toolService = require('../service/tool.service')
const fileService = require('../service/file.service')
const { PICTURE_PATH } = require('../constants/file-path')
const fs = require('fs')


class MomentController {
  async create(ctx, next) {

    const { id } = ctx.user

    const { content, title } = ctx.request.body

    const moment = { title, content, user_id: id }

    const results = await momentService.create(moment)

    ctx.body = {
      code: 200,
      message: '发表动态成功~',
      data: results
    }
  }

  async list(ctx, next) {
    const { offset = 0, size = 10 } = ctx.request.body

    const results = await momentService.getMomentList(String(offset), String(size))

    const totalCount = await toolService.queryListTotal('moment')

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: {
        list: results,
        totalCount
      }
    }
  }

  async detail(ctx, next) {
    const { momentId } = ctx.params

    const results = await momentService.getMomentById(momentId)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async update(ctx, next) {

    const { momentId } = ctx.params
    const { content, title } = ctx.request.body

    const moment = {}

    if (content) moment.content = content
    if (title) moment.title = title

    const results = await momentService.update(moment, momentId)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async remove(ctx, next) {

    const { momentId } = ctx.params

    const results = await momentService.remove(momentId)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  async addLabels(ctx, next) {

    const { momentId } = ctx.params
    const { labels } = ctx

    // 添加所有的标签
    for (const label of labels) {
      // 判断动态是否已经有这个标签了
      const isExists = await momentService.hasLabel(momentId, label.id)

      if (!isExists) {
        await momentService.addLabel(momentId, label.id)
      }
    }

    ctx.body = {
      code: 200,
      message: '添加标签成功~'
    }
  }

  async pictureInfo(ctx, next) {
    const { filename } = ctx.params

    const results = await fileService.getPictureByFilename(filename)

    if (!results) {
      return ctx.body = {
        code: 400,
        message: '资源不存在~'
      }
    }

    ctx.response.set('content-type', results.mimetype)
    ctx.body = fs.createReadStream(`${PICTURE_PATH}/${filename}`)
  }
}


module.exports = new MomentController()