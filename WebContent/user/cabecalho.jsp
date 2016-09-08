<%@ page contentType="text/html; charset=utf-8"%>

<s:form action="base" theme="simple">
	<s:hidden name="idGlobal" />
	<s:hidden name="idLocal" />
	<input type="hidden" name="ativo" value="S" />
	<div id="resolucao">
		<div id="moldura-topo">
			<div id="topo">
				<div id="identificacao-ministerio">
					<span>
						<div id="imagemGov">
							<a id="brasilgov" target="_blank" href="http://www.brasil.gov.br"></a>
						</div>
					</span>
				</div>
				<div id="identificacao-sistema">
					<p><s:label value="%{aplicacaoPrincipal.versao}" cssClass="form-label" /></p>
					<h1><s:label value="%{aplicacaoPrincipal.name.toUpperCase()}" cssClass="form-label" /></h1>
					<h2><s:label value="%{aplicacaoPrincipal.nome}"	cssClass="form-label" /></h2>
				</div>
				<div id="dados-login">
					<p>
						<span><s:label key="label.usuario" cssClass="form-label" />:</span>
						<s:label value="%{nomeUsuario}" cssClass="form-label" />
						<br />
						<span><s:label key="label.data" cssClass="form-label" />:</span>
						<B><s:date name="currentDate" format="dd/MM/yyyy" /></B>
						<br />
						<span><s:label key="label.unidadegestora" cssClass="form-label" />:</span>
						<s:label value="%{siglaUnidadeGestora}" cssClass="form-label" />
						<br />
						<a href="javascript:logout();" style="form-label">Sair do Sistema</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</s:form>