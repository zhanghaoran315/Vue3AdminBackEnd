const connections = require('../app/database')
const { APP_PORT, APP_HOST } = require('../app/config')

class MomentService {
  async create(moment) {
    const statement = `INSERT INTO moment SET ?;`

    const [results] = await connections.query(statement, [moment])

    return results
  }

  // 展示动态的评论列表
  async getMomentList(offset, size) {
    const statement = `
      SELECT 
        m.id id, m.title title, m.content content, m.createAt createAt, m.updateAt updateAt,
        JSON_OBJECT('id', u.id, 'name', u.name, 'avatarUrl', u.avatar_url) author,
        (SELECT COUNT(*) FROM comment c WHERE c.moment_id = m.id) commentCount,
        (SELECT COUNT(*) FROM moment_label ml WHERE ml.moment_id = m.id) labelCount,
        (
					SELECT JSON_ARRAYAGG(CONCAT('${APP_HOST}:${APP_PORT}/moment/images/',p.filename)) 
					FROM picture p WHERE m.id = p.moment_id
				) images
      FROM moment m LEFT JOIN user u ON m.user_id = u.id
        ORDER BY m.updateAt DESC  
        LIMIT ?, ?;
    `

    const [results] = await connections.execute(statement, [offset, size])

    return results
  }

  // 展示每条动态的评论数量
  async getMomentById(id) {
    // SELECT 
    //     m.id id, m.content content, m.createAt createAt, m.updateAt updateAt,
    //     JSON_OBJECT('id', u.id, 'name', u.name) author,
    //     (IF(COUNT(c.id), JSON_ARRAYAGG(JSON_OBJECT('id', c.id, 'content', c.content, 'commentId', c.comment_id, 
    //       'user', JSON_OBJECT('id', cu.id, 'name', cu.name))), NULL)
    //     ) comments
    //   FROM moment m 
    //     LEFT JOIN user u ON m.user_id = u.id
    //     LEFT JOIN comment c ON m.id = c.moment_id
    //     LEFT JOIN user cu ON c.user_id = cu.id
    //   WHERE m.id = ?
    //   GROUP BY m.id;
    const statement = `
      SELECT 
        m.id id, m.title title, m.content content, m.createAt createAt, m.updateAt updateAt,
        JSON_OBJECT('id', u.id, 'name', u.name) author,
        (
          SELECT 
            JSON_ARRAYAGG(JSON_OBJECT('id', l.id, 'name', l.name)) 
          FROM moment_label ml 
            LEFT JOIN label l ON ml.label_id = l.id 
          WHERE ml.moment_id = m.id) labels,
        (
          IF(
            COUNT(c.id), 
            JSON_ARRAYAGG(
              JSON_OBJECT(
                'id', c.id, 'content', c.content, 'commentId', c.comment_id, 
                'user', JSON_OBJECT('id', cu.id, 'name', cu.name))), 
            NULL
            )
        ) comments,
        (
					SELECT JSON_ARRAYAGG(CONCAT('${APP_HOST}:${APP_PORT}',p.filename)) 
					FROM picture p WHERE m.id = p.moment_id
				) images
      FROM moment m 
        LEFT JOIN user u ON m.user_id = u.id
        LEFT JOIN comment c ON m.id = c.moment_id
        LEFT JOIN user cu ON c.user_id = cu.id
      WHERE m.id = ?
      GROUP BY m.id;
    `

    const [results] = await connections.execute(statement, [id])

    return results[0] ? results[0] : null
  }

  async update(moment, id) {
    const statement = `UPDATE moment SET ? WHERE id = ?;`
      
    const [results] = await connections.query(statement, [moment, id])

    return results
  }

  async remove(id) {
    const statement = `DELETE FROM moment WHERE id = ?;`

    const [results] = await connections.execute(statement, [id])

    return results
  }

  async hasLabel(momentId, labelId) {
    const statement = `SELECT * FROM moment_label WHERE moment_id = ? AND label_id =?;`

    const [results] = await connections.query(statement, [momentId, labelId])

    return !!results[0]
  }

  async addLabel(momentId, labelId) {
    const statement = `INSERT INTO moment_label (moment_id, label_id) VALUES (?, ?);`

    const [results] = await connections.query(statement, [momentId, labelId])

    return results
  }
}

module.exports = new MomentService()