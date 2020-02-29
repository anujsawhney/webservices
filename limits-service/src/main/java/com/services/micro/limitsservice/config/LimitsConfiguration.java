package com.services.micro.limitsservice.config;

import org.springframework.stereotype.Component;

@Component
public class LimitsConfiguration {

	private int minimium;
	private int maximum;
	public LimitsConfiguration() {
		super();
	}
	public LimitsConfiguration(int minimium, int maximum) {
		super();
		this.minimium = minimium;
		this.maximum = maximum;
	}
	public int getMinimium() {
		return minimium;
	}
	public void setMinimium(int minimium) {
		this.minimium = minimium;
	}
	public int getMaximum() {
		return maximum;
	}
	public void setMaximum(int maximum) {
		this.maximum = maximum;
	}
}
