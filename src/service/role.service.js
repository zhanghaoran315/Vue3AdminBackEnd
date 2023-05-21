const connections = require('../app/database')
const menuService = require('../service/menu.service')
const { generateSql } = require('../utils/tools')

class RoleService {
  async create(role) {
    const statement = `INSERT INTO role SET ?;`

    const [results] = await connections.query(statement, [role])

    return results
  }

  async remove(roleId) { 
    const statement = `DELETE FROM role WHERE id = ?;`

    const [results] = await connections.execute(statement, [roleId])

    return results
  }

  async update(role, roleId) { 

    const statement = `UPDATE role SET ? WHERE id = ?;`

      
    const [results] = await connections.query(statement, [role, roleId])



    return results
  }

  async list(offset, size, params) {
    const statement = `SELECT * FROM role ${generateSql(params)} LIMIT ?, ?;`

    const [results] = await connections.execute(statement, [offset, size])

    return results
  }


  // 给角色分配权限
  async assignMenu(roleId, menuIds) {
    // 1.先删除之前的权限
    const deleteStatement = `DELETE FROM role_menu WHERE roleId = ?;`
    await connections.execute(deleteStatement, [roleId])

    // 2.插入新的值
    const insertStatement = `INSERT INTO role_menu (roleId, menuId) VALUES (?, ?);`

    for (const menuId of menuIds) {
      await connections.execute(insertStatement, [roleId, menuId])
    }
  }

  // 获取角色的菜单
  async getRoleMenu(roleId) {
    // 1.由roleId获取到所有的menuId
    const getMenuIdsByRoleId = `
      SELECT rm.roleId roleId, JSON_ARRAYAGG(rm.menuId) menuIds 
      FROM role_menu rm WHERE rm.roleId = ? GROUP BY rm.roleId;
    `

    const [results] = await connections.execute(getMenuIdsByRoleId, [roleId])
    // 2.所有的menuId
    const menuIds = results[0] ? results[0].menuIds : []

    // 3.获取完整的菜单树
    const wholeMenu = await menuService.wholeMenu()

    // 4.从完整的菜单树中过滤menuIds
    function filterMenu(allMenu) {
      const newMenuTree = []

      for (const menu of allMenu) {
        // 1.过滤子级
        if (menu.children && menu.children.length > 0) {
          menu.children = filterMenu(menu.children)
        }
        // 2.过滤当前级
        if (menuIds.includes(menu.id)) {
          newMenuTree.push(menu)
        }
      }

      return newMenuTree
    }

    const finalMenu = filterMenu(wholeMenu)

    return finalMenu
  }
}

module.exports = new RoleService()