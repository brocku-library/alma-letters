<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />
  <xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
  <xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head" />
        <!-- header.xsl -->
        <xsl:call-template name="senderReceiver" />
        <!-- SenderReceiver.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>@@your_request@@.</td>
              </tr>
              <tr> &#160;
                <td><b>@@title@@: <xsl:value-of select="notification_data/phys_item_display/title"/></b></td>
              </tr>&#160;
              <tr>
                <td>
                  <b>Chapter/Article Title: </b><xsl:value-of select="notification_data/request/chapter_article_title"/>
                </td>
              </tr>
              <tr>
                <td>
                  <b>Pages:</b><xsl:value-of select="notification_data/request/pages"/>
                </td>
              </tr>
              <tr>
                <td>@@to_see_the_resource@@</td>
              </tr>
              <tr>
                <td>@@for_saml_users@@<a><xsl:attribute name="href"><xsl:value-of select="notification_data/download_url_saml" /></xsl:attribute>@@click_here@@</a></td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td><p>Please note the following time constraints:</p>
                  <ul>
                    <li>The file can be downloaded a maximum of five (5) times. </li>
                    <li>Files remain available from the above link for thirty (30) days following the date of this notification. After 30 days, the file will be automatically removed from our servers.</li>
                  </ul>
                </td>
              </tr>
          	</table>
          </div>
        </div>
        <div>
        <p>BROCK UNIVERSITY INTERLIBRARY LOAN OR LOCAL DOCUMENT DELIVERY REQUEST</p>
        <p>The copyright material being provided to you by Brock University was made pursuant to the University’s <a href="https://brocku.ca/policies/wp-content/uploads/sites/94/Fair-Dealing-Policy.pdf">Fair Dealing Policy</a> and/or a licence granted by the copyright owner.</p>
        <p>
          The item may only be used for the purpose of research, private study, criticism, review, news reporting, education, satire, or parody. 
          If the copy is used for the purpose of review, criticism, or news reporting, the source and name of the authority must be mentioned. 
          The use of this item for any other purpose may require the consent of the copyright owner.
          You are responsible for ensuring any use beyond these uses is permissible under copyright law.
        </p>
        </div>
        <xsl:call-template name="lastiLLFooter" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
