<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	#root {
		margin: 5% 10%;
	}
	
	img {
		cursor: pointer;
	}
	
	h2 {
		margin-bottom: 50px;
	}
	
	.hiddenForce {
		display: none;
	}
	
	 #modal-update, .modal {
	 	  z-index: 100;
	 	  background: white;
	 	  display:block;
	 	  max-width: 500px;
	 	  height: auto;
          position: fixed;
          top: 5%;
          left: 40%;
          border: 1px solid;
          padding: 2rem 5rem 3rem;
          box-shadow: 10px 10px 10px black;
      }
      
       .modal {
       	position:relative;
       }
       
      
      .hidden-modal {
          display: none!important;
      }
      
      .close-button {
      	position: absolute;
      	right: 0;
      	top: 0;
      }
      
      .close {
      	background: 0;
      	border: transparent;
      	font-size: 3rem;
      	margin-top: -10px;
      }
      
</style>
</head>
<body>
<div id="modal-update" class="hidden-modal modal">
		<div class="close-button" onClick="openModal()">
			<button class="close" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
        <form action="/quisquinho/save" method="POST">
        <input type="hidden" name="id" id="id">
        	<div class="form-group mt-e-2">
            <label for=name>Nome</label>
            <input type="text" class="form-control" id="nome-usuario" name="nome" required>
            <small id="nome" class="form-text text-muted "></small>
        </div>
        <div class="form-group mt-e-2">
            <label for="endereco">Endereco</label>
            <input type="text" class="form-control" id="endereco" name="endereco" required>
            <small class="form-text text-muted "></small>
        </div>
        <div class="form-group mt-e-2">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="email" required>
            <small class="form-text text-muted "></small>
        </div>   
        <div class="form-group mt-e-2">
            <label for="telefone">Telefone</label>
            <input type="text" class="form-control" id="telefone" name="telefone" required>
            <small class="form-text text-muted "></small>
        </div>   
        <div class="form-group mt-e-2">
            <label for="prodInte">Produto de interesse</label>
            <input type="text" class="form-control" id="prodInte" name="prodInte" required>
            <small class="form-text text-muted "></small>
        </div>   
        
        <div class="form-group mt-e-2">
            <label for="idade">Idade</label>
            <input type="text" class="form-control" id="idade" name="idade" required>
            <small class="form-text text-muted "></small>
        </div>
        
       <div class="form-group mt-e-2" style="margin-top:25px;display:flex;flex-direction:column; align-items:center;justify-content:center;">
            <h5 >Gênero</h5>
             <div class="form-group mt-e-2">
       		<label ><input  type="radio" name="homem" id="m"  value="true" required > Masculino</label>
       		<label ><input  type="radio" name="homem" id="f"   value="false" required> Feminino</label>
       </div>
        </div>
       
       <button class="btn btn-success" style="margin-top:25px">Salvar</button>
        </form>

      
    </div>
<nav class="navbar navbar-expand-lg navbar-light bg-light p-2">
  <a class="navbar-brand" href="/maze/"><img src="../img/maze.png" alt="mazelogo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link" href="#">Lista de usuários</a>
      <a class="nav-item nav-link" href="dash">Dashboard</a>
    </div>
  </div>
</nav>
	<div id="root">
	<h2>Tabela de clientes cadastrados</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">id</th>
					<th scope="col">Nome</th>
					<th scope="col">Endereço</th>
					<th scope="col">Email</th>
					<th scope="col">Telefone</th>
					<th scope="col">Produtos de interesse</th>
					<th scope="col">Gênero</th>
					<th scope="col">Idade</th>
					<th scope="col">Editar</th>
					<th scope="col">Excluir</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${clientes}" var="c">
				<tr>
			      <th scope="row">${c.id }</th>
			      <td>${c.nome }</td>
			      <td>${c.endereco }</td>
			      <td>${c.email }</td>
			      <td>${c.telefone }</td>
			      <td>${c.prodInte }</td>
			      <td>${c.genero }</td>
			      <td>${c.idade }</td>
			      <td id="edit" onclick="openModal(`${c}`)"><img width="20px" src="../img/icon-lapis.png" alt="lapis"/></td>
			      <td><img width="20px" src="../img/trashIcon.png" alt="trash" onclick="deleteUser(${c.id})"/></td>
			    </tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<script>
	
		function deleteUser(id){
			if(confirm("Confirmar exclusão do cliente " + id)) {
				window.location.assign("delete_cliente?idCliente="+id);
			}
		}
		function editForm (e) {
			const it = e.split(';')
			const user = {
				id: it[0],
				nome: it[1],
				endereco: it[2],
				email: it[3],
				telefone: it[4],
				prodInte: it[5],
				genero: it[6],
				idade: it[7],
				dia_cad: it[8]
			}
			
			return user;
			
		}
		
		 function openModal(cliente) {
	           const newModal =  document.getElementById("modal-update");
	           if(!newModal.classList.contains("hidden-modal")){
		           newModal.classList.add("hidden-modal")
		           return;
	           }
	           
	           newModal.classList.remove("hidden-modal")
	           const user = editForm(cliente);
	           document.getElementById("id").setAttribute("value", user.id + "")
	           document.getElementById("nome-usuario").setAttribute("value", user.nome + "")
	           document.getElementById("endereco").setAttribute("value", user.endereco + "")
	           document.getElementById("email").setAttribute("value", user.email + "")
	           document.getElementById("telefone").setAttribute("value", user.telefone + "")
	           document.getElementById("prodInte").setAttribute("value", user.prodInte + "")
	           document.getElementById("idade").setAttribute("value", user.idade + "")
	           if(user.genero === "Feminino"){
	           	document.getElementById("f").setAttribute("checked", true)
	           } else {
	     	   	document.getElementById("m").setAttribute("checked", true)  
	           }
		 }
        </script>
</body>
</html>