<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
<xsl:choose>
<!-- ASK US DESK START -->
<xsl:when test="/notification_data/circ_desk_name='Ask Us Desk'">
<body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<br />
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
		<div class="messageArea">
        <div class="messageBody">
        	<table cellspacing="0" cellpadding="1" border="0">
			<tr>
				<td>
<b>Note: New contactless pickup process in place. </b><br/><br/>
					<h>@@inform_loaned_items@@ James A. Gibson Library</h><p><u>Your books will be held for two weeks from today's date.</u> If they have not been picked up at that time, they will be removed from your account and returned to the shelves.</p>
<!-- If you want to make changes to the information for pick up, edit the lines below. For adding more points please either copy the li tag and paste it where you want the extra bullet. If you want to change the pickup hours font size, change the h2 tags to p tags, like the one above it. -->
                                        <p>It is essential that you review the below information before coming to pick up your books.</p> 
                                        <h2><a href="https://brocku.ca/library/use/hours/">Pickup Hours: Wednesday 10am-2pm</a></h2>
                                        <ul>
<li>Before arriving on campus, you must complete the Self-Screen Survey. Access the survey:</li>
<ul>
<li>On the web: <a href="https://brocku.ca/coronavirus/survey">https://brocku.ca/coronavirus/survey</a></li>
<li>On your phone using the <a href="https://brocku.ca/apps/">Brock Safety app</a></li>
</ul>						<li>Enter campus via the Rankin Family Pavilion. You will require your Brock ID and undergo screening by Campus Security.</li>
<li><b>Call library staff to let us know you have arrived: 905-688-5550 ×4583 </b></li>
<li><b>Wait at the Book Pickup Point, just to the left of the library doors in the RFP lobby. </b></li>
<li><b>Wearing a mask or face covering is required</b> as per <a href="https://brocku.ca/brock-news/2020/06/coming-onto-campus-face-coverings-now-required/">Brock's campus-wide policy</a></li>
<li>Please use the floor markings in order to maintain 6ft distance from fellow patrons and library staff.</li>
						<li>For more details and FAQ, <a href="https://brocku.ca/library/use/library-resources-services-amid-covid-19/#1594238235224-d9c38ab5-82f9/">visit Library Resources and Services Amid COVID-19.</a></li>
					</ul>
<!-- End of changes to pickup information -->
				</td>
				</tr>

				<tr>
              	<td>
					<b>@@loans@@</b>
                </td>
              	</tr>

              	<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
					<tr>
						<td>
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
								</xsl:attribute>
								<tr align="center" bgcolor="#f5f5f5">
									<td colspan="6">
										<h3><xsl:value-of select="organization_unit/name" /></h3>
									</td>
								</tr>
								<tr>
									<th>@@title@@</th>
									<th>@@author@@</th>
									<th>@@loan_date@@</th>
									<th>@@due_date@@</th>
									<th>@@library@@</th>
									<th>@@description@@</th>
								</tr>

								<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
									<tr>
										<td><xsl:value-of select="title"/></td>
										<td><xsl:value-of select="author"/></td>
										<td><xsl:value-of select="loan_date"/></td>
										<td><xsl:value-of select="new_due_date_str"/></td>
										<td><xsl:value-of select="library_name"/></td>
										<td><xsl:value-of select="description"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<hr/><br/>
				</xsl:for-each>
				<br />
				<br />
			</table>

			<table>
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

	  		</div>
        </div>
        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" /> <xsl:call-template name="myAccount" /> 
      </body>
		</xsl:when>
<!-- END ASK US DESK -->
<!-- IRC SC START -->
<xsl:when test="/notification_data/circ_desk_name='IRC Desk'">
<body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<br />
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
		<div class="messageArea">
        <div class="messageBody">
<table cellspacing="0" cellpadding="3" border="0">
			<tr>
				<td>
					<h>@@inform_loaned_items@@ James A. Gibson Library</h><p><u>Your books will be held for two weeks from today's date.</u> If they have not been picked up at that time, they will be removed from your account and returned to the shelves.</p>
<!-- If you want to make changes to the information for pick up, edit the lines below. For adding more points please either copy the li tag and paste it where you want the extra bullet. If you want to change the pickup hours font size, change the h2 tags to p tags, like the one above it. -->
                                        <p>It is essential that you review the below information before coming to pick up your books.</p> 
                                        <h2><a href="https://brocku.ca/library/use/hours/">Pickup Hours: Wednesday 10am-2pm</a></h2>
                                        <ul>
<li>Before arriving on campus, you must complete the Self-Screen Survey. Access the survey:</li>
<ul>
<li>On the web: <a href="https://brocku.ca/coronavirus/survey">https://brocku.ca/coronavirus/survey</a></li>
<li>On your phone using the <a href="https://brocku.ca/apps/">Brock Safety app</a></li>
</ul>						<li>Enter campus via the Rankin Family Pavilion. You will require your Brock ID and undergo screening by Campus Security.</li>
<li><b>Call library staff to let us know you have arrived: 905-688-5550 ×4583 </b></li>
<li><b>Wait at the Book Pickup Point, just to the left of the library doors in the RFP lobby. </b></li>
<li><b>Wearing a mask or face covering is required</b> as per <a href="https://brocku.ca/brock-news/2020/06/coming-onto-campus-face-coverings-now-required/">Brock's campus-wide policy</a></li>
<li>Please use the floor markings in order to maintain 6ft distance from fellow patrons and library staff.</li>
						<li>For more details and FAQ, <a href="https://brocku.ca/library/use/library-resources-services-amid-covid-19/#1594238235224-d9c38ab5-82f9/">visit Library Resources and Services Amid COVID-19.</a></li>i>
<li>For more information visit the Instructional Resource Centre (IRC):  <a href="https://brocku.ca/education/student-resources/irc/ ">https://brocku.ca/education/student-resources/irc/</a></li>		
					</ul>
<!-- End of changes to pickup information -->
				</td>
				</tr>

				<tr>
              	<td>
					<b>@@loans@@</b>
                </td>
              	</tr>

              	<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
					<tr>
						<td>
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
								</xsl:attribute>
								<tr align="center" bgcolor="#f5f5f5">
									<td colspan="6">
										<h3><xsl:value-of select="organization_unit/name" /></h3>
									</td>
								</tr>
								<tr>
									<th>@@title@@</th>
									<th>@@author@@</th>
									<th>@@loan_date@@</th>
									<th>@@due_date@@</th>
									<th>@@library@@</th>
									<th>@@description@@</th>
								</tr>

								<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
									<tr>
										<td><xsl:value-of select="title"/></td>
										<td><xsl:value-of select="author"/></td>
										<td><xsl:value-of select="loan_date"/></td>
										<td><xsl:value-of select="new_due_date_str"/></td>
										<td><xsl:value-of select="library_name"/></td>
										<td><xsl:value-of select="description"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<hr/><br/>
				</xsl:for-each>
				<br />
				<br />
			</table>

			<table>
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

	  		</div>
        </div>
        <!-- footer.xsl -->
        <p>If you have questions or need assistance, please contact us at: kpelchat@brocku.ca</p><xsl:call-template name="myAccount" /> 
      </body>
	</xsl:when>
<!-- IRC SC END -->
<!-- IRC HAM START -->
<xsl:when test="/notification_data/circ_desk_name='Burlington Desk'">
<body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<br />
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
		<div class="messageArea">
        <div class="messageBody">


        	<table cellspacing="0" cellpadding="5" border="0">
				<tr>
				<td>
					<h>@@inform_loaned_items@@ Instructional Resource Center, Burlington Campus</h>
					<p><u>Note: Your books will be held for two weeks from today's date.</u> If they have not been picked up at that time, they will be removed from your account and returned to the shelves.</p>
<!-- If you want to make changes to the information for pick up, edit the lines below. For adding more points please either copy the li tag and paste it where you want the extra bullet. If you want to change the pickup hours font size, change the h2 tags to p tags, like the one above it. -->
                    <p>It is essential that you review the below information before coming to pick up your books.</p> 
                        <h2>Pickup Hours: Mondays &#38; Wednesdays 10am-12pm</h2>
                    <ul>
		 <li>Enter the campus via the East side entrance. You will require your Brock ID and undergo screening by Campus Security</li>
						<li><b><u>Wearing a mask or face covering is required</u></b> as per <a href="https://brocku.ca/brock-news/2020/06/coming-onto-campus-face-coverings-now-required/">Brock's campus-wide policy</a></li>
						<li>Please use the floor markings in order to maintain 6ft distance from fellow patrons and library staff.</li>
						<li>For more information visit the Instructional Resource Centre (IRC):  <a href="https://brocku.ca/education/student-resources/irc/ ">https://brocku.ca/education/student-resources/irc/</a></li>
						
					</ul>
<!-- End of changes to pickup information -->
				</td>
				</tr>

				<tr>
              	<td>
					<b>@@loans@@</b>
                </td>
              	</tr>

              	<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
					<tr>
						<td>
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
								</xsl:attribute>
								<tr align="center" bgcolor="#f5f5f5">
									<td colspan="6">
										<h3><xsl:value-of select="organization_unit/name" /></h3>
									</td>
								</tr>
								<tr>
									<th>@@title@@</th>
									<th>@@author@@</th>
									<th>@@loan_date@@</th>
									<th>@@due_date@@</th>
									<th>@@library@@</th>
									<th>@@description@@</th>
								</tr>

								<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
									<tr>
										<td><xsl:value-of select="title"/></td>
										<td><xsl:value-of select="author"/></td>
										<td><xsl:value-of select="loan_date"/></td>
										<td><xsl:value-of select="new_due_date_str"/></td>
										<td><xsl:value-of select="library_name"/></td>
										<td><xsl:value-of select="description"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<hr/><br/>
				</xsl:for-each>
				<br />
				<br />
			</table>

			<table>
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

	  		</div>
        </div>
        <!-- footer.xsl -->
        <p>If you have questions or need assistance, please contact us: swelbourn@brocku.ca</p> <xsl:call-template name="myAccount" /> 
      </body>
</xsl:when> 
<!-- END HAM DESK -->
<!-- MDGL DESK START -->
<xsl:when test="/notification_data/circ_desk_name='MDGL Desk'">
<body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<br />
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
		<div class="messageArea">
        <div class="messageBody">


        	<table cellspacing="0" cellpadding="5" border="0">
				<tr>
				<td>
					<h>The following items have been checked out to your account and are ready for pickup at <b><u>James A. Gibson Library</u></b></h>
					<p><u>Note: Your items will be held for two weeks from today's date.</u> If they have not been picked up at that time, they will be removed from your account and returned to the Map, Data &#38; GIS Library.</p>
<!-- If you want to make changes to the information for pick up, edit the lines below. For adding more points please either copy the li tag and paste it where you want the extra bullet. If you want to change the pickup hours font size, change the h2 tags to p tags, like the one above it. -->
                                        <p>It is essential that you review the below information before coming to pick up your books.</p> 
                                        <h2>Pickup Hours: Wednesday 10am-2pm</h2>
                                        <ul>
						<li>Enter campus via the Rankin Family Pavilion. You will require your Brock ID and undergo screening by Campus Security.</li>
						<li>Item pick-up is located at the library entrance in the Schmon Tower/ Rankin Family Pavilion.</li>
						<li><b><u>Wearing a mask or face covering is required</u></b> as per <a href="https://brocku.ca/brock-news/2020/06/coming-onto-campus-face-coverings-now-required/">Brock's campus-wide policy</a></li>
						<li>Please use the floor markings in order to maintain 6ft distance from fellow patrons and library staff.</li>
						<li>For more details and FAQ, <a href="https://brocku.ca/library/use/library-resources-services-amid-covid-19/#1594238235224-d9c38ab5-82f9/">visit Library Resources and Services Amid COVID-19.</a></li>
						<li>Questions regarding maps and atlases should be directed to maplib@brocku.ca</li>
						
					</ul>
<!-- End of changes to pickup information -->
				</td>
				</tr>

				<tr>
              	<td>
					<b>@@loans@@</b>
                </td>
              	</tr>

              	<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
					<tr>
						<td>
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
								</xsl:attribute>
								<tr align="center" bgcolor="#f5f5f5">
									<td colspan="6">
										<h3><xsl:value-of select="organization_unit/name" /></h3>
									</td>
								</tr>
								<tr>
									<th>@@title@@</th>
									<th>@@author@@</th>
									<th>@@loan_date@@</th>
									<th>@@due_date@@</th>
									<th>@@library@@</th>
									<th>@@description@@</th>
								</tr>

								<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
									<tr>
										<td><xsl:value-of select="title"/></td>
										<td><xsl:value-of select="author"/></td>
										<td><xsl:value-of select="loan_date"/></td>
										<td><xsl:value-of select="new_due_date_str"/></td>
										<td><xsl:value-of select="library_name"/></td>
										<td><xsl:value-of select="description"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<hr/><br/>
				</xsl:for-each>
				<br />
				<br />
			</table>

			<table>
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

	  		</div>
        </div>
        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" /> <xsl:call-template name="myAccount" /> 
      </body>
</xsl:when>
<!-- MDGL DESK END -->
	</xsl:choose>
    </html>
  </xsl:template>
</xsl:stylesheet>
