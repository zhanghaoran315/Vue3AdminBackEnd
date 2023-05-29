const fileRouter = require('@koa/router')()

fileRouter.prefix('/upload')

const { verifyAuth } = require('../middleware/login.middleware')

const { avatarHandler, pictureHandler } = require('../middleware/file.middleware')

const { saveAvatarInfo, savePictureInfo } =  require('../controller/file.controller')

// 上传头像
fileRouter.post('/avatar', verifyAuth, avatarHandler, saveAvatarInfo)

// 上传动态配图
fileRouter.post('/picture', verifyAuth, pictureHandler, savePictureInfo)


module.exports = fileRouter