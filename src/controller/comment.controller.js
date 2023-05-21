const commentService = require('../service/comment.service')

class CommentController {
  // 发表评论
  async create(ctx, next) {
    const { momentId, content } = ctx.request.body
    const { id } = ctx.user

    const results = await commentService.create(content, momentId, id)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }

  // 回复评论
  async reply(ctx, next)  {
    const { commentId } = ctx.params
    const { content, momentId } = ctx.request.body
    const { id } = ctx.user

    const results = await commentService.reply(content, momentId, commentId, id)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: results
    }
  }
}


module.exports = new CommentController()