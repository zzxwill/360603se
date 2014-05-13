//var angle = 10px;
//$('.ConsumerRecordsButton').corner();
//$('#AskedRecordsButton').corner();
//$('#ConsumerRecordsButton').corner("10px");
//$('#AskedRecordsButton').corner("10px");
function ConsumerRecordsButton(){
	document.getElementById("ConsumerRecords").style.display = "block";
	document.getElementById("AskedRecords").style.display = "none";
	
	document.getElementById('ConsumerRecordsButton').style.backgroundColor='#FF8C47';
	document.getElementById('ConsumerRecordsButton').style.color="white";
	document.getElementById('AskedRecordsButton').style.backgroundColor='';
	document.getElementById('AskedRecordsButton').style.color="#FF8C47";

}

function AskedRecordsButton(){
	document.getElementById("ConsumerRecords").style.display = "none";
	document.getElementById("AskedRecords").style.display = "block";
	
	document.getElementById('AskedRecordsButton').style.backgroundColor='#FF8C47';
	document.getElementById('AskedRecordsButton').style.color="white";
	document.getElementById('ConsumerRecordsButton').style.backgroundColor='';
	document.getElementById('ConsumerRecordsButton').style.color="#FF8C47";
}

