package com.lin.sysmanage.utils;

import com.lin.sysmanage.entity.ResultEntity;

/**
 * 通用工具类
 *
 */
public class CommonUtils {

	/**
	 * 操作成功
	 */
	public static final String MSG_OPERATION_SUCCESS = "操作成功！";

	/**
	 * 操作失败
	 */
	public static final String MSG_OPERATION_FAILED = "操作失败！";

	/**
	 * 删除时，提示有子节点无法删除
	 */
	public static final String MSG_HAS_CHILD = "操作失败，当前所选数据有子节点数据！";

	/**
	 * 加载表单数据错误提示
	 */
	public static final String MSG_INIT_FORM = "初始化表单数据失败，请重试！";

	/**
	 * 超级管理员ID
	 */
	public static final long SUPER_ADMIN = 1;

	/**
	 * 数据标识
	 */
	public static final String DATA_ROWS = "rows";

	/**
	 * 未授权错误代码
	 */
	public static final int UNAUTHORIZATION_CODE = 401;
	
	/**
	 * 对象是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isNullOrEmpty(Object obj) {
		if (obj == null) {
			return true;
		}
		return false;
	}

	/**
	 * 判断整数是否大于零
	 * 
	 * @param number
	 * @return
	 */
	public static boolean isIntThanZero(int number) {
		if (number > 0) {
			return true;
		}
		return false;
	}
	
	/**
	 * 新增，修改提示
	 * @param count
	 * @return
	 */
	public static ResultEntity msg(int count) {
		if(isIntThanZero(count)){
			return ResultEntity.ok(MSG_OPERATION_SUCCESS);
		}
		return ResultEntity.error(MSG_OPERATION_FAILED);
	}
	
	/**
	 * 查询详情提示
	 * @param data
	 * @return
	 */
	public static ResultEntity msg(Object data) {
		if(isNullOrEmpty(data)){
			return ResultEntity.error(MSG_INIT_FORM);
		}
		return ResultEntity.ok().put(DATA_ROWS, data);
	}
	
	/**
	 * 返回数据
	 * @param data
	 * @return
	 */
	public static ResultEntity msgNotCheckNull(Object data) {
		return ResultEntity.ok().put(DATA_ROWS, data);
	}
	
	/**
	 * 删除提示
	 * @param total
	 * @param count
	 * @return
	 */
	public static ResultEntity msg(Object[] total, int count) {
		if(total.length == count){
			return ResultEntity.ok(MSG_OPERATION_SUCCESS);
		}else{
			if(isIntThanZero(count)){
				return ResultEntity.error(removeFailed(total.length, count));
			}else{
				return ResultEntity.error(MSG_OPERATION_FAILED);
			}
		}
	}
	
	/**
	 * 删除数据项不是全部所选
	 * @param total
	 * @param process
	 * @return
	 */
	public static String removeFailed(int total, int process){
		return "本次共处理："+String.valueOf(total)+"条，成功："+String.valueOf(process)+"条！";
	}
}
