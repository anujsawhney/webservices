package com.services.micro.limitsservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.services.micro.limitsservice.config.Configuration;
import com.services.micro.limitsservice.config.LimitsConfiguration;

@RestController
public class LimitsConfigurationController {

	@Autowired
	private Configuration config;
	
	@GetMapping("limits")
	public LimitsConfiguration configuration() {
		return new LimitsConfiguration(config.getMinimum(), config.getMaximum());
	}
}
