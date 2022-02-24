<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Insert title here</title>
<style>
        .container-full {
            min-width: 97vw;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .counters {
            margin-top: 2rem;
            width: 100%;
            display: flex;
            justify-content: space-around;
        }
        
        .item {
            background-color: rgba(0, 0, 255, 0.405);
            border-radius: 8px;
            padding: 15px;
            display: flex;
            flex-direction: column;
            transition: all 0.2s;
        }
        
        .item:hover {
            transform: scale(1.1);
        }
        
        .item div {
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
        
        .table-count {
            max-width: 60%;
            margin: 5% auto;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light p-2">
        <a class="navbar-brand" href="/maze"><img src="../img/maze.png" alt="mazelogo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link" href="clientes">Lista de usuários</a>
                <a class="nav-item nav-link" href="dash">Dashboard</a>
            </div>
        </div>
    </nav>

    <main>
        <h1 style="text-align: center; text-decoration: underline;">Dashboard</h1>
        <div class="container-full">
            <div class="counters">
                <div class="item">
                    <h3>Quantidades de clientes por gênero</h3>
                    <div>
                        <h4>Masculino</h4>
                        <h5>${mas }</h5>
                    </div>
                    <div>
                        <h4>Feminino</h4>
                        <h5>${fem }</h5>
                    </div>
                </div>
                <div class="item">
                    <h3>Quantidades de clientes por faixa etária</h3>
                    <div>
                        <h4>Jovem</h4>
                        <h5>${jov }</h5>
                    </div>
                    <div>
                        <h4>Adulto</h4>
                        <h5>${adu }</h5>
                    </div>
                    <div>
                        <h4>Idoso</h4>
                        <h5>${ido }</h5>
                    </div>
                </div>
                <div class="item">
                    <h3>Quantidades de clientes por período do dia</h3>
                    <div>
                        <h4>Manhã</h4>
                        <h5>${man }</h5>
                    </div>
                    <div>
                        <h4>Tarde</h4>
                        <h5>${tar }</h5>
                    </div>
                    <div>
                        <h4>Noite</h4>
                        <h5>${noi }</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-count">
            <h2 style="text-align: center;margin-bottom: 15px;">Quantidades de clientes por dia da semana</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Domingo</th>
                        <th scope="col">Segunda</th>
                        <th scope="col">Terça</th>
                        <th scope="col">Quarta</th>
                        <th scope="col">Quinta</th>
                        <th scope="col">Sexta</th>
                        <th scope="col">Sábado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td>${dom }</td>
                    <td>${seg }</td>
                    <td>${ter }</td>
                    <td>${qua }</td>
                    <td>${qui }</td>
                    <td>${sex }</td>
                    <td>${sab }</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>

</body>
</html>