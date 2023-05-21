const connections = require('../app/database')

class MenuService {
  // 新建菜单
  async create(menu) {
    const statement = `INSERT INTO menu SET ?;`

    const [results] = await connections.query(statement, [menu])

    return results
  }

  async remove(menuId) {
    const statement = `DELETE FROM menu WHERE id = ?;`

    const [results] = await connections.execute(statement, [menuId])

    return results
  }

  async update(menu, menuId) {
    const statement = `UPDATE menu SET ? WHERE id = ?;`

    const [results] = await connections.query(statement, [menu, menuId])

    return results
  }

  async wholeMenu() {
    const statement = `
    SELECT 
      m1.id id, m1.name name, 1 type, m1.icon icon, m1.url url, m1.sort sort,   
      m1.createAt createAt, m1.updateAt updateAt,  
      (SELECT 
        JSON_ARRAYAGG(
          JSON_OBJECT(
            'id', m2.id, 'name', m2.name, 'type', 2, 'parentId', m2.parentId, 'url', m2.url, 'sort', m2.sort,
            'createAt', m2.createAt, 'updateAt', m2.updateAt,
            'children', (
              SELECT 
                JSON_ARRAYAGG(
                  JSON_OBJECT(
                    'id', m3.id, 'name', m3.name, 'type', 3, 'parentId', m3.parentId, 'url', m3.url, 'sort', m3.sort,
                    'permission', m3.permission, 'createAt', m3.createAt, 'updateAt', m3.updateAt
                  )
                ) 
              FROM menu m3 WHERE m3.parentId = m2.id ORDER BY m3.sort
            ) 
          )
        )
      FROM menu m2 WHERE m2.parentId = m1.id ORDER BY m2.sort
      ) children
    FROM menu m1 
      WHERE m1.parentId IS NULL;
    `

    const [results] = await connections.execute(statement)

    return results
  }

  async getTypeByParentId(parentId) {
    const statement = `SELECT menu.type type FROM menu WHERE id = ?;` 

    const [results] = await connections.execute(statement, [parentId])

    return results[0] ? results[0].type : 0
  }
}

module.exports = new MenuService()