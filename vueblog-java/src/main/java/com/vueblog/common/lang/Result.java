package com.vueblog.common.lang;

import lombok.Data;
import java.io.Serializable;

@Data
public class Result implements Serializable {

    private int code; // 200是正常，非200表示异常
    private String msg;
    private Object data;

    /**
     * 成功返回结果
     * @param data 返回数据
     * @return
     */
    public static Result success(Object data) {
        return success(200, "操作成功", data);
    }

    /**
     * 成功返回结果
     * @param code 状态码
     * @param data 返回数据
     * @return
     */
    public static Result success(int code, Object data) {
        return success(code, "操作成功", data);
    }

    /**
     * 成功返回结果
     * @param code 状态码
     * @param msg 提示信息
     * @param data 返回数据
     * @return
     */
    public static Result success(int code, String msg, Object data) {
        Result r = new Result();
        r.setCode(code);
        r.setMsg(msg);
        r.setData(data);
        return r;
    }

    /**
     * 失败返回结果
     * @return
     */
    public static Result fail() {
        return fail(400, "操作失败", null);
    }

    /**
     * 失败返回结果
     * @param msg 提示信息
     * @return
     */
    public static Result fail(String msg) {
        return fail(400, msg, null);
    }

    /**
     * 失败返回结果
     * @param msg 提示信息
     * @param data 返回数据
     * @return
     */
    public static Result fail(String msg, Object data) {
        return fail(400, msg, data);
    }

    /**
     * 失败返回结果
     * @param code 状态码
     * @param msg 提示信息
     * @param data 返回数据
     * @return
     */
    public static Result fail(int code, String msg, Object data) {
        Result r = new Result();
        r.setCode(code);
        r.setMsg(msg);
        r.setData(data);
        return r;
    }

}
