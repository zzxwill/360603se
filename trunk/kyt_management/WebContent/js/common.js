
function show_common_hidden(div1,div2,div3,div4,div5,div6){
		var obj1 = document.getElementById(div1);
		var obj2 = document.getElementById(div2);
		var obj3 = document.getElementById(div3);
		var obj4 = document.getElementById(div4);
		var obj5 = document.getElementById(div5);
		var obj6 = document.getElementById(div6);
		
		if(obj1!=null ){
			obj1.style.display = "";
			//return;
		}
		
		if(obj2!=null ){
			obj2.style.display = "none";
			//return;
		}
		if(obj3!=null ){
			obj3.style.display = "none";
			//return;
		}
		if(obj4!=null ){
			obj4.style.display = "none";
			//return;
		}
		//TODO 排期
		if(obj5!=null ){
			obj5.style.display = "none";
			//return;
		}
		if(obj6!=null ){
			obj6.style.display = "none";
			//return;
		}
	}