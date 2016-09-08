package com.keylesson.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.keylesson.dao.EstabelecimentoDAO;
import com.keylesson.form.EstabelecimentoForm;

public class EstabelecimentoAction extends DispatchAction {

	public ActionForward goToSearchPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("search");
	}
	
	public ActionForward goToAddPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("add");
	}
	
	public ActionForward searchUsers(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		EstabelecimentoForm userForm = (EstabelecimentoForm) form;
		List users = new EstabelecimentoDAO().getUsers(userForm.getEstabelecimento());
		request.setAttribute("users", users);
		return mapping.findForward("search");
	}
	
	public ActionForward addUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		EstabelecimentoForm userForm = (EstabelecimentoForm) form;
		String result = new EstabelecimentoDAO().createUser(userForm.getEstabelecimento(), userForm.getSituacao());
		if(result.equals("success")){
			request.setAttribute("success", true);
			userForm.reset();
		}else{
			request.setAttribute("failure", true);
		}
		return mapping.findForward("add");
	}

}
