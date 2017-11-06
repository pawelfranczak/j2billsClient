package pl.j2dev.j2bills.client.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.j2dev.j2bills.client.repository.impl.AccountRepository;
import pl.j2dev.j2bills.client.repository.impl.JournalRepository;
import pl.j2dev.j2bills.client.repository.impl.PersonRepository;
import pl.j2dev.pojo.Account;
import pl.j2dev.pojo.Journal;
import pl.j2dev.pojo.JournalMovement;
import pl.j2dev.pojo.Person;

@Controller
@RequestMapping("/journal")
public class JournalController {
	
	private final int JOURNALS_ON_ONE_SITE = 15;
	
	@Autowired
	JournalRepository daoJournal;
	
	@Autowired
	PersonRepository daoPerson;
	
	@Autowired
	AccountRepository daoAccount;
	
	@RequestMapping(value = "/create")
	public ModelAndView createNewJournalEntryGET() {
		List<Person> persons = daoPerson.getAll();
		List<Account> accounts = daoAccount.getAll();
		
		ModelAndView mv = new ModelAndView("journal_create_new");
		mv.addObject("persons", persons);
		mv.addObject("accounts", accounts);
		mv.addObject("journal", new Journal());
		return mv;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createNewJournalEntryPOST(@ModelAttribute("journal") Journal journal) {
		
		ModelAndView mv = new ModelAndView("journal_create_new");
		System.out.println(journal);
		
		Journal createdJournal = null;
		String validate = validate(journal);
		if (validate.length() == 0) {
			createdJournal = daoJournal.create(journal);
			mv.addObject("succes", "Utworzono pomyślne: ID = " + createdJournal.getId());
			mv.addObject("journal", new Journal());
		} else {
			mv.addObject("error", validate);
			mv.addObject("journal", journal);
		}
			
		
		List<Person> persons = daoPerson.getAll();
		List<Account> accounts = daoAccount.getAll();
		
		mv.addObject("persons", persons);
		mv.addObject("accounts", accounts);
		
		
		return mv;
	}

	@RequestMapping("/{offset}")
	public ModelAndView showJournalForOneAccount(@PathVariable("offset") int offset) {
		BigDecimal countOfJournalEntries = new BigDecimal(daoJournal.getCountOfJournalsEntries());
		BigDecimal howManyOnOneSite = new BigDecimal(JOURNALS_ON_ONE_SITE);
		BigDecimal howManySites = countOfJournalEntries.divide(howManyOnOneSite, RoundingMode.CEILING);
		
		List<Journal> journals = daoJournal.getWithLimit(JOURNALS_ON_ONE_SITE, (offset-1)*JOURNALS_ON_ONE_SITE);
		
		Map<Integer, Person> persons = daoPerson.getAllAsMap();
		Map<Integer, Account> accounts = daoAccount.getAllAsMap();
		
		ModelAndView mv = new ModelAndView("journal_show_all");
		mv.addObject("journals", journals);
		mv.addObject("persons", persons);
		mv.addObject("accounts", accounts);
		mv.addObject("howManySites", howManySites.intValue());
		return mv;
	}
	
	@RequestMapping("/createMovement")
	public ModelAndView createMovementGET() {
		List<Person> persons = daoPerson.getAll();
		List<Account> accounts = daoAccount.getAll();
		
		ModelAndView mv = new ModelAndView("journal_create_new_movement");
		mv.addObject("persons", persons);
		mv.addObject("accounts", accounts);
		mv.addObject("journalMovement", new JournalMovement());
		return mv;
	}
	
	@RequestMapping(value = "/createMovement", method = RequestMethod.POST)
	public ModelAndView createMovementPOST(@ModelAttribute("journalMovement") JournalMovement journalMovement) {
		ModelAndView mv = new ModelAndView("journal_create_new_movement");
		
		JournalMovement createdJournalMovement = null;
		String validate = validate(journalMovement);
		if (validate.length() == 0) {
			createdJournalMovement = daoJournal.createMovement(journalMovement);
			mv.addObject("succes", "Utworzono pomyślne: ID = " + createdJournalMovement.getSource().getId());
			mv.addObject("journalMovement", new JournalMovement());
		} else {
			mv.addObject("error", validate);
			mv.addObject("journal", journalMovement);
		}
			
		List<Person> persons = daoPerson.getAll();
		List<Account> accounts = daoAccount.getAll();
		
		mv.addObject("persons", persons);
		mv.addObject("accounts", accounts);
		
		return mv;
	}
	
	
	private String validate(Journal journal) {
		String result = "";
		if (journal.getDescription().length() == 0) {
			result += "Uzupełnij opis\n";
		}
		if (journal.getPersonId() == 0) {
			result += "Wybierz osobę\n";
		}
		if (journal.getAccountId() == 0) {
			result += "Wybierz konto\n";
		}
		if (journal.getValue() == null || journal.getValue().compareTo(BigDecimal.ZERO) == 0) {
			result += "Wprowadź wartość\n";
		}
		return result;
	}
	
	private String validate(JournalMovement journalMovement) {
		String result = "";
		Journal source = journalMovement.getSource();
		Journal target = journalMovement.getTarget();
		
		if (source.getDescription().length() == 0) {
			result += "Uzupełnij opis\n";
		}
		if (source.getPersonId() == 0) {
			result += "Wybierz osobę\n";
		}
		if (source.getAccountId() == 0) {
			result += "Wybierz konto źródłowe\n";
		}
		if (target.getAccountId() == 0) {
			result += "Wybierz konto docelowe\n";
		}
		if (source.getValue() == null || source.getValue().compareTo(BigDecimal.ZERO) == 0) {
			result += "Wprowadź wartość\n";
		}
		if (source.getAccountId() != 0 && source.getAccountId() == target.getAccountId()) {
			result += "Konto źródłowe i docelowe nie może być to samo\n";
		}
		return result;
	}



}
