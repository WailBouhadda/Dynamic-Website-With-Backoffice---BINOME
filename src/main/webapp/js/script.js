


let search = document.getElementById("SE");
let input = document.getElementById("si");
search.onclick = function(){
		
	search.classList.toggle("se");
	search.classList.toggle("seClicked");
	
	input.classList.toggle("SI");
	input.classList.toggle("SIH");
	}


/*Start --- Change navigation Bar to responsive on small screen --- */

let burger = document.getElementById("burger");
let navlist = document.getElementById("Nlist");
burger.onclick = function(){
	
	
	
	navlist.classList.toggle("test");
	navlist.classList.toggle("Nlist");
	}

/*End --- Change navigation Bar to responsive on small screen --- */


/*Start --- Change navigation Bar on scroll --- */


window.addEventListener("scroll", function (){
	
let navbar = document.querySelector(".navBar");
let topbar = document.querySelector(".topBar");
let navlist = document.querySelector(".navList");

let scroll = window.scrollY;


if(scroll >0){
	
	navbar.style ="background-color:#ffffff;border-bottom:5px solid var(--green-color);position: fixed;top: 0;";
	topbar.style = "display:none;";
	navlist.style = "background-color:transparent;border-bottom:none;box-shadow:none;";
	
	
}else{
	
	navbar.style ="background-color:#ffffffa;border-bottom:none;position:absolute;";
	topbar.style = "display:flex;";
	navlist.style = "background-color:#ffffff;border-bottom:5px solid var(--green-color);";
}

})

/*End --- Change navigation Bar on scroll --- */


/* Start likedislke */




	function likeDislike(){
				var like = document.getElementById("like");
				var dislike = document.getElementById("dislike");

					if(like.style.display === 'none'){
						like.style.display = "block";
						dislike.style.display = "none";
					}
					else{
						like.style.display = "none";
						dislike.style.display = "block";
					}
			}
			
/* End likedislike  */

