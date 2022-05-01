


/*Start --- Change navigation Bar on scroll --- */

window.addEventListener("scroll", function (){
	
let navbar = document.querySelector(".navBar");
let topbar = document.querySelector(".topBar");
let navlist = document.querySelector(".navList");

let scroll = window.scrollY;

if(scroll >0){
	
	navbar.style ="background-color:#ffffff;border-bottom:5px solid var(--green-color);position: fixed;top: 0;";
	topbar.style = "display:none;";
	navlist.style = "background-color: transparent;border-bottom:none;	box-shadow:none;";
	
	
}else{
	
	navbar.style ="background-color:#ffffffa;border-bottom:none;position:absolute;";
	topbar.style = "display:flex;";
	navlist.style = "background-color:#ffffff;border-bottom:5px solid var(--green-color);";
}

})

/*End --- Change navigation Bar on scroll --- */