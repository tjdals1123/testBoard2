package org.jeon.domain;

import java.util.Date;

public class ConversationVO {

	public String getBotId() {
		return botId;
	}
	public void setBotId(String botId) {
		this.botId = botId;
	}
	public String getBotName() {
		return botName;
	}
	public void setBotName(String botName) {
		this.botName = botName;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getVersionId() {
		return versionId;
	}
	public void setVersionId(String versionId) {
		this.versionId = versionId;
	}
	public int getSeqNum() {
		return seqNum;
	}
	public void setSeqNum(int seqNum) {
		this.seqNum = seqNum;
	}
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getChnnelId() {
		return chnnelId;
	}
	public void setChnnelId(String chnnelId) {
		this.chnnelId = chnnelId;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public Date getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(Date requestTime) {
		this.requestTime = requestTime;
	}
	private String botId;
	private String botName;
	private String sessionId;
	private String versionId;
	private int    seqNum;
	private String responseCode;
	private String userId;
	private String userName;
	private String chnnelId;
	private String request;
	private String response;
	private Date   requestTime;
	
}
