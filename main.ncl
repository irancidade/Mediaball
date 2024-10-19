<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="Midiabol" xmls="http://www.ncl.org.br/NLC3.0/EDTVProfile">
<head>

	<ruleBase>
   
        <rule id="rMeiogol" var="img_num" comparator="eq" value="1"/>
		<rule id="rMeiomiss" var="img_num" comparator="eq" value="2"/>
		<rule id="rCantoDgol" var="img_num" comparator="eq" value="3"/>
		<rule id="rCantoEgol" var="img_num" comparator="eq" value="4"/>
		<rule id="rMeioMiss" var="img_num" comparator="eq" value="5"/>
		<rule id="rCantoDmiss" var="img_num" comparator="eq" value="6"/>
		<rule id="rCantoE" var="img_num" comparator="eq" value="7"/>
		<rule id="rCantoDfora" var="img_num" comparator="eq" value="8"/>
		<rule id="rCantoEmiss" var="img_num" comparator="eq" value="9"/>
		<rule id="rCantoD" var="img_num" comparator="eq" value="10"/>
		<rule id="rCantoEfora" var="img_num" comparator="eq" value="11"/>
		<rule id="rMeiocentro" var="img_num" comparator="eq" value="12"/>
		<rule id="rApostD" var="img_num" comparator="eq" value="13"/>
		<rule id="rApostmiss" var="img_num" comparator="eq" value="14"/>
		<rule id="rApostGol" var="img_num" comparator="eq" value="15"/>
		<rule id="rApostMeio" var="img_num" comparator="eq" value="16"/>
	</ruleBase>

	<regionBase>
		<region id="rgTv">
			<region id="rgFundo" zIndex="5"/>
			<region id="rgFundoJogo" zIndex="2"/>
			<region id="rgVideo" zIndex="7" top="30%" left="30%" width="40%" height="40%"/>
			<region id="rgLogo" zIndex="6" top="5%" left="20%" width="57%" height="18%"/>
			<region id="rgCor" zIndex="3" top="30%" left="20%" width="60%" height="40%"/>

			<region id="rgBotaoVermelho" zIndex="7" width="20%" height="15%" bottom="1%" left="1%" />
			<region id="rgBotaoVerde" zIndex="7" width="20%" height="15%" bottom="1%" left="27%" />
			<region id="rgBotaoAmarelo" zIndex="7" width="20%" height="15%" bottom="1%" left="55%" />
			<region id="rgBotaoAzul" zIndex="7" width="20%" height="15%" bottom="1%" left="80%" />

			<region id="rgBotaoIniciar" zIndex="7" width="22%" height="16%" left="40%" bottom="0%"/>
			<region id="rgSom" zIndex="1"/>
			<region id="rgLua" zIndex="8" />
			<region id="rgGameOver" zIndex="7"/>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor id="dFundo" region="rgFundo"/>
		<descriptor id="dLogo" region="rgLogo"/>
		<descriptor id="dFundoJogo" region="rgFundoJogo"/>
		<descriptor id="dVideo" region="rgVideo"/>
		<descriptor id="dBotaoIniciar" region="rgBotaoIniciar"/>
		
		<descriptor id="dImagem" region="rgCor"/>
		<descriptor id="dLua" region="rgLua" />
		<descriptor id="dGameOver" region="rgGameOver"/>
		
        <descriptor id="dSom" region="rgSom" />
		<descriptor id="dBotaoVermelho" region="rgBotaoVermelho" focusIndex="1" moveRight="2" moveLeft="4" focusBorderWidth="4" focusBorderColor="red" selBorderColor="white"/>
		<descriptor id="dBotaoVerde" region="rgBotaoVerde" focusIndex="2" moveRight="3" moveLeft="1" focusBorderWidth="4" focusBorderColor="green" selBorderColor="white"/>
		<descriptor id="dBotaoAmarelo" region="rgBotaoAmarelo" focusIndex="3" moveRight="4" moveLeft="2" focusBorderWidth="4" focusBorderColor="yellow" selBorderColor="white"/>
		<descriptor id="dBotaoAzul" region="rgBotaoAzul" focusIndex="4" moveRight="1" moveLeft="3" focusBorderWidth="4" focusBorderColor="blue" selBorderColor="white"/>

	</descriptorBase>
	
	<connectorBase>
		
		<importBase alias="MeusConectores" documentURI="connectors.ncl"/>

	</connectorBase>
</head>

 <body>
	<port id="pInicial" component="Ctx1"/>
		
		
		<context id="Ctx1">

			<port id="p1" component="fundo"/>
			
			   
               <media id="fundo" src="Imagens/Fundo.jpg" descriptor="dFundo"/>
               <media id="logo" src="Imagens/logo.png" descriptor="dLogo"/>
               <media id="video" src="musica/rock music.mp4"  descriptor="dVideo"/>
                      
               <media id="botaoIniciar" src="Imagens/botoes/BotaoIniciar.png" descriptor="dBotaoIniciar"/>
			
			<!-- começa a apresentação das imagens da tela de inicio -->

			<link xconnector="MeusConectores#onBeginStartNItems">
				<bind component="fundo" role="onBegin"/>
				<bind component="video" role="start"/>
				<bind component="logo" role="start"/>
				<bind component="botaoIniciar" role="start"/>
				
			</link>

			

			<!-- Usados para matar o contexto -->
			<link xconnector="MeusConectores#onKeySelectionStop">
				<bind component="fundo" role="onSelection">
					<bindParam name="key" value="GREEN"/>
				</bind>
				<bind component="Ctx1" role="stop"/>
			</link>



		
			

		</context>


		<!-- Jogo em si -->
		<media id="fundoJogo" src="Imagens/Jogo/FundoJogo.png" descriptor="dFundoJogo"/>
		<media id="telaGameOver" descriptor="dGameOver" src = "Imagens/gameOver.jpg"/>

		<media id="botaoVermelho" descriptor="dBotaoVermelho" src = "Imagens/botoes/BotaoMeio.png"/>
		<media id="botaoVerde" descriptor="dBotaoVerde" src = "Imagens/botoes/BotaoCantoD.png"/>
		<media id="botaoAmarelo" descriptor="dBotaoAmarelo" src = "Imagens/botoes/BotaoCantoE.png"/>
		<media id="botaoAzul" descriptor="dBotaoAzul" src = "Imagens/botoes/BotaoAposta.png"/>
		<!-- media  id="som" descriptor="dSom" src= "midia/Ice9.mp4" /-->
        
        
		<media id="noDeConfig" type="application/x-ginga-settings">
            <property name="img_num" value="" />
            <property name="service.currentFocus" value='1'/>
    	</media>

    	<media id="script" src="script.lua" descriptor="dLua">
	    	<property name="sortear" value=""/>
	    	<property name="sorteado" value=""/>
	    	<property name="botao_apertado" value=""/>
	    	<property name="game_over" value=""/>
	    	<property name='temp' value='1'/>
	    </media>


    	<switch id="switchDeImagens">

			<bindRule rule="rMeiogol" constituent="Meiogol"/>
			<bindRule rule="rMeiomiss" constituent="Meiomiss"/>
			<bindRule rule="rCantoDgol" constituent="CantoDgol"/>
			<bindRule rule="rCantoEgol" constituent="CantoEgol"/>
			<bindRule rule="rMeioMiss" constituent="MeioMiss"/>
			<bindRule rule="rCantoDmiss" constituent="CantoDmiss"/>
			<bindRule rule="rCantoE" constituent="CantoE"/>
			<bindRule rule="rCantoDfora" constituent="CantoDfora"/>
			<bindRule rule="rCantoEmiss" constituent="CantoEmiss"/>
			<bindRule rule="rCantoD" constituent="CantoD"/>
			<bindRule rule="rCantoEfora" constituent="CantoEfora"/>
			<bindRule rule="rMeiocentro" constituent="Meiocentro"/>
			<bindRule rule="rApostD"  constituent="ApostD"/>
			<bindRule rule="rApostmiss" constituent="Apostmiss"/>
			<bindRule rule="rApostGol" constituent="ApostGol"/>
			<bindRule rule="rApostMeio" constituent="ApostMeio"/>


			<media id="Meiogol" src="Imagens/Chutes/video1.mp4" descriptor="dImagem"/>
			<media id="Meiomiss" src="Imagens/Chutes/video2.mp4" descriptor="dImagem"/>
			<media id="MeioMiss" src="Imagens/Chutes/video3.mp4" descriptor="dImagem"/>
			<media id="Meiocentro" src="Imagens/Chutes/video4.mp4" descriptor="dImagem"/>

			<media id="CantoDgol" src="Imagens/Chutes/video5.mp4" descriptor="dImagem"/>
			<media id="CantoDmiss" src="Imagens/Chutes/video6.mp4" descriptor="dImagem"/>
			<media id="CantoDfora" src="Imagens/Chutes/video7.mp4" descriptor="dImagem"/>
			<media id="CantoD" src="Imagens/Chutes/video8.png" descriptor="dImagem"/>

			<media id="CantoEgol" src="Imagens/Chutes/video9.mp4" descriptor="dImagem"/>
			<media id="CantoE" src="Imagens/Chutes/video10.mp4" descriptor="dImagem"/>
			<media id="CantoEmiss" src="Imagens/Chutes/video11.mp4" descriptor="dImagem"/>
			<media id="CantoEfora" src="Imagens/Chutes/video12.mp4" descriptor="dImagem"/>

			<media id="ApostD" src="Imagens/Chutes/video13.mp4" descriptor="dImagem"/>
			<media id="Apostmiss" src="Imagens/Chutes/video14.mp4" descriptor="dImagem"/>
			<media id="ApostGol" src="Imagens/Chutes/video15.mp4" descriptor="dImagem"/>
			<media id="ApostMeio" src="Imagens/Chutes/video16.mp4" descriptor="dImagem"/>
			

		</switch>
		
		
		<link xconnector="MeusConectores#onEndStart">
			<bind component="Ctx1" role="onEnd"/>
			<bind component="som" role="start"/>
		
		</link>

		<!-- Conectores -->
		
	 	  	

		<link xconnector="MeusConectores#onEndStart">
			<bind component="Ctx1" role="onEnd"/>
			<bind component="fundoJogo" role="start"/>
			
		</link>
		
		 

			<!-- tentativa de nao user o onBeginStartNItems acima -->
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="fundoJogo" role="onBegin"/>
			<bind component="script" role="start"/>
		</link>
			
				
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="script" role="onBegin"/>
			<bind component="botaoVermelho" role="start"/>
		</link>
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="botaoVermelho" role="onBegin"/>
			<bind component="botaoVerde" role="start"/>
		</link>
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="botaoVermelho" role="onBegin"/>
			<bind component="botaoAmarelo" role="start"/>
		</link>
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="botaoAmarelo" role="onBegin"/>
			<bind component="botaoAzul" role="start"/>
			
		</link>


		<!-- usado para começar o sorteio das imagens no script -->
		<link xconnector="MeusConectores#onBeginSet">
	 		<bind component="botaoAzul" role="onBegin"/>
	 		<bind component="script" interface="sortear" role="set">
	 			<bindParam name="var" value='-1'/>
	 		</bind>
	 	</link>

	 	<!-- Controle do switch -->
	 	<link xconnector="MeusConectores#onEndAttributionStop">
	 		<bind component="script" interface="botao_apertado" role="onEndAttribution"/>
	 		<bind component="switchDeImagens" role="stop"/>
	 	</link>

	 	<link xconnector="MeusConectores#onEndAttributionSet">
	            <bind component="script" interface="sorteado" role="onEndAttribution"/>
	            <bind component="script" interface="sorteado" role="get" />
	            <bind component="noDeConfig" interface="img_num" role="set">
	                <bindParam name="var" value="$get"/>
	            </bind>
	    </link>

	 
	    <link xconnector="MeusConectores#onEndAttributionStartDelay">
	            <bind component="noDeConfig" interface="img_num" role="onEndAttribution"/>
	            <bind component="switchDeImagens" role="start">
	            <bindParam name="delay" value="0.1s" />
	            </bind>
	    </link>




    <!-- Comandos do Jogo -->


    <!-- Botao Vermelho -->
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="RED"/>
		</bind>
		<bind component="script" interface="botao_apertado" role="set">
 			<bindParam name="var" value='RED'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVermelho" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="RED"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVermelho" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="1"/>
		</bind>
	</link>

	<link xconnector='MeusConectores#onEndAttributionSet'>
		<bind component='script' interface='temp' role='onEndAttribution'/>
		<bind component='script' interface='temp' role='get'/>
		<bind component='noDeConfig' interface='service.currentFocus' role='set'>
			<bindParam name='var' value='1'/>
		</bind>
	</link>

	<!-- Botao Verde -->
	
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="GREEN"/>
		</bind>
		<bind component="script" interface="botao_apertado" role="set">
 			<bindParam name="var" value='GREEN'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVerde" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="GREEN"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVerde" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="2"/>
		</bind>
	</link>


	<!-- Botao Amarelo -->
	
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="YELLOW"/>
		</bind>
		<bind component="script" interface = "botao_apertado" role="set">
 			<bindParam name="var" value='YELLOW'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAmarelo" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="YELLOW"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAmarelo" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="3"/>
		</bind>
	</link>


	<!-- Botao Azul -->
	
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="BLUE"/>
		</bind>
		<bind component="script" interface="botao_apertado" role="set">
 			<bindParam name="var" value='BLUE'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAzul" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="BLUE"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAzul" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="4"/>
		</bind>
	</link>


	<!-- onde mostra o game over -->
    <link xconnector="MeusConectores#onEndAttributionStart">
		<bind component="script" interface="game_over" role="onEndAttribution"/>
        <bind component="telaGameOver" role="start"/>
    </link>

    <link xconnector="MeusConectores#onBeginStop">
    	<bind component="telaGameOver" role="onBegin"/>
    	<bind component="fundoJogo" role="stop"/>
    </link>

	<!-- Botao Verde para parar o script -->
	<link xconnector="MeusConectores#onKeySelectionStop">
		<bind component="telaGameOver" role="onSelection">
			<bindParam name="key" value="GREEN"/>
		</bind>
		<bind component="script" role="stop"/>
	</link>

	<link xconnector="MeusConectores#onEndStop">
		<bind component="script" role="onEnd"/>
		<bind component="telaGameOver" role="stop"/>
	</link>

	<link xconnector="MeusConectores#onEndStopNItems">
		<bind component="telaGameOver" role="onEnd"/>
		<bind component="fundoJogo" role="stop"/>
		<bind component="botaoVermelho" role="stop"/>
		<bind component="botaoVerde" role="stop"/>
		<bind component="botaoAmarelo" role="stop"/>
		<bind component="botaoAzul" role="stop"/>
	</link>

	<link xconnector="MeusConectores#onEndStart">
		<bind component="telaGameOver" role="onEnd"/>
		<bind component="Ctx1" role="start"/>
		
	</link>


</body>

</ncl>