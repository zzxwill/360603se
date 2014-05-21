	
	function closeWin(){
		//window.opener=null; 
		//window.close(); 
		WeixinJSBridge.call('closeWindow');
	}