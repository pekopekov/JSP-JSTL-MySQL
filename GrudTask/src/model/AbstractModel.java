package model;

import java.io.Serializable;
import java.util.*;


import org.hibernate.*;

import org.hibernate.criterion.Restrictions;

import entities.TPeople;

public abstract class AbstractModel<T> {

	private Class<T> entityClass;
	protected final SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	public AbstractModel(Class<T> entityClass){
		this.entityClass = entityClass;
	}
 
	public AbstractModel(){
  
	}
 
  
	@SuppressWarnings("unchecked")
	public List<TPeople> findAll(){
		try {  
			if(!sessionFactory.getCurrentSession().getTransaction().isActive()) {
				sessionFactory.getCurrentSession().getTransaction().begin();
			}
			Session sess = sessionFactory.getCurrentSession();
			
			//Get All Employees
	        Transaction tx = sess.beginTransaction();
	        Query query = sess.createQuery("from TPeople");
	        List<TPeople> tList = query.list();
	        System.out.println(tList.size());
			for(TPeople p : tList){
				System.out.println(p.getFullName());
			}
			return tList;	
		} catch (Exception e) {
			return null;
		}
   }
  

	public void update(T instance){
		try{
   
			if(!sessionFactory.getCurrentSession().getTransaction().isActive()) sessionFactory.getCurrentSession().getTransaction().begin();
			sessionFactory.getCurrentSession().merge(instance);
			sessionFactory.getCurrentSession().getTransaction().commit();
   
		}catch (RuntimeException re) {
			sessionFactory.getCurrentSession().getTransaction().rollback();
			throw re;
		}
	}
 
 
	public void delete(TPeople p){
	 try {
		 if(!sessionFactory.getCurrentSession().getTransaction().isActive()) sessionFactory.getCurrentSession().getTransaction().begin();
		 sessionFactory.getCurrentSession().delete(p);
		 sessionFactory.getCurrentSession().getTransaction().commit();
   
	 } catch (Exception e) {
		 sessionFactory.getCurrentSession().getTransaction().rollback();
		 throw e;
	 }
	}
 

  public TPeople FindParticularPeople(String name){
	  try {
    	if(!sessionFactory.getCurrentSession().getTransaction().isActive())sessionFactory.getCurrentSession().getTransaction().begin();
    	return (TPeople)sessionFactory.getCurrentSession().createCriteria(TPeople.class).add(Restrictions.eq("fullName",name)).uniqueResult();

	  } catch (Exception e) {
		  return null;
	  }
   }


 public void create(T instance){
  try{
   
   if(!sessionFactory.getCurrentSession().getTransaction().isActive())
    sessionFactory.getCurrentSession().getTransaction().begin();
   sessionFactory.getCurrentSession().persist(instance);
   sessionFactory.getCurrentSession().getTransaction().commit();
   
  }catch (RuntimeException re) {
   sessionFactory.getCurrentSession().getTransaction().rollback();
   throw re;
  }
  
 }
 

 public T find(Object PrimaryKey){
  try{
   if(!sessionFactory.getCurrentSession().getTransaction().isActive())
    sessionFactory.getCurrentSession().getTransaction().begin();
   return (T) sessionFactory.getCurrentSession().get(entityClass,(Serializable) PrimaryKey);
   
   
   
 }catch (RuntimeException re) {
  return null;
  // TODO: handle exception
 }
 
}

}
