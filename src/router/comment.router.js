const commentRouter = require('@koa/router')()

commentRouter.prefix('/comment')

const { verifyAuth } = require('../middleware/login.middleware')
const { create, reply } = require('../controller/comment.controller')


// 1.发表评论
commentRouter.post('/', verifyAuth, create)
// 2.回复评论
commentRouter.post('/:commentId/reply', verifyAuth, reply)

module.exports = commentRouter