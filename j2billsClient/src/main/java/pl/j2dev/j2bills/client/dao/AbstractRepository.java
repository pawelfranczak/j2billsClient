package pl.j2dev.j2bills.client.dao;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;

@PropertySource("classpath:restapi.properties")
public abstract class AbstractRepository<T> implements IRepository<T> {

	@Value("${api.url}")
	protected String REST_SERVICE_URI;

}
