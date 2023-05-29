const connections = require("../app/database")
class FileService {
  async saveAvatarInfo(avatar) {
    // 编写SQL语句
    const statement = `INSERT INTO avatar SET ?;`

    // 执行SQL语句
    // query可以直接传一个对象
    const [result] = await connections.query(statement, [avatar])

    // return result
    return result
  }

  async getAvatarInfoById(userId) {

    const statement = `SELECT * FROM avatar WHERE user_id = ?;`

    const [results] = await connections.execute(statement, [userId])
    // 应该是要拿用户最新的上传的头像

    return results.pop()
  }

  async savePictureInfo(filename, mimetype, size, momentId, userId) {
    const statement = `INSERT INTO picture (filename, mimetype, size, moment_id, user_id) VALUES (?, ?, ?, ?, ?);`

    const result = await connections.execute(statement, [filename, mimetype, size, momentId, userId])

    return result[0]
  }

  async getPictureByFilename(filename) {
    const statement = `SELECT * FROM picture WHERE filename = ?;`

    const [results] = await connections.execute(statement, [filename])

    return results[0]
  }
}


module.exports = new FileService()