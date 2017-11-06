package pl.j2dev.j2bills.client.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.j2dev.j2bills.client.dao.IRepository;
import pl.j2dev.j2bills.client.repository.impl.JournalRepository;
import pl.j2dev.j2bills.client.repository.impl.PersonRepository;
import pl.j2dev.pojo.Account;
import pl.j2dev.pojo.Journal;
import pl.j2dev.pojo.Person;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	private final int JOURNALS_ON_ONE_SITE = 5;

	@Autowired
	IRepository<Account> daoAccount;
	
	@Autowired
	JournalRepository daoJournal;
	
	@Autowired
	PersonRepository daoPerson;
	
	@RequestMapping("/")
	public ModelAndView listAllAccounts() {
		List<Account> accounts = daoAccount.getAll();
		ModelAndView mv = new ModelAndView("account_show_all");
		mv.addObject("accounts", accounts);
		return mv;
	}
	
	@RequestMapping("/{id}/{offset}")
	public ModelAndView showOneAccount(@PathVariable("id") int id, @PathVariable("offset") int offset) {
		BigDecimal countOfJournalEntries = new BigDecimal(daoJournal.getCountOfJournalsEntries(id));
		BigDecimal howManyOnOneSite = new BigDecimal(JOURNALS_ON_ONE_SITE);
		BigDecimal howManySites = countOfJournalEntries.divide(howManyOnOneSite, RoundingMode.CEILING);
		
		Account account = daoAccount.get(id);
		List<Journal> journals = daoJournal.getWithLimitForAccount(JOURNALS_ON_ONE_SITE, (offset-1)*JOURNALS_ON_ONE_SITE, id);
		
		Map<Integer, Person> persons = daoPerson.getAllAsMap();
		
		ModelAndView mv = new ModelAndView("account_show_one");
		mv.addObject(account);
		mv.addObject("journals", journals);
		mv.addObject("persons", persons);
		mv.addObject("howManySites", howManySites.intValue());
		return mv;
	}
	

	@RequestMapping(value="/create", method = RequestMethod.POST)
	public ModelAndView createNewPOST(@ModelAttribute("account") Account account) {
		ModelAndView mv = new ModelAndView("account_show_one");
		BigDecimal balance = account.getBalance();
		account.setBalance(BigDecimal.ZERO);
		Account createdAccount = daoAccount.create(account);
		mv.addObject("account", createdAccount);
		
		Journal journal = new Journal();
		journal.setAccount(createdAccount);
		journal.setDescription("bilans otwarcia");
		journal.setValue(balance);
		journal.setPersonId(0);
		journal.setAccountId((int)createdAccount.getId());
		
		Journal createdJournal = daoJournal.create(journal);
		createdAccount.setBalance(createdJournal.getValue());
		
		Map<Integer, Person> persons = daoPerson.getAllAsMap();
		mv.addObject("persons", persons);
		mv.addObject("account", createdAccount);
		
		List<Journal> journals = new ArrayList<Journal>();
		journals.add(createdJournal);
		mv.addObject("journals", journals);
		
		return mv;
	}
	
	@RequestMapping("/create")
	public ModelAndView createNewGET() {
		ModelAndView mv = new ModelAndView("account_create_new");
		mv.addObject("account", new Account());
		return mv;
	}
	
}
