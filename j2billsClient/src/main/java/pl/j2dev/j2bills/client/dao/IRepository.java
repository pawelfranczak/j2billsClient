package pl.j2dev.j2bills.client.dao;

import java.util.List;


public interface IRepository<T> {
	T get(int id);
	List<T> getAll();
	T create(T object);
	T update(T object);
	boolean delete(int id);
}
