
	
	<div class="footer">
		
			<div class="links">
				<div class="container">
					<div class="footerleft">
						
					</div>
					<div class="newsletter">
						<div class="newsletterform">
							<h4>INSCRIVER-VOUS A NOTRE NEWSLETTER </h4>
							<form action="newsLetter" method="post">
								<i class="fa-solid fa-envelope"></i>
								<input type="email" name="email" required>
								<input type="submit" name="action" value="S'abonner">
							</form>
							<span>En renseignant votre adresse email, vous acceptez de recevoir nos dernières actualités ainsi que des offres commerciales par courrier électronique</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="copyright">
				<div class="container">
					<p>Copyright © 2022 BINOME. TOUS LES DROITS SONT RÉSERVÉS.</p>
					
					<p>Alimenté par <spane>Binome</spane></p>
				</div>
			</div>	
			
	</div>




</div>


<script src="https://smtpjs.com/v3/smtp.js"></script>

<script type="text/javascript" src="js/script.js"></script>

<!-- particles scripts -->
<script src="js/particles.js"></script>
<script src="js/app.js"></script>

<!-- stats.js -->

<script src="js/lib/stats.js"></script>

<script>
  var count_particles, stats, update;
  stats = new Stats;
  stats.setMode(0);
  stats.domElement.style.position = 'absolute';
  stats.domElement.style.left = '0px';
  stats.domElement.style.top = '0px';
  document.body.appendChild(stats.domElement);
  count_particles = document.querySelector('.js-count-particles');
  update = function() {
    stats.begin();
    stats.end();
    if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
      count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
    }
    requestAnimationFrame(update);
  };
  requestAnimationFrame(update);
</script>

</body>
</html>