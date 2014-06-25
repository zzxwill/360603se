<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>
	
	<script>

	function GoTiming(){
		var seconds = 0;
		 setInterval(function(){
			  	seconds += 1;
			  	if(seconds == 5){
			  		seconds = 0;
					document.getElementById("normal").style.display = "block";
					document.getElementById("wait").style.display = "none";
			  	}
		},1000);
	}

	function GoReservation(){
		window.location.href='index_test.jsp'
	}
	</script>