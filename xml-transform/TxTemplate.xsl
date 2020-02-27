<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" indent="yes" />
	<xsl:variable name="AppJurisdiction">
		<xsl:value-of
			select="TXLife/TXLifeRequest/OLifE/Holding/Policy/ApplicationInfo/ApplicationJurisdiction/@tc" />
	</xsl:variable>
	<xsl:template match="/">
		<TXLife xmlns="http://vantage">
			<TXLifeRequest>
				<TransRefGUID>
					<xsl:value-of
						select="TXLife/TXLifeRequest/TransRefGUID" />
				</TransRefGUID>
				<TransType tc="103">
					<xsl:value-of select="TXLife/TXLifeRequest/TransType" />
				</TransType>
				<TransExeDate>
					<xsl:value-of
						select="TXLife/TXLifeRequest/TransExeDate" />
				</TransExeDate>
				<TransExeTime>
					<xsl:value-of
						select="TXLife/TXLifeRequest/TransExeTime" />
				</TransExeTime>
				<TransMode tc="{TXLife/TXLifeRequest/TransMode/@tc}">
					<xsl:value-of select="TXLife/TXLifeRequest/TransMode" />
				</TransMode>

				<OLifE Version="{TXLife/TXLifeRequest/OLifE/@Version}">
					<SourceInfo>
						<SourceInfoName>
							<xsl:value-of
								select="TXLife/TXLifeRequest/OLifE/SourceInfo/SourceInfoName" />
						</SourceInfoName>
						<FileControlID>
							<xsl:value-of
								select="TXLife/TXLifeRequest/OLifE/SourceInfo/FileControlID" />
						</FileControlID>
					</SourceInfo>

					<xsl:for-each
						select="TXLife/TXLifeRequest/OLifE/Holding">
						<Holding id="{@id}">
							<HoldingTypeCode tc="{HoldingTypeCode/@tc}">
								<xsl:value-of select="HoldingTypeCode" />
							</HoldingTypeCode>
							<RestrictionCode tc="{RestrictionCode/@tc}">
								<xsl:value-of select="RestrictionCode" />
							</RestrictionCode>
							<Policy>
								<PolNumber>
									<xsl:value-of select="Policy/PolNumber" />
								</PolNumber>
								<LineOfBusiness tc="{Policy/LineOfBusiness/@tc}">
									<xsl:value-of select="Policy/LineOfBusiness" />
								</LineOfBusiness>
								<ProductType tc="{Policy/ProductType/@tc}">
									<xsl:value-of select="Policy/ProductType" />
								</ProductType>
								<ProductCode>
									<xsl:value-of select="Policy/ProductCode" />
								</ProductCode>
								<CarrierCode>
									<xsl:value-of select="Policy/CarrierCode" />
								</CarrierCode>
								<ReplacementType
									tc="{Policy/ReplacementType/@tc}">
									<xsl:value-of select="Policy/ReplacementType" />
								</ReplacementType>
								<PaymentAmt>
									<xsl:value-of select="Policy/PaymentAmt" />
								</PaymentAmt>
								<xsl:if test="Policy/LineOfBusiness = 'Life'">
									<Life>
										<QualPlanType tc="{Policy/Life/QualPlanType/@tc}">
											<xsl:value-of select="Policy/Life/QualPlanType" />
										</QualPlanType>
										<InitialPremAmt>
											<xsl:value-of
												select="Policy/Life/InitialPremAmt" />
										</InitialPremAmt>
										<FaceAmt>
											<xsl:value-of select="Policy/Life/FaceAmt" />
										</FaceAmt>
										<FaceUnits>
											<xsl:value-of select="Policy/Life/FaceUnits" />
										</FaceUnits>
										<Coverage id="{Policy/Life/Coverage/@id}">
											<CoverageKey>
												<xsl:value-of
													select="Policy/Life/Coverage/CoverageKey" />
											</CoverageKey>
											<ProductCode>
												<xsl:value-of
													select="Policy/Life/Coverage/ProductCode" />
											</ProductCode>
											<ProductVersionCode>
												<xsl:value-of
													select="Policy/Life/Coverage/ProductVersionCode" />
											</ProductVersionCode>
											<xsl:for-each
												select="Policy/Life/Coverage/CovOption">
												<CovOption id="{@id}">
													<CovOptionKey>
														<xsl:value-of select="CovOptionKey" />
													</CovOptionKey>
													<PlanName>
														<xsl:value-of select="PlanName" />
													</PlanName>
													
													<xsl:if test="$AppJurisdiction = 31">
														<ProductCode>
															<xsl:choose>
															
																<xsl:when test="ProductCode = 'TIR001'">TIRUNI</xsl:when>
																<xsl:when test="ProductCode = 'LTC001'">LTCUNI</xsl:when>
																<xsl:when test="ProductCode = 'EOB001'">EOBUNI</xsl:when>
																<xsl:when test="ProductCode = 'EOB002'">EBIUNI</xsl:when>
																<xsl:when test="ProductCode = 'EOB003'">EBVUNI</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="ProductCode" />
																</xsl:otherwise>
															</xsl:choose>
														</ProductCode>
													</xsl:if>
													<xsl:if test="$AppJurisdiction != 31">
														<ProductCode>															
															<xsl:value-of select="ProductCode" />																
														</ProductCode>
													</xsl:if>
													<CovOptionStatus tc="{CovOptionStatus/@tc}">
														<xsl:value-of select="CovOptionStatus" />
													</CovOptionStatus>
													<LifeCovOptTypeCode
														tc="{CovOptionStatus/@tc}">
														<xsl:value-of select="CovOptionStatus" />
													</LifeCovOptTypeCode>
													<TobaccoPremiumBasis
														tc="{TobaccoPremiumBasis/@tc}">
														<xsl:value-of select="TobaccoPremiumBasis" />
													</TobaccoPremiumBasis>
													<EffDate>
														<xsl:value-of select="EffDate" />
													</EffDate>
													<TermDate>
														<xsl:value-of select="TermDate" />
													</TermDate>
													<OLifEExtension
														ExtensionCode="{OLifEExtension/@ExtensionCode}"
														VendorCode="{OLifEExtension/@VendorCode}">
														<CovOptionExtension>
															<PayUpDate>
																<xsl:value-of
																	select="OLifEExtension/CovOptionExtension/PayUpDate" />
															</PayUpDate>
															<Duration>
																<xsl:value-of
																	select="OLifEExtension/CovOptionExtension/Duration" />
															</Duration>
														</CovOptionExtension>
													</OLifEExtension>
												</CovOption>
											</xsl:for-each>
										</Coverage>
									</Life>
								</xsl:if>
							</Policy>
						</Holding>
					</xsl:for-each>
				</OLifE>
			</TXLifeRequest>
		</TXLife>
	</xsl:template>
</xsl:stylesheet>