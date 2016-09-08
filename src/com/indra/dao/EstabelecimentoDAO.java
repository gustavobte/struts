package com.indra.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;

import com.indra.hibernate.HibernateUtil;
import com.indra.persistence.Estabelecimento;

public class EstabelecimentoDAO {

	public String createUser(String estabelecimento, String situacao) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Estabelecimento user = new Estabelecimento();
			user.setEstabelecimento(estabelecimento);
			user.setSituacao(situacao);
			session.save(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			System.err.println("Error ao criar estabelecimento:" + e.getMessage());
			session.getTransaction().rollback();
			return "failure";
		}
		return "success";
	}

	public List<Estabelecimento> getUsers(String estabelecimento) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Estabelecimento> users = null;
		try {
			session.beginTransaction();
			users = session.createCriteria(Estabelecimento.class)
					.add(Restrictions.ilike("estabelecimento", "%" + estabelecimento + "%")).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.err.println("Error getting Users :" + e);
			session.getTransaction().rollback();
		}
		return users;
	}
}
