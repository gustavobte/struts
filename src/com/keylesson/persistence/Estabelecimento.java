package com.keylesson.persistence;

public class Estabelecimento {

	private int id;
	private String estabelecimento;
	private String situacao;

	public Estabelecimento() {
	}

	public Estabelecimento(int id, String estabelecimento) {
		this.id = id;
		this.estabelecimento = estabelecimento;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEstabelecimento() {
		return estabelecimento;
	}

	public void setEstabelecimento(String estabelecimento) {
		this.estabelecimento = estabelecimento;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
}
