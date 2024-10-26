const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
    transpileDependencies: true,
    publicPath: '/',
    devServer: {
        client: {
            //当出现编译错误或警告时，在浏览器中是否显示全屏覆盖。  示例为只显示错误信息
            overlay: {
                errors: false,
                warnings: false
            },
        }
    }
})
