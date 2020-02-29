package com.service.micro.currencyexchangeservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.service.micro.currencyexchangeservice.ExchangeValueRepository;
import com.service.micro.currencyexchangeservice.bean.ExchangeValue;

@RestController
public class CurrencyExchangeController{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	Environment environment;
	
	@Autowired
	ExchangeValueRepository repository;
	@GetMapping("currency-exchange/from/{from}/to/{to}")
	public ExchangeValue retrieveExchnageRate(@PathVariable String from, @PathVariable String to) {
		ExchangeValue exchangeService = repository.findByFromAndTo(from, to);
		
		logger.info("{}", exchangeService);
		exchangeService.setPort(environment.getProperty("local.server.port"));
		return exchangeService;
		
	}
}
