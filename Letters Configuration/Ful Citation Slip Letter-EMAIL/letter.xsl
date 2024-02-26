<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="counter" select="0"/>


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<xsl:template match="/">
	<html>
		<xsl:if test="notification_data/languages/string">
			<xsl:attribute name="lang">
				<xsl:value-of select="notification_data/languages/string"/>
			</xsl:attribute>
		</xsl:if>

		<head>
			<title>
				<xsl:value-of select="notification_data/general_data/subject"/>
			</title>

			<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->



			<div class="messageArea">
				<div class="messageBody">
					 <table role='presentation'  cellspacing="0" cellpadding="5" border="0">

						<tr>
							<td>
								<strong>@@course_code@@: </strong>
								<xsl:value-of select="notification_data/course/code"/>
							</td>
						</tr>

						<tr>
							<td>
								<strong>@@course_name@@: </strong>
								<xsl:value-of select="notification_data/course/name"/>
							</td>
						</tr>

						<tr>
							<td>
								<strong>@@course_department@@: </strong>
								<xsl:value-of select="notification_data/department"/>
							</td>
						</tr>

						<tr>
							<td>
								<strong>@@reading_list_code@@: </strong>
								<xsl:value-of select="notification_data/reading_list/code"/>
							</td>
						</tr>

						<tr>
							<td>
								<strong>@@reading_list_name@@: </strong>
								<xsl:value-of select="notification_data/reading_list/name"/>
							</td>
						</tr>

						<xsl:if  test="notification_data/reading_list/assignee != ''" >
							<tr>
								<td>
									<strong>@@reading_list_assignee@@: </strong>
									<xsl:value-of select="notification_data/reading_list/assignee"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:for-each select="notification_data/items/physical_item_display_for_printing">
							<br></br>

							<tr>
							  <td><strong>@@item_barcode@@: </strong><img src="cid:{concat(concat('Barcode',position()),'.png')}" alt="{concat('Barcode',position())}" /></td>
							</tr>

							<tr>
								<td><xsl:value-of select="title"/></td>
							</tr>

							<tr>
								<td>
									<strong>@@library@@: </strong>
									<xsl:value-of select="library_name"/>
								</td>
							</tr>

							<tr>
								<td><strong>@@location@@: </strong><xsl:value-of select="location_name"/></td>
							</tr>

							<xsl:if  test="call_number" >
								<tr>
									<td><strong>@@call_number@@: </strong><xsl:value-of select="call_number"/></td>
								</tr>
							</xsl:if>

							<xsl:if  test="shelving_location/string" >
								<tr>
									<td><strong>@@shelving_location_for_item@@: </strong>
									 <xsl:for-each select="shelving_location/string">
										<xsl:value-of select="."/>
									 &#160;
									 </xsl:for-each>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
				</div>
			</div>




	<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->





</body>
</html>


	</xsl:template>
</xsl:stylesheet>