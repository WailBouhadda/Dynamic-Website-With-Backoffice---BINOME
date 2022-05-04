

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
