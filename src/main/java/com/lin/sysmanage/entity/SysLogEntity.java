package com.lin.sysmanage.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 系统日志记录表
 */
public class SysLogEntity extends Page implements Serializable  {

	private static final long serialVersionUID = 1L;

	/**
	 * 日志主键
	 */
	private Integer logId;

	/**
	 * 用户ID
	 */
	private Integer userId;

	/**
	 * 用户名
	 */
	private String userName;

	/**
	 * 主机地址
	 */
	private String ip;

	/**
	 * 方法名称
	 */
	private String method;

	/**
	 * 请求参数
	 */
	private String operateParam;

	/**
	 * 操作状态（0正常 1异常）
	 */
	private String status;

	/**
	 * 业务类型（1查询 2新增 3修改 4删除 0其他）
	 */
	private String operateType;

	/**
	 * 请求URL
	 */
	private String operateUrl;

	/**
	 * 响应时间
	 */
	private String operateTime;

	/**
	 * 操作时间
	 */

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Timestamp createTime;

	/**
	 * 错误消息
	 */
	private String errorMsg;


	public SysLogEntity() {
		super();
	}

    /**
     * setter for logId
     * @param logId
     */
	public void setLogId(Integer logId) {
		this.logId = logId;
	}

    /**
     * getter for logId
     */
	public Integer getLogId() {
		return logId;
	}

    /**
     * setter for userId
     * @param userId
     */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

    /**
     * getter for userId
     */
	public Integer getUserId() {
		return userId;
	}

    /**
     * setter for userName
     * @param userName
     */
	public void setUserName(String userName) {
		this.userName = userName;
	}

    /**
     * getter for userName
     */
	public String getUserName() {
		return userName;
	}

    /**
     * setter for ip
     * @param ip
     */
	public void setIp(String ip) {
		this.ip = ip;
	}

    /**
     * getter for ip
     */
	public String getIp() {
		return ip;
	}

    /**
     * setter for method
     * @param method
     */
	public void setMethod(String method) {
		this.method = method;
	}

    /**
     * getter for method
     */
	public String getMethod() {
		return method;
	}

    /**
     * setter for operateParam
     * @param operateParam
     */
	public void setOperateParam(String operateParam) {
		this.operateParam = operateParam;
	}

    /**
     * getter for operateParam
     */
	public String getOperateParam() {
		return operateParam;
	}

    /**
     * setter for status
     * @param status
     */
	public void setStatus(String status) {
		this.status = status;
	}

    /**
     * getter for status
     */
	public String getStatus() {
		return status;
	}

    /**
     * setter for operateType
     * @param operateType
     */
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

    /**
     * getter for operateType
     */
	public String getOperateType() {
		return operateType;
	}

    /**
     * setter for operateUrl
     * @param operateUrl
     */
	public void setOperateUrl(String operateUrl) {
		this.operateUrl = operateUrl;
	}

    /**
     * getter for operateUrl
     */
	public String getOperateUrl() {
		return operateUrl;
	}

    /**
     * setter for operateTime
     * @param operateTime
     */
	public void setOperateTime(String operateTime) {
		this.operateTime = operateTime;
	}

    /**
     * getter for operateTime
     */
	public String getOperateTime() {
		return operateTime;
	}

    /**
     * setter for createTime
     * @param createTime
     */
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

    /**
     * getter for createTime
     */
	public Timestamp getCreateTime()
	{
		return createTime;
	}

    /**
     * setter for errorMsg
     * @param errorMsg
     */
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

    /**
     * getter for errorMsg
     */
	public String getErrorMsg() {
		return errorMsg;
	}

}
