import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        token: '',
        userInfo: JSON.parse(sessionStorage.getItem("userInfo"))
    },
    getters: {
        getUser: state => {
            return state.userInfo
        }
    },
    mutations: {
        // 设置token
        SET_TOKEN: (state, token) => {
            state.token = token
            localStorage.setItem("token", token)
        },
        // 设置用户信息
        SET_USERINFO: (state, userInfo) => {
            state.userInfo = userInfo
            sessionStorage.setItem("userInfo", JSON.stringify(userInfo))
        },
        // 清除用户信息
        REMOVE_INFO: (state) => {
            state.token = ''
            state.userInfo = {}
            localStorage.setItem("token", '')
            sessionStorage.setItem("userInfo", JSON.stringify(''))
        }
    },
    actions: {
    },
    modules: {
    }
})
