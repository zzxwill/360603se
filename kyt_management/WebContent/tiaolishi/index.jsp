<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@ include file="../welcome/header.jsp"%>

<%@ include file="../check/checkTiaoLiShi.jsp"%>

<%@ include file="../welcome/welcome.jsp"%>

<%
int role = CheckRole - 3*GROUP_INTERVAL;
%>

<%@ include file="../tiaolishi/index_2.jsp"%>

<%@ include file="../welcome/footer.jsp"%>