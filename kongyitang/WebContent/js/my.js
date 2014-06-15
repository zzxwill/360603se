//var angle = 10px;
//$('.ConsumerRecordsButton').corner();
//$('#AskedRecordsButton').corner();
//$('#ConsumerRecordsButton').corner("10px");
//$('#AskedRecordsButton').corner("10px");

//患者
function ConsumerRecordsButton(){
	document.getElementById("ConsumerRecords").style.display = "block";
	document.getElementById("AskedRecords").style.display = "none";
	
	document.getElementById('ConsumerRecordsButton').style.backgroundColor='#d8a14f';
	document.getElementById('ConsumerRecordsButton').style.color="white";
	document.getElementById('AskedRecordsButton').style.backgroundColor='';
	document.getElementById('AskedRecordsButton').style.color="#754503";

}

function AskedRecordsButton(){
	document.getElementById("ConsumerRecords").style.display = "none";
	document.getElementById("AskedRecords").style.display = "block";
	
	document.getElementById('AskedRecordsButton').style.backgroundColor='#d8a14f';
	document.getElementById('AskedRecordsButton').style.color="white";
	document.getElementById('ConsumerRecordsButton').style.backgroundColor='';
	document.getElementById('ConsumerRecordsButton').style.color="#754503";
}

//医生
function DoctorConsumerRecordsButton(){
	document.getElementById("DoctorConsumerRecords").style.display = "block";
	document.getElementById("DoctorAskedRecords").style.display = "none";
	
	document.getElementById('DoctorConsumerRecordsButton').style.backgroundColor='#d8a14f';
	document.getElementById('DoctorConsumerRecordsButton').style.color="white";
	document.getElementById('DoctorAskedRecordsButton').style.backgroundColor='';
	document.getElementById('DoctorAskedRecordsButton').style.color="#FF8C47";

}

function DoctorAskedRecordsButton(){
	document.getElementById("DoctorConsumerRecords").style.display = "none";
	document.getElementById("DoctorAskedRecords").style.display = "block";
	
	document.getElementById('DoctorAskedRecordsButton').style.backgroundColor='#d8a14f';
	document.getElementById('DoctorAskedRecordsButton').style.color="white";
	document.getElementById('DoctorConsumerRecordsButton').style.backgroundColor='';
	document.getElementById('DoctorConsumerRecordsButton').style.color="#FF8C47";
}

