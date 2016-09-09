<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
    function gerarRelatorio(method) {
	var form = document.getElementById('formEstabelecimento');
	form.elements["dispatch"].value = method;
	form.submit();
    }
</script>
</head>
<body style="padding: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px">
	<div style="height: 150px; font: bold; color: white;">
		<h1>SISANIMAL</h1>
	</div>
	<ul>
		<li><html:link href="${pageContext.request.contextPath}/estabelecimento.do?dispatch=irPaginaCadastrar">
				Adicionar Estabelecimento
			</html:link></li>
		<li><html:link href="${pageContext.request.contextPath}/estabelecimento.do?dispatch=irPaginaPesquisar">
				Listar Estabelecimento
			</html:link></li>

		<html:form action="/estabelecimento" styleId="formEstabelecimento">
			<html:hidden property="dispatch" />
			<html:button value="Gerar relatório" property="" onclick="gerarRelatorio('gerarPDF')" />
		</html:form>

	</ul>
</body>
</html>