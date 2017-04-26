<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,data.Details"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page
    import="java.util.*,org.apache.taglibs.datagrid.DataGridParameters,java.sql.*"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/datagrid-1.0"
    prefix="ui"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="javascript/formValidation.js">
</script>
</head>
<body>
<form action="viewdetails.go" name="frm" method="post">
<div style="display: inline">Update Existing Record <input
    type="radio" id="radA" value="UpdateExistingRecord" name="updRad"
    onclick="return disable(this);" />   Insert New Record <input
    type="radio" id="radB" value="InsertNewRecord" checked="checked"
    name="updRad" onclick="return disable(this);" />   Delete
Record <input type="radio" id="radC" value="DeleteRecord" name="updRad"
    onclick="return disable(this);" /><br />
</div>
<br />
<br />
<label id="lblName">User Name:</label>    <input id="txtName"
    name="txt" type="text" />    <label id="lblEmail">Email
ID:</label>    <input id="txtEmail" type="text" name="mail" /><br />
<label id="lblCmp">Company:</label>    <input id="txtCmp"
    type="text" name="com" />    <label id="lblDesg">Designation:</label>
   <input id="txtDesg" type="text" name="des" /><br />
 
<label id="lan">Languages:</label> <select name="lanDrop">
    <option id="elan" value="English">English</option>
    <option id="hlan" value="Hindi">Hindi</option>
    <option id="flan" value="French">French</option>
</select><br />
<div><label id="gen">Gender:</label>  Male: <input
    type="radio" id="radM" name="rad" value="m" />   Female: <input
    type="radio" id="radF" name="rad" value="f" /></div>
<br />
<br />
<div><input id="btnIns" name="actionBtn" type="submit"
    value="Insert" onclick="return validate(this);" />    <input
    id="btnUpd" name="actionBtn" type="submit" value="Update"
    disabled="disabled" onclick="return validate(this);" />    <input
    id="btnDlt" name="actionBtn" type="submit" value="Delete"
    disabled="disabled" onclick="return validate(this);" />    <br />
<input id="btnVw" name="actionBtn" type="submit" value="View Details" />
 
</div>
</form>
 
 
<%
    List<Details> list = (List<Details>) request
            .getAttribute("FormDatas");
    pageContext.setAttribute("list", list);
%>
<table border="1" width="500" id="tbl">
    <tr>
        <td width="119"><b>ID</b></td>
        <td width="234"><b>USER NAME</b></td>
        <td width="234"><b>EMAIL_ID</b></td>
        <td width="234"><b>DESIGNATION</b></td>
        <td width="234"><b>COMPANY NAME</b></td>
        <td width="234"><b>LANGUAGES</b></td>
        <td width="234"><b>GENDER</b></td>
        <td width="200"><b>SELECT</b></td>
        <td width="150"><b>ACTION</b></td>
 
    </tr>
    <c:forEach items="${list}" var="element">
        <tr>
            <td><c:out value="${element.id}"></c:out></td>
            <td><c:out value="${element.userName}"></c:out></td>
            <td><c:out value="${element.emailId}"></c:out></td>
            <td><c:out value="${element.desig}"></c:out></td>
            <td><c:out value="${element.compName}"></c:out></td>
            <td><c:out value="${element.lang}"></c:out></td>
            <td><c:out value="${element.gender}"></c:out></td>
            <td><input type="checkbox" name="text" value="${element.id}" />
            <td><input type="submit" name="s" value="go" /></td>      
 
        </tr>
 
 
    </c:forEach>
 
     
 
</table>
 
 
</body>
</html>