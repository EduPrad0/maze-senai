package com.cel.shoppingquiosque.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cel.shoppingquiosque.model.Cliente;


public class DaoCliente {
	private Connection liga;
	
	public DaoCliente () {
		this.liga = ConnectionFactory.conectar();
	}
	
	
	public void criarCliente (Cliente c) {
		String sql = "insert into tb_cliente(nome, endereco, email, telefone, prod_inte, idade, genero, dia_cadastro) values(?,?,?,?,?,?,?,?)";
		
		PreparedStatement stmt;
		
		
		try {
			stmt = liga.prepareStatement(sql);
			
			stmt.setString(1, c.getNome());
			stmt.setString(2, c.getEndereco());
			stmt.setString(3, c.getEmail());
			stmt.setString(4, c.getTelefone());
			stmt.setString(5, c.getProdInte());
			stmt.setInt(6, c.getIdade());
			stmt.setBoolean(7, c.isHomem());
			stmt.setLong(8, c.getDiaCadastro());
			
			stmt.execute();
			stmt.close();
			liga.close();
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	
	}

	
	
	public List<Cliente> pegarClientes() {
		String sql = "SELECT * FROM `tb_cliente`";
		
		PreparedStatement stmt;
		List<Cliente> clientes = new ArrayList<Cliente>();
		
		try {
			stmt = liga.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Cliente c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEndereco(rs.getString("endereco"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setProdInte(rs.getString("prod_inte"));
				c.setIdade(rs.getInt("idade"));
				c.setHomem(rs.getBoolean("genero"));
				c.setDiaCadastro(rs.getLong("dia_cadastro"));
				
				
				clientes.add(c);
			}
			
			rs.close();
			stmt.close();
			liga.close();
			return clientes;
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public void delete (long idCliente) {
		String sql = "delete from tb_cliente where id = ?";
		PreparedStatement stmt;
		
		try {
			stmt = liga.prepareStatement(sql);
			stmt.setLong(1, idCliente);
			stmt.execute();
			stmt.close();
			liga.close();
		} catch (Exception e) {
		}
	}
	
	public void update (Cliente cliente) {
		String sql = "update tb_cliente set nome = ?, endereco = ?, email = ?, telefone = ?, prod_inte = ?, idade = ?, genero = ?, dia_cadastro = ? where id = ? ";
		
		PreparedStatement stmt;
		
		try {
			stmt = liga.prepareStatement(sql);
			
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getEndereco());
			stmt.setString(3, cliente.getEmail());
			stmt.setString(4, cliente.getTelefone());
			stmt.setString(5, cliente.getProdInte());
			stmt.setInt(6, cliente.getIdade());
			stmt.setBoolean(7, cliente.isHomem());
			stmt.setLong(8, cliente.getDiaCadastro());
			stmt.setLong(9, cliente.getId());
			
			stmt.execute();
			stmt.close();
			liga.close();
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	
}
