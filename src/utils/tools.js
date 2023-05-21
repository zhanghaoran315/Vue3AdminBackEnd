const crypto = require('crypto')
const dayjs = require('dayjs')

// 密码加密
const md5Password = (password) => {

  // 1.生成一个md5对象
  const md5 = crypto.createHash('md5')

  // 2.加密密码
  const result = md5.update(password).digest('hex')
  return result
}

// 日期处理
const dateFormat = {
  start: (time) => dayjs(time).startOf('day').format('YYYY-MM-DD HH:mm:ss'),
  end: (time) => dayjs(time).endOf('day').format('YYYY-MM-DD HH:mm:ss'),
  times: function ([t1, t2]) {
    return [this.start(t1), this.end(t2)]
  }
}

// 生成SQL语句
const generateSql = (params) => {
  let sqlArr = []

  // 相等
  const equalityQuery = ['roleId', 'departmentId']
  // 范围
  const rangeQuery = ['createAt']

  for (const key in params) {
    let sqlStr = ''
    if (equalityQuery.includes(key)) {
      // 相等查询
      sqlStr = `${key} = ${params[key]}`
    } else if (rangeQuery.includes(key)) {
      // 范围查询
      sqlStr = `${key} BETWEEN '${params[key][0]}' AND '${params[key][1]}'`
    } else {
      // 模糊查询
      sqlStr = ` ${key} LIKE '%${params[key]}%'`
    }
    sqlArr.push(sqlStr)
  }

  return sqlArr.length ? `WHERE ${sqlArr.join(' AND ')}` : ''
}

module.exports = {
  md5Password,
  dateFormat,
  generateSql
}