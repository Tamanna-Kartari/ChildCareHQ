function main(){
	var reg = document.getElementById("register");
	var form1 = document.querySelector("#form1");
	var login = document.getElementById("login");
	var form2 = document.querySelector("#form2");
	var signin = document.getElementById("signin");
	var form3 = document.querySelector("#form3");
	var regsub = document.querySelector("#regsub");

	reg.addEventListener("click",function() {
		form1.classList.toggle("hidden");
		form2.classList.add("hidden");
		form3.classList.add("hidden");
	});

	login.addEventListener("click",function() {
		form2.classList.toggle("hidden");
		form1.classList.add("hidden");
		form3.classList.add("hidden");
	});

	signin.addEventListener("click",function() {
		form3.classList.toggle("hidden");
		form1.classList.add("hidden");
		form2.classList.add("hidden");
	});
}
// regsub.addEventListener("click",function(){

// var fname = document.querySelector("#fname");
// var lname = document.querySelector("#lname");
// name = fname + lname;
// window.location = "patient.html";

// });

function patient(){
	var pname = document.querySelector("#pname");
	// var lname = document.querySelector("#lname");
	sessionStorage.setItem("name",pname.value);
	// sessionStorage["name"] = fname + lname;
	window.location = "patInterface.html";
}

function patientPortal(){
	var wel = document.getElementById("wel");
	wel.textContent = "Welcome " + sessionStorage.getItem("name").toUpperCase();
}

function doctor(){
	var dname = document.querySelector("#dname");
	sessionStorage.setItem("dname",dname.value);
	window.location = "docinterface.html";
}


function doctorPortal(){
	var dwel = document.getElementById("dwel");
	dwel.textContent = "Welcome Dr. " + sessionStorage.getItem("dname").toUpperCase();
}

function admin(){
	var aname = document.querySelector("#aname");
	sessionStorage.setItem("aname",aname.value);
	window.location = "admInterface.html";
}


function adminPortal(){
	var asl = document.getElementById("asl");
	asl.textContent = "Welcome Admin " + sessionStorage.getItem("aname").toUpperCase();
}