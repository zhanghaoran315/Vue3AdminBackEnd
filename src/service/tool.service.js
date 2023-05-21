const connections = require('../app/database')
const { generateSql } = require('../utils/tools')

class ToolService {
  // 查询这条数据是否是这个用户发布的
  async queryPermission(tableName, tableId, userId) {
    const statement = `SELECT * FROM ${tableName} WHERE id = ? AND user_id = ?;`

    const [results] = await connections.execute(statement, [tableId, userId])

    return !!results.length
  }

  // 查询列表的总条数
  async queryListTotal(tableName, params = {}) {
    const statement = `SELECT COUNT(*) totalCount FROM ${tableName} ${generateSql(params)};`

    const [results] = await connections.execute(statement)

    return results[0] ? results[0].totalCount : 0
  }
}


module.exports = new ToolService()