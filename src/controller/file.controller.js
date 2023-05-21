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
      user_id:  id,
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

}

module.exports = new FileController()