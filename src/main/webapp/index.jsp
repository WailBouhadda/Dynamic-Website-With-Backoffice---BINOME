
<jsp:include page="navBar.jsp"></jsp:include>

<!-- Start accueil -->

	<div class="accueil" id="accueil">
		<div class="container">
			<div class="headContent">
				<div class="img"><img src="images/leadership.png"></div>
				<h1>FORMATION  DES  ASSISTANTES DE DIRECTION</h1>
				<p>Avec l'efficacité du <span style="color: var(--green-color); font-weight:bold;"> < </span> sur-mesure <span style="color: var(--green-color); font-weight:bold;"> > </span></p>
			</div>
		</div>
		<a href="#cabinetBinome"> <i class="fa-solid fa-angles-down"></i></a>
	</div>

<!-- End accueil -->

<!-- Start cabbinetBinome -->

	<div class="cabinetBinome" id="cabinetBinome">
		<div class="container">
				<div class="title">
					<h1>CABINET BINOME</h1>
				</div>
				<a href="#">
					<div class="parent biographie">
						<div class="BContent">
							<h2>BIOGRAPHIE</h2>
							<p>c'est quoi le cabinet binome </p>
						</div>
					</div>
				</a>
				<a href="#">
					<div class="parent savoirFaire">
						<div class="SFContent">
							<h2>SAVOIR FAIRE</h2>
							<p>savoir faire cabinet binome </p>
						</div>
					</div>
				</a>
				<a href="#">
					<div class="parent services">
						<div class="SContent">
							<h2>SERVICES</h2>
							<p>services de cabinet binome </p>
						</div>
					</div>
				</a>
		</div>
	</div>

<!-- End cabbinetBinome -->

<!--Start formation-->

    <div class="formations" id="formation">
        <div class="box">
        	<div class="title">
        			<h1>FORMATION</h1>
        	</div>
            <div class="container">
                <div class="formation">
                    <div class="img-holder">
                        <img src="images/formation1.jpg" alt="">
                    </div>
                    <h2>Formation 1</h2>
                    <p>Une petit description de formation 1</p>
                    <a href="#">PLUS</a>
                </div>
                <div class="formation">
                    <div class="img-holder">
                        <img src="images/formation2.jpg" alt="">
                    </div>
                    <h2>Formation 2</h2>
                    <p>Une petit description de formation 2</p>
                    <a href="#">PLUS</a>
                </div>
                <div class="formation">
                    <div class="img-holder">
                        <img src="images/formation3.jpg" alt="">
                    </div>
                    <h2>Formation 3</h2>
                    <p>Une petit description de formation 2</p>
                    <a href="#">PLUS</a>
                </div>
            </div>    
        </div>
    </div>
    
<!--end formation-->
    
<!--Start contact-->
	<div class="contact" id="contact">
		<div class="title">
			<h1>CONTACT</h1>
		</div>
		<div class="background">
			<div class="container">
				<div class="contactMethods">
					<div class="phoneMethod">
						<i class="fa-solid fa-phone"></i>
						<p>TELEHPONE</p>
						<p>+212661494028</p>
					</div>
					<div class="emailMethod">
						<i class="fa-regular fa-envelope"></i>
						<p>EMAIL</p>
						<p>i.deschamps@binome.ma</p>
					</div>
					<div class="adressMethod">
						<i class="fa-solid fa-location-dot"></i>
						<p>ADRESS</p>
						<p>Avenue Yacoub el Mansour - 28810 Mohammedia</p>
					</div>
				</div>
				<div class="contactForm">
					<div class="text">
						<p>N'hésitez pas à nous contacter que vous cherchiez des réponses.</p>
					</div>
					<div class="form">
						 	<form action="">
				            <input type="text" class="cont" placeholder="Nom..." name="" id="">
				            <input type="email" class="cont" placeholder="Email..." name="" id="">
				            <textarea name="MEssage" id="" placeholder="Message..." cols="30" rows="10"></textarea>
				            <input type="submit" value="ENVOYER">
				        	</form>
					</div>
				</div>
			</div>
		</div>	
	</div>
<!--End contact-->

<!--Start noReferences-->
	<div class="noReferences" id="nosReferences">
		<div class="title">
			<h1>NOS REFERENCES</h1>
		</div>
		<div class="container">
			<div class="reference">
			</div>
		</div>
	</div>

<!--End noReferences-->


<jsp:include page="footer.jsp"></jsp:include>

