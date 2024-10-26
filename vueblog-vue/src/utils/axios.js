import axios from 'axios'
import Element from 'element-ui'
import router from '../router'
import store from '../store'


axios.defaults.baseURL = "http://localhost:8081"

// 请求拦截器
axios.interceptors.request.use(config => {
    return config
}, error => { 
    return Promise.reject(error);
})

// 响应拦截器
axios.interceptors.response.use(response => {
    let res = response.data

    if (res.code === 200) {
        return response
    } else {
        Message.error(`服务器返回错误代码: ${res.code}, 错误信息: ${res.msg}`, { duration: 3 * 1000 })
        return Promise.reject(res.msg)
    }
}, error => {
    console.log(error)
    if(error.response.data) {
        error.message = error.response.data.msg
    }

    if(error.response.status === 401) {
        store.commit("REMOVE_INFO")
        router.push("/login")
    }

    Element.Message.error(error.message || '服务器内部错误，请稍后再试', {duration: 3 * 1000})
    return Promise.reject(error)
})