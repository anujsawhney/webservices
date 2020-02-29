package com.service.micro.currencyconversionservice.feign;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.service.micro.currencyconversionservice.bean.CurrencyConvert;

@FeignClient(name = "netflix-zuul-api-gateway-server")
//@FeignClient(name = "currency-exchange-service"), url = "localhost:8000")
@RibbonClient(name = "currency-exchange-service")
public interface CurrencyExchangeServiceProxy {

	@GetMapping("currency-exchange-service/currency-exchange/from/{from}/to/{to}")
	public CurrencyConvert retrieveExchnageRate(@PathVariable String from, @PathVariable String to);
}
