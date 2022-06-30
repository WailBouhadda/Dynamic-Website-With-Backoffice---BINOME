


let search = document.getElementById("SE");

if(search !== null){
	
let input = document.getElementById("si");
var sL = document.getElementById("siul");
	
	
	
search.onclick = function(){
		

		
	search.classList.toggle("se");
	search.classList.toggle("seClicked");
	
	sL.classList.toggle("searchlistNC");
	sL.classList.toggle("searchlist");
	
	
	input.classList.toggle("SI");
	input.classList.toggle("SIH");
	}

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
			




	/* --- Start filter/search navbar function --- */
	
	var searchNB = document.getElementById("si");
	
	if(searchNB !== null){
		
		
	searchNB.onkeyup = function(){
		
		
		
		
		var value = this.value.toLowerCase();
		
		var ul = document.getElementById("siul");
		var lis = ul.getElementsByTagName("li");
		var as = ul.getElementsByTagName("a");
		
				
		
		for(var i = 0 ; i < lis.length ; i++){
			
			if(lis[i]){
				var li = lis[i];
				var a = as[i].innerHTML;
				
				if(a.toLowerCase().indexOf(value) > -1 ){
			
					li.style.display ="";				
				}else{
					li.style.display ="none";				

				}
			}
			}
		
		
	}}
	
	
		/* --- End filter/search navbar function --- */
		
		

	/* --- Start filter/search sidebar function --- */
	
	var searchSB = document.getElementById("SBI");
	
	if(searchSB !== null){
		
		
	searchSB.onkeyup = function(){
		
		var valuesb = this.value.toLowerCase();
		
		var ulSB = document.getElementById("SBul");
		var lisSB = ulSB.getElementsByTagName("li");
		var asSB = ulSB.getElementsByTagName("a");
		
		
		for(var i = 0 ; i < lisSB.length ; i++){
			
			if(lisSB[i]){
				var liSB = lisSB[i];
				var aSB = asSB[i].innerHTML;
				
				if(aSB.toLowerCase().indexOf(valuesb) > -1 ){
			
					liSB.style.display ="";				
				}else{
					liSB.style.display ="none";				

				}
			}
			}
		
		
	}}
	
	
		/* --- End filter/search sidebar function --- */
		


	/* --- Start filter/search sidebar function --- */
	
	var searchNB = document.getElementById("SBI");

	if(searchNB !== null){
			
		var ul = document.getElementById("SBul");

		
		
	searchNB.onfocus = function(){
		
		ul.classList.toggle("sidesearch");		
		ul.classList.toggle("sidesearchNC");	
	
		
	}
	
	}
	
	
		/* --- End filter/search sidebar function --- */
		




/* Start contact us */


/* End contact us  */
