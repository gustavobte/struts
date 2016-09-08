package com.indra.form;

import org.apache.struts.action.ActionForm;

public class EstabelecimentoForm extends ActionForm {
	private static final long serialVersionUID = 1L;

	private String dispatch;
	private String estabelecimento;
	private String situacao;

	public void reset() {
		this.estabelecimento = null;
		this.situacao = null;
	}

	public String getDispatch() {
		return dispatch;
	}

	public void setDispatch(String dispatch) {
		this.dispatch = dispatch;
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
