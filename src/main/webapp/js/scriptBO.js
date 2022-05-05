

/* Start show login password  */

	function showPassword(){
				var password = document.getElementById("password");
				var show = document.getElementById("eyeShow");
				var hide = document.getElementById("eyeHide");
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
			
/* End show login password  */





/* --- Start admin side bar stretch --- */

var sideBar = document.getElementById("adminSideBar");
var sideBurger = document.getElementById("burger");

burger.onclick = function(){
	
	var span = sideBar.querySelectorAll("span");	
	
	for(var i = 0 ; i < span.length ;i++){
		
		span[i].classList.toggle("showSpan");
		span[i].classList.toggle("hideSpan");

	}
} 	




/* --- End admin side bar stretch --- */




/* --- Start admin side bar sublist drop down --- */

var dropDown = document.getElementsByClassName("dropDown");


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



/* --- End admin side bar sublist drop down --- */
