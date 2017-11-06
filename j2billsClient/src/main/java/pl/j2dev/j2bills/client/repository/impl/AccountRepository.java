package pl.j2dev.j2bills.client.repository.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

import pl.j2dev.j2bills.client.dao.AbstractRepository;
import pl.j2dev.pojo.Account;

@Repository
public class AccountRepository extends AbstractRepository<Account> {
	
	@Override
	public Account get(int id) {
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Account> response = restTemplate
				.exchange(REST_SERVICE_URI+"/account/"+id, HttpMethod.GET, null, new ParameterizedTypeReference<Account>() {});
		Account account = response.getBody();
		return account;
	}

	@Override
	public List<Account> getAll() {
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Account>> response = restTemplate
				.exchange(REST_SERVICE_URI+"/account/", HttpMethod.GET, null, new ParameterizedTypeReference<List<Account>>() {});
		List<Account> accounts = response.getBody();
		return accounts;
	}
	
	public Map<Integer, Account> getAllAsMap() {
		Map<Integer, Account> map = new HashMap<Integer, Account>();
		List<Account> list = getAll();
		
		for (Account account : list) {
			map.put(Integer.valueOf(account.getId()+""), account);
		}
		
		return map;
	}
	
	

	@Override
	public Account create(Account object) {
		RestTemplate restTemplate = new RestTemplate();
		HttpEntity<Account> request = new HttpEntity<>(object);
		ResponseEntity<Account> response = restTemplate
		  .exchange(REST_SERVICE_URI + "/account/", HttpMethod.POST, request, Account.class);
		Account account = response.getBody();
		return account;
	}

	@Override
	public Account update(Account object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
