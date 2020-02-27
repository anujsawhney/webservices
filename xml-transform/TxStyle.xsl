<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" indent="yes" />
	<xsl:template match="/">
		<TXLife xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:xsd="http://www.w3.org/2001/XMLSchema"
			xmlns:java="http://xml.apache.org/xslt/java">
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
					
					<xsl:for-each select="TXLife/TXLifeRequest/OLifE/Holding">
					<Holding id="{@id}">
						<HoldingTypeCode tc="{HoldingTypeCode/@tc}">
							<xsl:value-of select="HoldingTypeCode" />
						</HoldingTypeCode>
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
							<ProductCodeWMA><!-- changed object name here -->
								<xsl:choose>
									<xsl:when test="Policy/ProductCode = 10">
										INPUT VALUE HERE
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="Policy/ProductCode" />
									</xsl:otherwise>
								</xsl:choose>
								
							</ProductCodeWMA>
							<CarrierCode>
								<xsl:value-of select="Policy/CarrierCode" />
							</CarrierCode>
							<ReplacementType tc="{Policy/ReplacementType/@tc}">
								<xsl:value-of select="Policy/ReplacementType" />
							</ReplacementType>
							<PaymentAmt>
								<xsl:value-of select="Policy/PaymentAmt" />
							</PaymentAmt>
						</Policy>
						<Investment>
							<xsl:for-each select="Investment/SubAccount">
                    		<SubAccount id="{@id}">
                        		<ProductCode>
                        			<xsl:value-of select="ProductCode" />
                        		</ProductCode>
                        		<AllocPercent>
                        			<xsl:value-of select="AllocPercent" />
                        		</AllocPercent>
                    		</SubAccount>
                    		</xsl:for-each>
                    	</Investment>
					</Holding>
					</xsl:for-each>
				</OLifE>
			</TXLifeRequest>
		</TXLife>
	</xsl:template>
</xsl:stylesheet>