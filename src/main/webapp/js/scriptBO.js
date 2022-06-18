
/* Start show login password  */

	function showPassword(name){
				var password = document.getElementById(name);
				var show = document.getElementById("eyeShow"+name);
				var hide = document.getElementById("eyeHide"+name);
				show.style.color = "red";


					if(password.type === 'password'){
						password.type = "text"
						show.style.display = "block";
						hide.style.display = "none";
					}
					else{
						password.type = "password"
						show.style.display = "none";
						hide.style.display = "block";
					}
			}
			



/* --- Start admin side bar stretch --- */

var sideBar = document.getElementById("adminSideBar");
var sideBurger = document.getElementById("burger");

if(sideBurger !== null && sideBar != null){

burger.onclick = function(){
	
	var span = sideBar.querySelectorAll("span");
	var content = document.getElementById("content");
	
	
	content.classList.toggle("content");
	content.classList.toggle("contentStrech");

	for(var i = 0 ; i < span.length ;i++){
		
		span[i].classList.toggle("showSpan");
		span[i].classList.toggle("hideSpan");

	}
} 	
}



/* --- End admin side bar stretch --- */




/* --- Start admin side bar sublist drop down --- */

var dropDown = document.getElementsByClassName("dropDown");

if(dropDown !== null){

for(let i = 0 ; i < dropDown.length ; i++){
	
	dropDown[i].onclick = function(){
		
		var subList = document.getElementById(`${this.id}ul`); 	
		var mainLi = document.getElementById(`${this.id}li`);
		var arrow = document.getElementById(`${this.id}i`);
		var mainLiAfter = window.getComputedStyle(document.getElementById(`${this.id}li`) , `:after`);
		
		mainLi.classList.toggle("li");	
		mainLi.classList.toggle("liClicked");
		
		subList.classList.toggle("subList");
		subList.classList.toggle("subListClicked");	
		
		mainLiAfter.style = "height:100%";	
		
		arrow.classList.toggle("normal");
		arrow.classList.toggle("rotate");			

		}
}
}


/* --- End admin side bar sublist drop down --- */

/* --- Start admin side bar sublist drop down --- */

var headBar = document.getElementsByClassName("headBar");

if(headBar !== null){

for(let i = 0 ; i < headBar.length ; i++){
	
	headBar[i].onclick = function(){
		
		var form = document.getElementById(`${this.id}F`); 	
		var arrow = document.getElementById(`${this.id}i`);
								
				
	
			
			form.classList.toggle("form");
			form.classList.toggle("formClicked");
			
			arrow.classList.toggle("normal");
			arrow.classList.toggle("rotate");
			
	

		}
	}
}


/* --- End admin side bar sublist drop down --- */




	/* --- Start filter/search poste function --- */
	
	var filtervalue = document.getElementById("filterPoste");
	
	if(filtervalue !== null){
		
	filtervalue.onkeyup = function(){
		
		var value = this.value.toLowerCase();
		var table = document.getElementById("tablePoste");
		var rows = table.getElementsByTagName("tr");
		
		for(var i = 1 ; i < rows.length ; i++){
				
			var LNI = rows[i].getElementsByTagName("td")[1].querySelector("input");
			var FNI = rows[i].getElementsByTagName("td")[2].querySelector("input");
			var CNEI = rows[i].getElementsByTagName("td")[5].querySelector("input");
			
			if(LNI || FNI || CNEI){
				var LN = LNI.value;
				var FN = FNI.value;
				var CNE = CNEI.value;
				
				if(LN.toLowerCase().indexOf(value) > -1 || FN.toLowerCase().indexOf(value) > -1 || CNE.toLowerCase().indexOf(value) > -1){
			
					rows[i].style.display ="";				
				}else{
					rows[i].style.display ="none";				

				}
			}
			}
		
		
	}}
	
	
		/* --- End filter/search poste function --- */
		
		

		/* --- Start filter/search Categorie function --- */

	
	
		var filtervalue2 = document.getElementById("filterCategorie");
		
	if(filtervalue2 !== null){
	filtervalue2.onkeyup = function(){
		
		var value = this.value.toLowerCase();
		var table = document.getElementById("tableCategorie");
		var rows = table.getElementsByTagName("tr");
		
		for(var i = 1 ; i < rows.length ; i++){
				
			var LNI = rows[i].getElementsByTagName("td")[1].querySelector("input");
			
			if(LNI){
				var LN = LNI.value;
				
				if(LN.toLowerCase().indexOf(value) > -1){
			
					rows[i].style.display ="";				
				}else{
					rows[i].style.display ="none";				

				}
			}
			}
		
		
	}
	}
	
			/* --- End filter/search Categorie function --- */









	/* --- Start filter/search commentNA function --- */
	
	
	
	var filtervalue = document.getElementById("filtercommentNA");
	
	if(filtervalue !== null){
	filtervalue.onkeyup = function(){
		
		var value = this.value.toLowerCase();
		var table = document.getElementById("tableCommentNA");
		var rows = table.getElementsByTagName("tr");
		
	
		
		for(var i = 1 ; i < rows.length ; i++){
				
			var LNI = rows[i].getElementsByTagName("td")[1].querySelector("input");
			var FNI = rows[i].getElementsByTagName("td")[3].querySelector("input");
			var CNEI = rows[i].getElementsByTagName("td")[5].querySelector("input");
			
			if(LNI || FNI || CNEI){
				var LN = LNI.value;
				var FN = FNI.value;
				var CNE = CNEI.value;
				
				if(LN.toLowerCase().indexOf(value) > -1 || FN.toLowerCase().indexOf(value) > -1 || CNE.toLowerCase().indexOf(value) > -1){
			
					rows[i].style.display ="";				
				}else{
					rows[i].style.display ="none";				

				}
			}
			}
		
		
	}}
	

		/* --- End filter/search commentNA function --- */
		
		


	/* --- Start filter/search commentA function --- */
	
	
	
	var filtervalue = document.getElementById("filtercommentA");
	
	if(filtervalue !== null){
	filtervalue.onkeyup = function(){
		
		var value = this.value.toLowerCase();
		var table = document.getElementById("tableCommentA");
		var rows = table.getElementsByTagName("tr");
		
	
		
		for(var i = 1 ; i < rows.length ; i++){
				
			var LNI = rows[i].getElementsByTagName("td")[1].querySelector("input");
			var FNI = rows[i].getElementsByTagName("td")[3].querySelector("input");
			var CNEI = rows[i].getElementsByTagName("td")[5].querySelector("input");
			
			if(LNI || FNI || CNEI){
				var LN = LNI.value;
				var FN = FNI.value;
				var CNE = CNEI.value;
				
				if(LN.toLowerCase().indexOf(value) > -1 || FN.toLowerCase().indexOf(value) > -1 || CNE.toLowerCase().indexOf(value) > -1){
			
					rows[i].style.display ="";				
				}else{
					rows[i].style.display ="none";				

				}
			}
			}
		
		
	}}
	

		/* --- End filter/search commentA function --- */
		
		








	
	/* --- Start password and confirmation --- */

		var cn = document.getElementById("CNpassword");


	if(cn !== null){

		cn.onkeyup =  function(){
			
			var Cvalue = this.value;
			var	Nvalue = document.getElementById("Npassword").value;
			
			var button = document.getElementById("BMDP");
			
			console.log(Cvalue);
			console.log(Nvalue);
			if(Cvalue === Nvalue){
				
				this.style="outline: 2px solid green;";
				
				
			}else{
				
				this.style="outline: 2px solid red;";
		
			}		
			
		}
}
	/* --- end password and confirmation --- */

	
	/* --- Start Alert --- */
	
	var alertDiv = document.getElementById("alert");
	
	

	function alert(result){
		
		
		var count = 10;
		
		
		var text = document.createElement("p");
		
		var icon = document.createElement("i");		
		
		icon.classList.add("fa-solid");	
	
	
		if(result === 1){
			 
			 icon.classList.add("fa-circle-check");
			 icon.classList.remove("fa-circle-xmark");
			 alertDiv.classList.add("alertG");
			 alertDiv.classList.remove("alertR");

			 
			 text.innerText = "OPERATION TERMINEE AVEC SUCCES";
			 
			
			alertDiv.appendChild(icon); 
			 alertDiv.appendChild(text);
			
			
		}else if(result === -1){
			
			 icon.classList.add("fa-circle-xmark");
			 icon.classList.remove("fa-circle-check");
			 
			 alertDiv.classList.remove("alertG");
			 alertDiv.classList.add("alertR");
			 text.innerText = "OPERATION A ECHOUE";

			alertDiv.appendChild(icon); 
			alertDiv.appendChild(text);
			
			
		}else{
			
			alertDiv.style.opacity  = "0%";
		}
		
	}	

	
	
	var count = 5;	
	
	function countDown(){
			
 	if(count != 0){
		
		count -= 1;
		
	}else{
		
		clearInterval(counter);
		alertDiv.style.opacity  = "0%";
		
	}
	}
			
	var counter = setInterval(countDown,1000);

			/* --- End Alert --- */




