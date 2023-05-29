const fileService = require('../service/file.service')
const userService = require('../service/user.service')
const { APP_PORT, APP_HOST } = require('../app/config')

class FileController {
  async saveAvatarInfo(ctx, next) {
    // 1.获取对应的信息
    const { originalname, mimetype, filename, size } = ctx.request.file
    const { id } = ctx.user

    // 2.保存图片和用户信息
    const avatar = {
      user_id: id,
      filename,
      size,
      mimetype,
      originalname
    }

    const results = await fileService.saveAvatarInfo(avatar)

    // 3.将头像的地址信息，保存到user表中
    const avatarUrl = `${APP_HOST}:${APP_PORT}/users/avatar/${id}`
    await userService.updateAvatarUrlById(avatarUrl, id)

    ctx.body = {
      code: 200,
      message: '操作成功~',
      data: avatarUrl
    }
  }

  async savePictureInfo(ctx, next) {
    const files = ctx.request.files
    const { id } = ctx.user
    const { momentId } = ctx.query


    // 2.将图片信息保存到数据库中
    for (const file of files) {
      const { filename, mimetype, size } = file
      await fileService.savePictureInfo(filename, mimetype, size, momentId, id)
    }

    ctx.body = {
      code: 200,
      message: "动态配图上传成功~"
    }

    ctx.body = {
      code: 200,
      message: '操作成功~'
    }
  }

}

module.exports = new FileController()