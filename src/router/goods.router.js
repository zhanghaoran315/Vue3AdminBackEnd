const Router = require('@koa/router')

const amountlist = require('../data/amountlist.json')
const categorycount = require('../data/categorycount.json')
const categorysale = require('../data/categorysale.json')
const categoryfavor = require('../data/categoryfavor.json')
const saletop5 = require('../data/saletop5.json')
const addresssale = require('../data/addresssale.json')

// const { getRandomNumberByRange } = require('../utils/common')

const goodsRouter = new Router({ prefix: '/goods' })

const { verifyAuth } = require('../middleware/login.middleware')
const { create, remove, update, list, detail } = require('../controller/goods.controller')

// 新增
goodsRouter.post('/', verifyAuth, create)
// 删除
goodsRouter.delete('/:roleId', verifyAuth, remove)
// 修改
goodsRouter.patch('/:roleId', verifyAuth, update)
// 查询列表
goodsRouter.post('/list', verifyAuth, list)
// 查询详情
goodsRouter.get('/:roleId', verifyAuth, detail)

// 商品数据
// 每个分类商品的个数
goodsRouter.get('/category/count', verifyAuth, (ctx, next) => {
  ctx.body = {
    code: 200,
    data: categorycount
  }
})

// 每个分类商品的销量
goodsRouter.get('/category/sale', verifyAuth, (ctx, next) => {
  ctx.body = {
    code: 200,
    data: categorysale
  }
})

// 每个分类商品的收藏
goodsRouter.get('/category/favor', verifyAuth, (ctx, next) => {
  ctx.body = {
    code: 200,
    data: categoryfavor
  }
})


// 销量前5的商品数量
goodsRouter.get('/sale/top5', verifyAuth, (ctx, next) => {
  ctx.body = {
    code: 200,
    data: saletop5
  }
})


// 不同城市销量
goodsRouter.get('/address/sale', verifyAuth, (ctx, next) => {
  ctx.body = {
    code: 200,
    data: addresssale
  }
})


// 商品数据统计的数量
goodsRouter.get('/amount/list', verifyAuth, (ctx, next) => {
  ctx.body = {
    code: 200,
    data: amountlist
  }
})



module.exports = goodsRouter