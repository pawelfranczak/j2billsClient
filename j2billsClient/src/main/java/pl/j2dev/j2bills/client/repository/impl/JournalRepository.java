package pl.j2dev.j2bills.client.repository.impl;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

import pl.j2dev.j2bills.client.dao.AbstractRepository;
import pl.j2dev.pojo.Journal;
import pl.j2dev.pojo.JournalMovement;

@Repository
public class JournalRepository extends AbstractRepository<Journal> {

	@Override
	public Journal get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Journal> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Journal create(Journal object) {
		RestTemplate restTemplate = new RestTemplate();
		HttpEntity<Journal> request = new HttpEntity<>(object);
		ResponseEntity<Journal> response = restTemplate
		  .exchange(REST_SERVICE_URI + "/journal/", HttpMethod.POST, request, Journal.class);
		Journal journal = response.getBody();
		return journal;
	}

	@Override
	public Journal update(Journal object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public List<Journal> getWithLimit(int count, int offset) {
		final String URL = REST_SERVICE_URI +"/journal/" + count + "/" + offset;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Journal>> response = restTemplate
				.exchange(URL, HttpMethod.GET, null, new ParameterizedTypeReference<List<Journal>>() {});
		List<Journal> journals = response.getBody();
		return journals;
		
	}
	
	public List<Journal> getWithLimitForAccount(int count, int offset, int accountId) {
		final String URL = REST_SERVICE_URI +"/journal/" + count + "/" + offset + "/" + accountId;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<List<Journal>> response = restTemplate
				.exchange(URL, HttpMethod.GET, null, new ParameterizedTypeReference<List<Journal>>() {});
		List<Journal> journals = response.getBody();
		return journals;
	}
	
	public int getCountOfJournalsEntries(int accountId) {
		final String URL = REST_SERVICE_URI +"/journal/count/" + accountId;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Integer> response = restTemplate
				.exchange(URL, HttpMethod.GET, null, new ParameterizedTypeReference<Integer>() {});
		Integer count = response.getBody();
		return count;
	}
	
	public int getCountOfJournalsEntries() {
		final String URL = REST_SERVICE_URI +"/journal/count/";
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Integer> response = restTemplate
				.exchange(URL, HttpMethod.GET, null, new ParameterizedTypeReference<Integer>() {});
		Integer count = response.getBody();
		return count;
	}

	public JournalMovement createMovement(JournalMovement journalMovement) {
		RestTemplate restTemplate = new RestTemplate();
		HttpEntity<JournalMovement> request = new HttpEntity<>(journalMovement);
		ResponseEntity<JournalMovement> response = restTemplate
		  .exchange(REST_SERVICE_URI + "/journal/createMovement/", HttpMethod.POST, request, JournalMovement.class);
		JournalMovement newJournalMovement = response.getBody();
		return newJournalMovement;
	}

}
