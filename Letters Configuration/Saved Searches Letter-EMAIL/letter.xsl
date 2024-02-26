<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	<xsl:include href="recordTitle.xsl" />

	<xsl:output method="html"/>
	<xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
			<xsl:attribute name="style">
			<xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
			</xsl:attribute>

			<table cellspacing="0" cellpadding="5" border="0">
				<xsl:attribute name="style">
					<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
				<!-- LOGO INSERT -->
				<tr>
					<xsl:attribute name="style">
						<xsl:call-template name="headerLogoStyleCss" /> <!-- style.xsl -->
					</xsl:attribute>
					<td colspan="2">
						<div id="mailHeader">
							<div id="logoContainer" class="alignLeft">
								<xsl:choose>
									<xsl:when test="(notification_data/user_for_printing/user_group = 'AFNUSER') or (notification_data/user/user_group = 'AFNUSER') or (notification_data/user_for_printing/user_group = 'TUGUSER') or (notification_data/user/user_group = 'TUGUSER')">				
										<img src="https://ocul-gue.primo.exlibrisgroup.com/discovery/custom/01OCUL_GUE-GUELPH/img/gue-omni-logo-black.svg" height="75" alt="logo"/>
									</xsl:when>
									<xsl:otherwise>
										<img src="cid:logo.jpg" alt="logo"/>
									</xsl:otherwise>				
								</xsl:choose>
							</div>
						</div>
					</td>
				</tr>
			<!-- END OF LOGO INSERT -->
				<tr>
					<xsl:for-each select="notification_data/general_data">
						<td>
							<h1><xsl:value-of select="letter_name"/></h1>
						</td>
						<td align="right">
							<xsl:value-of select="current_date"/>
						</td>
					</xsl:for-each>
				</tr>
			</table>
			
			<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
			<br />
			<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


			<div class="messageArea">
				<div class="messageBody">
					<table cellpadding="0" cellspacing="0" style="margin: auto;">	
						<tr>
							<td style="padding: 0 15px;">
								<h2 style="font-weight: 600; margin: 30px 0 0 0;">
									<xsl:value-of select="/notification_data/alert_title"/>
								</h2>
								<h3 style="font-size: 1rem; font-weight: normal; margin: 5px 0 5px 0;">
									<xsl:value-of select="/notification_data/alert_heading"/>
									<a style="font-style: italic; text-decoration: none; color: darkred; ">
										<xsl:attribute name="href">
											<xsl:value-of select="/notification_data/link/node()"/>
										</xsl:attribute>
										<xsl:value-of select="/notification_data/search_query"/>
									</a>
								</h3>
							</td>
						</tr>
						<tr>
							<td style="padding: 0 0 0 15px; font-style: italic;">
								<h3 style="font-size: 15px; margin: 0; font-weight: normal;  margin: 0  0 20px 0;">
									<xsl:value-of select="/notification_data/alert_subtitle"/>
								</h3>
							</td>
						</tr>
						<tr>
							<td style="padding: 0 0 0 15px 0;">
								<table style="width: 100%">
									<xsl:for-each select="/notification_data/items/saved_searches_letter_item">
										<tr style="background-color: #fff; text-decoration: none;">
											<td style="padding: 15px 15px; position: relative;">
												<span style="text-transform: uppercase; font-size: .75rem; font-weight: 600; color: #6d6d6d">
													<xsl:value-of select="type" disable-output-escaping="yes"/>
												</span>
												<br/>
												<a style="display: block; margin: 5px 0; font-size: 1rem; text-decoration: none; color: darkred; font-weight: 600;">
													<xsl:attribute name="href">
														<xsl:value-of select="url" disable-output-escaping="yes"/>
													</xsl:attribute>
													<xsl:value-of select="title" disable-output-escaping="yes"/>
												</a>
												<span style="color: #3a3a3a; font-weight: 400; font-size: .65rem;">
													<xsl:value-of select="creator" disable-output-escaping="yes"/>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
						<tr>
							<td style="background-color: darkred; text-align:center; padding: 15px">
									<a style="color: #fff">
										<xsl:attribute name="href">
											<xsl:value-of select="/notification_data/alert_unsubscribe_link/node()"/>
										</xsl:attribute>
										<xsl:value-of select="/notification_data/alert_unsubscribe"/>
									</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>