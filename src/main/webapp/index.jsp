
<jsp:include page="navBar.jsp"></jsp:include>    

<!-- Start accueil -->

	<div class="accueil" id="accueil">
		<div class="container">
			<div class="headContent">
				<div class="img"><img src="images/leadership.png"></div>
				<h1>service  DES  ASSISTANTES DE DIRECTION</h1>
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

<!--Start service-->

    <div class="services" id="service">
        <div class="box">
        	<div class="title">
        			<h1>SERVICES</h1>
        	</div>
            <div class="container">
                <div class="service">
                    <div class="img-holder">
                        <img src="images/service1.jpg" alt="">
                    </div>
                    <h2>Service 1</h2>
                    <p>Une petit description de service 1</p>
                    <a href="#">PLUS</a>
                </div>
                <div class="service">
                    <div class="img-holder">
                        <img src="images/service2.jpg" alt="">
                    </div>
                    <h2>Service 2</h2>
                    <p>Une petit description de service 2</p>
                    <a href="#">PLUS</a>
                </div>
                <div class="service">
                    <div class="img-holder">
                        <img src="images/service3.jpg" alt="">
                    </div>
                    <h2>Service 3</h2>
                    <p>Une petit description de service 2</p>
                    <a href="#">PLUS</a>
                </div>
            </div>    
        </div>
    </div>
    
<!--end service-->
    
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
						 	<form action="https://formsubmit.co/196a8b6337e73b924bcac06d8e9b9b5b" method="POST">
				            <input type="text" class="cont" placeholder="Nom..." name="Nom" id="name">
				            <input type="email" class="cont" placeholder="Email..." name="Email" id="email">
				            <textarea name="message" id="Message" placeholder="Message..." cols="30" rows="10"></textarea>
				            <input type="submit" value="ENVOYER">
				        	</form>
					</div>
				</div>
			</div >       
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

