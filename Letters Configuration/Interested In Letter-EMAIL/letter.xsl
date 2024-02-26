<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>
<xsl:choose>
<xsl:when test="notification_data/receivers/receiver/user_email/email='reserve@brocku.ca'">
			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
					<p>Great news:</p>

<p>A new title has been added to Omni. You are receiving this message because you were identified as someone interested in accessing this particular item once it became available. </p>
<p><b>Please note:</b> The "View in Omni" link below becomes active within approximately fifteen minutes after the email is sent from the system. If you encounter an error, please give it a little more time and try again. </p>
				<br />
				<table cellspacing="0" cellpadding="5" border="0">
                                 <!-- commenting out order row
				<tr>
					<td>
				<br />
				@@orderNumber@@	:

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/line_number"/>

						<br />

					</td>
					</tr>
                                end commenting out order row -->
				<tr>
					<td>
				<br />
				@@title@@

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/title"/>

						<br />

					</td>
					</tr>
                                <!-- commenting out MMS ID row
				<tr>
					<td>
				<br />
				@@mmsId@@ :

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/mms_id"/>

						<br />

					</td>
					</tr>
                                       end of commenting out MMS ID row -->
					<tr>
					<td>
				<br />
				@@callNumber@@	:

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/poline_inventory/call_number"/>

						<br />

					</td>
					</tr>
				<tr>
					<td>
				<br />
				@@receivingNote@@ :

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/receiving_note"/>
						<br />

					</td>
				</tr>
                                        <!-- commenting out message row
					<tr>
					<td>
				<br />
				@@message@@	:

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/message"/>

						<br />

					</td>
					</tr>
                                        end commenting out message row -->

                                <!-- adding new row to include link -->
                                <tr>
					<td>
				<br />
				Link :

						<br />

					</td>
						<td>
				<br />
                                 <a><xsl:attribute name="href">
                                 https://ocul-bu.primo.exlibrisgroup.com/permalink/01OCUL_BU/331q1k/alma<xsl:value-of select="notification_data/mms_id"/>
                                 </xsl:attribute>
                                 View in Omni
                                 </a> 

						<br />

					</td>
					</tr>
                                <!-- end of link row -->
				</table>
				<br />
				<table>
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
				</table>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
</xsl:when>
<xsl:otherwise>
			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
					<p>Great news:</p>

<p>A new title has been added to Omni. You are receiving this message because you were identified as someone interested in accessing this particular item once it became available. </p>
<p><b>Please note:</b> The "View in Omni" link below becomes active within approximately fifteen minutes after the email is sent from the system. If you encounter an error, please give it a little more time and try again. </p>
				<br />
				<table cellspacing="0" cellpadding="5" border="0">
                                 <!-- commenting out order row
				<tr>
					<td>
				<br />
				@@orderNumber@@	:

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/line_number"/>

						<br />

					</td>
					</tr>
                                end commenting out order row -->
				<tr>
					<td>
				<br />
				@@title@@ :

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/title"/>

						<br />

					</td>
					</tr>
                                <!-- commenting out MMS ID row
				<tr>
					<td>
				<br />
				@@mmsId@@ :

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/mms_id"/>

						<br />

					</td>
					</tr>
                                       end of commenting out MMS ID row -->
					<tr>
					<td>
				<br />
				@@callNumber@@	:

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/poline_inventory/call_number"/>

						<br />

					</td>
					</tr>
					<tr>
					<td>
				<br />
				@@message@@	:

						<br />

					</td>
						<td>
				<br />
				<xsl:value-of  select="notification_data/message"/>

						<br />

					</td>
					</tr>
                                <!-- adding new row to include link -->
                                <tr>
					<td>
				<br />
				Link :

						<br />

					</td>
						<td>
				<br />
                                 <a><xsl:attribute name="href">
                                 https://ocul-bu.primo.exlibrisgroup.com/permalink/01OCUL_BU/331q1k/alma<xsl:value-of select="notification_data/mms_id"/>
                                 </xsl:attribute>
                                 View in Omni
                                 </a> 

						<br />

					</td>
					</tr>
                                <!-- end of link row -->
				</table>
				<br />
				<table>
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
				</table>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
</xsl:otherwise>
</xsl:choose>
	</html>
</xsl:template>

</xsl:stylesheet>