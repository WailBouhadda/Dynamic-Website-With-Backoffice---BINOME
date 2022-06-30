<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<div class="footer">
		
			<div class="links">
				<div class="container">
					<div class="NLTM">
						<div class="temoin">
							<div class="slider">
								<div class="temi">
									<h3>RECRUTEMENT</h3>
									<p>
										Je remercie Binôme et particulièrement la Fondatrice Madame Isabelle Deschamps-Akettab pour son approche très technique associée à une sérieuse connaissance des rapports humains et de l’entreprise, dans un souci de nous présenter des « candidats » qui seront « reconnus » par leur employeur. Cette méthode de recrutement est en adéquation avec l’éthique professionnelle de ce métier. Le suivi personnalisé et le contact permanent durant les différentes phases du processus de recrutement, sont les points positifs de cette collaboration. Binôme fait preuve d’un grand professionnalisme, d’une réelle discrétion. Merci pour votre rigueur, vos qualités de conseil. Binôme possède un vrai savoir-faire. Bonne continuation. ML. 
									</p>
								</div>
								<div class="temi">
									<h3>Accompagnement a l’embauche et début de carrière </h3>
									<p>
										Grâce à toi et à ton accompagnement j'ai pu faire un nouveau départ dans ma carrière. J'ai pu avoir confiance en moi pour la première fois de ma carrière et à dépasser mes limites et mes craintes. Je me sens libre et je m'envole avec beaucoup d'assurance à ce que j’entreprends ... Votre sens de l'écoute, du conseil ainsi que votre professionnalisme ont donné à ma carrière un nouveau souffle. L. 
									</p>
								</div>
								<div class="temi">
									<h3>Accompagnement a l’embauche et début de carrière  </h3>
									<p>
										'Je remercie infiniment Mme Isabelle Deschamps pour son accompagnement professionnel et personnalisé durant toute la période de prise de mes nouvelles fonctions. Elle m'a apporté le support et l'aide indispensables pour mener à bien cette période transitoire.''H. 
									</p>
								</div>
								<div class="temi">
									<h3>Newsletter </h3>
									<p>
										Bravo pour la Newsletter franchement elle est très instructive 
									</p>
									<hr>
									<p>
										C'est magnifique  
									</p>
									<hr>
									<p>
										Je te félicite sincèrement pour ce beau travail  et te remercie pour le partage. Bonne réussite et continuation 
									</p>
								</div>
								<div class="temi">
									<h3>Newsletter </h3>
									<p>
										Magnifique… je ferai le test de suite ...d'ailleurs c'est une rubrique qui aura bcp de succès. on adooore les tests. Des info et des connaissances très utiles et simples à appliquer. 
									</p>
									<hr>
									<p>
										excellent   
									</p>
									<hr>
									<p>
										Je trouve ce numéro enrichissant et excellent, je te souhaite bonne continuation.  
									</p>
								</div>
								<div class="temi">
									<h3>Newsletter </h3>
									<p>
										Super intéressant Isabelle comme toujours 
									</p>
									<hr>
									<p>
										merci infiniment et Excellente journée     
									</p>
									<hr>
									<p>
										Merci infiniment pour ce partage intéressant    
									</p>
							</div>
						
						</div>
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
				<div class="contact">
					<div class="c">
						<i class="fa-regular fa-envelope"></i>
						<span>i.deschamps@binome.ma</span>
					</div>
					<div class="c">
						<i class="fa-solid fa-phone"></i>
						<span>+212661494028</span>
					</div>
					<div class="c">
						<i class="fa-solid fa-location-dot"></i>
						<span>Avenue Yacoub el Mansour - 28810 Mohammedia</span>
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