const connections = require('../app/database')
const { generateSql } = require('../utils/tools')

class UserService {
  // 1.创建用户
  async create(user) {
    const statement = `INSERT INTO user SET ?;`

    const [results] = await connections.query(statement, [user])

    return results
  }

  // 2.判断用户是否存在
  async getUserByName(name) {
    const statement = `SELECT * FROM user WHERE name = ?;`

    const [results] = await connections.execute(statement, [name])

    return results
  }

  async update(user, userId) {
    const statement = `UPDATE user SET ? WHERE id = ?;`

    const [results] = await connections.query(statement, [user, userId])

    return results
  }

  async detail(userId) {
    const statement = `
      SELECT 
        u.id id, u.name name, u.realName realName, u.cellphone cellphone, u.status status, u.createAt createAt, u.updateAt updateAt,
        JSON_OBJECT('id', r.id, 'name', r.name, 'intro', r.intro, 'createAt', r.createAt, 'updateAt', r.updateAt) role,
        JSON_OBJECT('id', d.id, 'name', d.name, 'parentId', d.parentId, 'createAt', d.createAt, 'updateAt', d.updateAt) department
      FROM user u 
        LEFT JOIN role r ON u.roleId = r.id
        LEFT JOIN department d ON u.departmentId = d.id
        WHERE u.id = ?;
    `
    const [results] = await connections.execute(statement, [userId])

    return results[0] ? results[0] : null

  }

  async remove(userId) {
    const statement = `DELETE FROM user WHERE id = ?;`

    const [results] = await connections.execute(statement, [userId])

    return results
  }

  async list(offset, size, params) {

    const statement = `
      SELECT 
        u.id id, u.name name, u.realname realname, u.cellphone cellphone, u.status status, 
        u.roleId roleId, u.departmentId departmentId, u.createAt createAt, u.updateAt updateAt 
      FROM user u 
        ${generateSql(params)}
        LIMIT ?, ?;
    `

    const [results] = await connections.execute(statement, [offset, size])

    return results
  }

  async updateAvatarUrlById(avatarUrl, id) {
    const statement = `UPDATE user SET avatar_url = ? WHERE id = ?;`

    const [results] = await connections.execute(statement, [avatarUrl, id])

    return results
  }
}


module.exports = new UserService()