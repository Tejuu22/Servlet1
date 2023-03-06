package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Markscard;


public class Marksdao {

	EntityManagerFactory entityManagerFactory=Persistence.createEntityManagerFactory("dev");
	EntityManager entityManager=entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction=entityManager.getTransaction();
	
	

	public Markscard find(int id)
	{
		return entityManager.find(Markscard.class, id);
	}
	
	public void update(Markscard markscard)
	{
		entityTransaction.begin();
		entityManager.merge(markscard);
		entityTransaction.commit();
	
	}

	public void save(Markscard card) {
		entityTransaction.begin();
		entityManager.persist(card);
		entityTransaction.commit();
	}
}
		
		
