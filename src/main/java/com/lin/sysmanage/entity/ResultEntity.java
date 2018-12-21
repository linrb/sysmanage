package com.lin.sysmanage.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * 页面响应entity
 */
public class ResultEntity extends HashMap<String, Object> {
    private static final long serialVersionUID = 1L;

    public ResultEntity() {
        put("code", 0);
    }

    public static ResultEntity error() {
        return error(500, "未知异常，请联系管理员");
    }

    public static ResultEntity error(String msg) {
        return error(500, msg);
    }

    public static ResultEntity error(int code, String msg) {
        ResultEntity r = new ResultEntity();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }

    public static ResultEntity ok(String msg) {
        ResultEntity r = new ResultEntity();
        r.put("msg", msg);
        return r;
    }

    public static ResultEntity ok(Map<String, Object> map) {
        ResultEntity r = new ResultEntity();
        r.putAll(map);
        return r;
    }

    public static ResultEntity ok() {
        return new ResultEntity();
    }

    @Override
    public ResultEntity put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
