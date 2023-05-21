const connections = require('../app/database')
const menuService = require('./menu.service')
const { generateSql } = require('../utils/tools')

class LabelService {
  async create(name) {
    const statement = `INSERT INTO label (name) VALUES (?);`

    const [results] = await connections.execute(statement, [name])

    return results
  }

  async remove(labelId) { 
    const statement = `DELETE FROM label WHERE id = ?;`

    const [results] = await connections.execute(statement, [labelId])

    return results
  }

  async list(offset, size, params) {
    const statement = `SELECT * FROM label ${generateSql(params)} LIMIT ?, ?;`

    const [results] = await connections.execute(statement, [offset, size])

    return results
  }

  async getLabelByName(name) {
    const statement = `SELECT * FROM label WHERE name = ?;`

    const [results] = await connections.execute(statement, [name])

    return results[0]
  }
}

module.exports = new LabelService()