const fileRouter = require('@koa/router')()

fileRouter.prefix('/upload')

const { verifyAuth } = require('../middleware/login.middleware')

const { avatarHandler } = require('../middleware/file.middleware')

const { saveAvatarInfo } =  require('../controller/file.controller')

// 上传头像
fileRouter.post('/avatar', verifyAuth, avatarHandler, saveAvatarInfo)


module.exports = fileRouter