package com.cel.shoppingquiosque.model;

import java.util.Calendar;

import org.springframework.format.annotation.DateTimeFormat;

public class Cliente {
	private Long id;
	private String nome;
	private String endereco;
	private String email;
	private String telefone;
	private String prodInte;
	private int idade;
	private boolean homem;
	private long diaCadastro;
	
	
	public Long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getProdInte() {
		return prodInte;
	}
	public void setProdInte(String prodInte) {
		this.prodInte = prodInte;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public boolean isHomem() {
		return homem;
	}
	public void setHomem(boolean homem) {
		this.homem = homem;
	}
	public long getDiaCadastro() {
		return diaCadastro;
	}
	public void setDiaCadastro(long diaCadastro) {
		this.diaCadastro = diaCadastro;
	}
	
	public String getGenero () {
		return this.isHomem() ? "Masculino" : "Feminino";
	}
	
	@Override
	public String toString() {
		return this.getId() + ";" + this.getNome() + ";" + this.getEndereco() + ";" + this.getEmail() + ";" + this.getTelefone() + ";" + this.getProdInte() + ";" 
		+ this.getGenero() + ";" +this.getIdade() + ";" + this.getDiaCadastro();
	}
}
