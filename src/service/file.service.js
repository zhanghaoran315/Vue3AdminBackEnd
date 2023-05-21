const connections = require("../app/database")
const menuService = require('./menu.service')
const goodsData = require('../data/goods.json')

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

  async assignMenu(roleId, menuIds) {
    // 1.先删除之前的关系
    const deleteStatement = `DELETE FROM role_menu WHERE roleId = ?;`
    await connections.query(deleteStatement, [roleId])

    // 2.插入新的值
    const insertStatement = `INSERT INTO role_menu (roleId, menuId) VALUES (?, ?)`
    for (const menuId of menuIds) {
      await connections.query(insertStatement, [roleId, menuId])
    }
  }

  async getRoleMenu(roleId) {

    try {
      // 1.根据roleId获取所有的menuId
      const getMenuIdsStatement = `
    SELECT 
      rm.roleId, JSON_ARRAYAGG(rm.menuId) menuIds 
    FROM role_menu rm 
    WHERE rm.roleId = ? 
    GROUP BY rm.roleId; 
  `
      const [roleMenuIds] = await connections.query(getMenuIdsStatement, [roleId])
      const menuIds = roleMenuIds[0] ? roleMenuIds[0].menuIds : []


      console.log('22222222222222');

      // 2.获取完整的菜单数据
      const wholeMenu = await menuService.wholeMenu()

      // 3.从完整的菜单树中, 过滤到menuIds
      function filterMenu(menu) {
        const newMenu = []
        for (const item of menu) {
          if (item.children) {
            item.children = filterMenu(item.children)
          }
          if (menuIds.includes(item.id)) {
            newMenu.push(item)
          }
        }
        return newMenu
      }
      const finalMenu = filterMenu(wholeMenu)

      return finalMenu
    } catch (error) {
      console.log(error);
    }

  }
}


module.exports = new FileService()