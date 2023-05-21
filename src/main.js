const app = require('./app')
const config = require('./app/config')
require('./app/database')

app.listen(config.APP_PORT, () => {
  console.log(`UMS服务器在${config.APP_PORT}端口启动成功~`);
})