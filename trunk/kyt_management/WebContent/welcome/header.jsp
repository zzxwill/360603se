
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title><%=sysName %></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/tableCSS.jsp"%>
<%@ include file="../include/custom.jsp"%>
<style>
.div-menu
{
	color: #313131;
	text-align: center;
	font-size: 15px;
	cursor: pointer;
	height: 35px;
	line-height: 35px;
}
.div-menu:hover
{
	color: #d8a14f;
	background: #e8e8e8;
}
.div-menusel
{
	border-right: 3px solid #b30f0e;
	color: #d8a14f;
	font-weight: 700;
	background: #e8e8e8;
	
	text-align: center;
	font-size: 15px;
	cursor: pointer;
	height: 35px;
	line-height: 35px;
}
.mian
{
	height: 500px;
	overflow: auto;
}
</style>

</head>
