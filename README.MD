# Aplicação para trabalho escolar 
Java web
Maze
Aplicação com crud utilizando spring

# Script do banco de dados 
```
CREATE DATABASE clientes
```
```
CREATE TABLE `tb_cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `prod_inte` varchar(50) NOT NULL,
  `idade` int(11) NOT NULL,
  `genero` tinyint(1) NOT NULL,
  `dia_cadastro` bigint(20) NOT NULL
)
```
## Rotas da Aplicação
```
rotas :
	/ `Index da aplicação`
		/registrar `tela de criação de cliente (cadastro)`
			/admin/clientes `Listagem, alteração e exclusão de cliente`
			/admin/dash `dashboard com algumas informações gerais`
```



### Participantes : 
1. Caio
1. Eduardo Do Prado
1. Lucas David

Tecnologias utilizadas
###
#### Java
#### Javascript
#### Sql


