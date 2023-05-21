const connections = require('../app/database')

class CommentService {
  async create(content, momentId, userId) {
    const statement = `INSERT INTO comment (content, moment_id, user_id) VALUES (?, ?, ?);`

    const [results] = await connections.execute(statement, [content, momentId, userId])

    return results
  }

  async reply(content, momentId, userId, commentId) {
    const statement = `INSERT INTO comment (content, moment_id, user_id, comment_id) VALUES (?, ?, ?, ?);`

    const [results] = await connections.execute(statement, [content, momentId, userId, commentId])

    return results
  }
}

module.exports = new CommentService()