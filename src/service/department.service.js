const connections = require('../app/database')
const menuService = require('./menu.service')
const { generateSql } = require('../utils/tools')

class DepartmentService {
  async create(department) {
    const statement = `INSERT INTO department SET ?;`

    const [results] = await connections.query(statement, [department])

    return results
  }

  async remove(departmentId) { 
    const statement = `DELETE FROM department WHERE id = ?;`

    const [results] = await connections.execute(statement, [departmentId])

    return results
  }

  async update(department, departmentId) { 
    const statement = `UPDATE department SET ? WHERE id = ?;`

    const [results] = await connections.query(statement, [department, departmentId])

    return results
  }

  async list(offset, size, params) {
    const statement = `SELECT * FROM department ${generateSql(params)} LIMIT ?, ?;`

    const [results] = await connections.execute(statement, [offset, size])

    return results
  }
}

module.exports = new DepartmentService()