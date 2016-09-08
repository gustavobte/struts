package com.keylesson.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.keylesson.hibernate.HibernateUtil;
import com.keylesson.persistence.Estabelecimento;

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
			return "failure" ;
		}
		return "success";
	}

	public List<Estabelecimento> getUsers(String estabelecimento) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Estabelecimento> users = null;
		try {
			session.beginTransaction();
			Estabelecimento estabelecimentoX = new Estabelecimento();
			estabelecimentoX.setEstabelecimento("Loja X");
			users = session.createCriteria(Estabelecimento.class).add(Example.create(estabelecimentoX)).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			System.err.println("Error getting Users :" + e);
			session.getTransaction().rollback();
		}
		return users;
	}
}
