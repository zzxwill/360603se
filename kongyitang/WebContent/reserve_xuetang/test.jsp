<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/SpecificssJS.jsp"%>

<script type="text/javascript">

$().ready(function() {

	 $("#signupForm").validate();

	});
</script>
</head>
<body>










<form id="signupForm" method="get" action="">

    <p>

        <label for="firstname">Firstname</label>

        <input id="firstname" name="firstname" class="required" />

    </p>

 <p>

  <label for="email">E-Mail</label>

  <input id="email" name="email" class="required email" />

 </p>

 <p>

  <label for="password">Password</label>

  <input id="password" name="password" type="password" class="{required:true,minlength:5}" />

 </p>

 <p>

  <label for="confirm_password">确认密码</label>

  <input id="confirm_password" name="confirm_password" type="password" class="{required:true,minlength:5,equalTo:'#password'}" />

 </p>

    <p>

        <input class="submit" type="submit" value="Submit"/>

    </p>

</form>

</body>
</html>