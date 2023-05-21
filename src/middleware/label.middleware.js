const labelService = require('../service/label.service')

const verifyLabelExists = async (ctx, next) => {
  // 1.取出要添加的内容
  const { labels } = ctx.request.body

  // 2.处理label数据
  // 2.1 label存在获取label的id
  // 2.2 label不存在创建这个label，获取到insertid
  // 最终将数据放到一个数组中
  const newLabels = []
  for (const name of labels) {
    const results = await labelService.getLabelByName(name)
    let label = null
    if (!results) {
      // 创建标签，获取insertid
      const result = await labelService.create(name)
      label = { id: result.insertId, name }
    } else {
      // 获取id
      label = { id: results.id, name }
    }
    newLabels.push(label)
  }

  ctx.labels = newLabels

  await next()
}


module.exports = {
  verifyLabelExists
}