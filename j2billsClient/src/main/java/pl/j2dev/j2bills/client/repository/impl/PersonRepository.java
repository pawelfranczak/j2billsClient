package pl.j2dev.j2bills.client.repository.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

import pl.j2dev.j2bills.client.dao.AbstractRepository;
import pl.j2dev.pojo.Person;

@Repository
public class PersonRepository extends AbstractRepository<Person> {

	@Override
	public Person get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Person> getAll() {
		final String URL = REST_SERVICE_URI +"/person/";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Person>> response = restTemplate
				.exchange(URL, HttpMethod.GET, null, new ParameterizedTypeReference<List<Person>>() {});
		List<Person> persons = response.getBody();
		return persons;
	}
	
	public Map<Integer, Person> getAllAsMap() {
		Map<Integer, Person> map = new HashMap<Integer, Person>();
		List<Person> list = getAll();
		for (Person person : list) {
			map.put(Integer.valueOf(person.getId()+""), person);
		}
		return map;
	}

	@Override
	public Person create(Person object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Person update(Person object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
