<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="https://img.icons8.com/ios/50/000000/globe-earth.png" type="image/x-icon">
    <link rel="stylesheet" href="./styles.module.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
    <!-- font-family: 'Merriweather', serif; -->
    <title>quisquinho</title>
    <style>
    	button {
    		cursor: pointer;
    	}
    </style>
</head>
<body>
	<nav>
		<div class="vhome">
		<button type="button" class="btn btn-light" onclick="irPara('/maze/')">Voltar para home</button></div>
		<img src="./img/maze.png" alt="mazelogo">
		<div class="vlistagem">
		<button type="button" class="btn btn-light" onclick="irPara('admin/clientes')">Listagem de clientes</button>
		</div>
	</nav>
    <div id="root">
        <section id="header">
            <h1>Contate-nos</h1>
            <p>Quisquinho, a empresa que te ajuda a escrever</p>
        </section>
        <main>
            <div class="contact">
                <div class="inf-t">
                    <h2>Diga sua experiência</h2>
                    <p>Entre em contato a qualquer momento e respondemos em 24 horas</p>
                </div>
                <div class="contatos">
                    <ul>
                        <li class="items-icons"><img src="./img/icons-phone.png" alt="phone">
                            <h4>(11) 9 4002-8922</h4>
                        </li>
                        <li class="items-icons"><img src="./img/icons-email.png" alt="email">
                            <h4>quisquinho@gmail.com</h4>
                        </li>
                        <li class="items-icons"><img src="./img/icons-shop.png" alt="local">
                            <h4>Rua javi, masjafoi 91</h4>
                        </li>
                    </ul>
                </div>
                <div class="footer-contact">
                    <ul>
                        <li><img src="./img/icons-facebook.png" alt="facebook"></li>
                        <li><img src="./img/icons-twitter.png" alt="twitter"></li>
                        <li><img src="./img/icons-instagram.png" alt="insta"></li>
                        <li><img src="./img/icons-whatsapp.png" alt="wpp"></li>
                    </ul>
                </div>
                <div class="efeito-bola"></div>
                <div class="efeito-outrabola"></div>
            </div>
            <div class="form">
                <form action="save" method="POST">
                    <div class="input-group">
                        <div class="input-style">
                            <label for="nome">Nome</label>
                            <input type="text" id="nome" name="nome" value="${cliente.nome }" required>
                        </div>
                        <div class="input-style">
                            <label for="endereco">Endereço</label>
                            <input type="text" id="endereco" name="endereco" value="${cliente.endereco }" required>
                        </div>
                        <div class="input-style">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="${cliente.email }" required>
                        </div>
                        <div class="input-style">
                            <label for="telefone">Telefone ou Celular</label>
                            <input type="number" maxlength="9" required id="telefone" value="${cliente.telefone }" name="telefone" placeholder="900000   000">
                        </div>
                        <div class="input-style">
                            <label for="prodInte">Produto de interesse</label>
                            <input type="text" id="prodInte" name="prodInte"value="${cliente.prodInte }"  required>
                        </div>
                        <div class="input-style">
                            <label for="idade">Informe sua idade</label>
                            <input type="number" id="idade" name="idade" value="${cliente.idade }" required>
                        </div>
                    </div>
                    <div class="input-group-dois">
                        <div class="input_genero">
                            <h3>Selecione seu gênero </h3>
                            <div class="radios">
                                <label class="ir"><input  type="radio" name="homem" id="m" value="true" required> Masculino</label>
                                <label class="ir"><input  type="radio" name="homem" id="f" value="false" required> Feminino</label>
                            </div>
                        </div>
                    </div>

                    <div class="button">
                        <button type="submit" class="btn">Enviar</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
    <script>
    	function irPara(url) {
    		window.location.assign(url)
    	}
    </script>
</body>
</html>