package com.service.micro.currencyconversionservice;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.service.micro.currencyconversionservice.bean.CurrencyConvert;
import com.service.micro.currencyconversionservice.feign.CurrencyExchangeServiceProxy;

@RestController
public class CurrencyConversionController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CurrencyExchangeServiceProxy proxy;

	@GetMapping("currency-converter/from/{from}/to/{to}/quantity/{quantity}")
	public CurrencyConvert getTotalAmount(@PathVariable String from, @PathVariable String to, @PathVariable BigDecimal quantity) {
		Map<String, String> uriVariables = new HashMap();
		uriVariables.put("from", from);
		uriVariables.put("to", to);
		
		ResponseEntity<CurrencyConvert> responseEntity = new RestTemplate().getForEntity("http://localhost:8000/currency-exchange/from/{from}/to/{to}", CurrencyConvert.class, uriVariables);
		CurrencyConvert re = responseEntity.getBody();
		return new CurrencyConvert(re.getId(), from, to, quantity, re.getExchangeRate(), quantity.multiply(re.getExchangeRate()), re.getPort());
	}
	
	@GetMapping("currency-converter-feign/from/{from}/to/{to}/quantity/{quantity}")
	public CurrencyConvert getTotalAmountFeign(@PathVariable String from, @PathVariable String to, @PathVariable BigDecimal quantity) {
		
		CurrencyConvert re = proxy.retrieveExchnageRate(from, to);
		
		logger.info("{}", re);
		return new CurrencyConvert(re.getId(), from, to, quantity, re.getExchangeRate(), quantity.multiply(re.getExchangeRate()), re.getPort());
	}
}
