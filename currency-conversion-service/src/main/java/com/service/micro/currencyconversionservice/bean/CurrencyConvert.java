package com.service.micro.currencyconversionservice.bean;

import java.math.BigDecimal;

public class CurrencyConvert {
	
	private Long id;
	private String from;
	private String to;
	private BigDecimal quantity;
	private BigDecimal exchangeRate;
	private BigDecimal totalAmount;
	private String port;
	
	public CurrencyConvert() {
		super();
	}
	public CurrencyConvert(Long id, String from, String to, BigDecimal quantity, BigDecimal exchangeRate,
			BigDecimal totalAmount, String port) {
		super();
		this.id = id;
		this.from = from;
		this.to = to;
		this.quantity = quantity;
		this.exchangeRate = exchangeRate;
		this.totalAmount = totalAmount;
		this.port = port;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public BigDecimal getQuantity() {
		return quantity;
	}
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(BigDecimal exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public BigDecimal getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}

}
