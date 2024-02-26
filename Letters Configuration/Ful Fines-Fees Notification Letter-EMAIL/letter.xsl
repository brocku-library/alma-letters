<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<!-- START AFN-VERSION 1.8 -->
<!-- Check if an email partner. If it is, we're trying to send more of an invoice letter -->
<xsl:variable name="is_email_partner">
	<xsl:if test="(notification_data/user_for_printing/user_group = 'NZILLUSER') or (notification_data/user/user_group = 'NZILLUSER')">
		TRUE
	</xsl:if>
</xsl:variable>
<!-- END AFN-VERSION 1.8 -->

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->				
            
            <!-- START AFN-VERSION 1.8 -->
            <xsl:choose>
		        <xsl:when test="(string-length($is_email_partner) > 0)">
                    <!-- Omni Email Partner receipt -->
                    <!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
                    <xsl:choose>
                        <xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
                            <!-- Omni Email Partner receipt FRENCH-->
                            <p id="email_partner_count_summary_id" align="right">                
                                <!-- AFN TODO - those institutions who need to support french invoices, place here -->
                                <!-- since most institutions currently DO NOT have french invoices, we won't boiler plate -->
                            </p>
                        </xsl:when>
                        <xsl:otherwise>						
                            <!-- Omni Email Partner receipt ENGLISH-->
                            <p id="email_partner_count_summary_id" align="left">    
                                <b>
                                    Total Number of Requests: <xsl:value-of select="count(notification_data/fines_fees_list/*)"/>                                
                                </b>
                            </p>
                            <p id="email_partner_amount_summary_id" align="left">            
                                <b>        
                                    Total Amount Due: <xsl:value-of select="notification_data/total_fines_currency"/>&#160;<xsl:value-of select="notification_data/total_fines_amount"/>
                                </b>
                            </p>
                            <p id="email_partner_info_id" align="left">
                                <b>        
                                    Requesting Library: <xsl:value-of select="notification_data/user_for_printing/name"/>&#160;<xsl:value-of select="notification_data/user_for_printing/last_name"/>
                                </b>
                            </p>

                            <p id="email_partner_request_lib_id" align="left">
                                @@we_would_like@@ <xsl:call-template name="AFNOrgName" /> - <xsl:value-of select="notification_data/organization_unit/name"/> @@debt_of@@ <b><xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/total_fines_currency"/></b>
                            </p>                        
                        
                        <table cellpadding="4" class="listing">
                            <xsl:attribute name="style">
                                <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
                            </xsl:attribute>
                            <tr>
                                <th>@@fee_type@@</th>
                                <th>Shipped</th>
                                <th>Item</th>
                                <th>@@fee_amount@@</th>
                                                                
                            </tr>
                            <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                            <tr>
                                <td><xsl:value-of select="fine_fee_type_display"/></td>                                
                                <td><xsl:value-of select="create_date"/></td>
                                <td><xsl:value-of select="item_title"/></td>
                                <td><xsl:value-of select="fine_fee_ammount/normalized_sum"/></td>
                            </tr>
                            </xsl:for-each>

                        </table>
                        <br />                                                                       

                        </xsl:otherwise>
	                </xsl:choose>	
                </xsl:when>
                <xsl:otherwise>			
                    <!-- START AFN TODO EXISTING FINE format would go within this otherwise block, IF you've made changes you want to capture -->			
                    <!-- Fine/Fee Notification --> 

							<table cellspacing="0" cellpadding="5" border="0">
				<tr>
				    <td>
                        <h>This notice is to inform you that the below amount owing on your library account will be transferred to your Brock student account. 
                        This transfer occurs automatically on the 2nd of every month for all fines exceeding &#36;20. </h>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h><b>Refunds or reversals on charges transferred to your Brock student account cannot be applied directly and may take up to 3 weeks to process.</b></h>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h>Fines can then be paid using a variety of methods. More information: <a href="https://brocku.ca/safa/tuition-and-fees/making-a-payment/">https://brocku.ca/safa/tuition-and-fees/making-a-payment/</a></h>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h>Log in to <a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT">your Library Account</a> to view details about fines on your record.</h>
				    </td>
				</tr>
				</table>
				
                        <p id="patron_lending_lib_id" align="left">
                            @@we_would_like@@ <xsl:call-template name="AFNOrgName" /> - <xsl:value-of select="notification_data/organization_unit/name"/> @@debt_of@@ <b><xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/total_fines_currency"/></b>
                        </p>                                            
                        
                        <table cellpadding="4" class="listing">
                        <xsl:attribute name="style">
                            <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
                        </xsl:attribute>
                            <tr>
                                <th>@@fee_type@@</th>
                                <th>@@fee_amount@@</th>
                                <th>@@note@@</th>
                                <th>@@line1@@</th>
                            </tr>
                            <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                            <tr>
                                <td><xsl:value-of select="fine_fee_type_display"/></td>
                                <td><xsl:value-of select="fine_fee_ammount/normalized_sum"/></td>
                                <td><xsl:value-of select="fine_comment"/></td>
                                <td><xsl:value-of select="item_title"/></td>						
                            </tr>
                            </xsl:for-each>

                            <xsl:if test="notification_data/fine_fee_notification_fee_amount/sum !=''">
                                <tr>
                                    <td>
                                        <b>@@fine_fee_notification_fee@@ </b>
                                        <xsl:value-of select="notification_data/fine_fee_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
                                    </td>
                                </tr>
                            </xsl:if>

                        </table>
                        <!-- END AFN TODO EXISTING FINE format would go within this otherwise block, IF you've made changes you want to capture -->			
                        
                        <xsl:choose>
                            <xsl:when test="(string-length($is_afn_patron) > 0)">
                                <xsl:choose>	
                                    <!-- handle AFN supported languages -->
                                    <xsl:when test="(string-length($is_preferred_lang_fr) > 0)">			
                                        <!-- Message for AFN Patron FRENCH-->	
                                        <p id="patron_afn_payment_id" align="left">
                                            Les options de paiement varient dans chaque bibliothèque Omni. Veuillez contacter votre bibliothèque d'origine pour plus de détails sur la façon de payer votre amende.
                                        </p>
                                    </xsl:when>
                                    <xsl:otherwise>					
                                        <!-- Message for AFN Patron -->	
                                        <p id="patron_afn_payment_id" align="left">
                                            Payment options vary at each Omni library. Please contact your home library for details about how to pay your fine.
                                        </p>
                                    </xsl:otherwise>
                                </xsl:choose>                                
                            </xsl:when>
                            <xsl:otherwise>		
                                <!-- START AFN TODO review -->
                                <!-- standard patron footer for home Institution -->	
                                <p id="patron_settle_id" align="left">
                                    <b>@@please_settle@@</b>
                                </p>                        
                            <!-- END AFN TODO -->

                            </xsl:otherwise>
                        </xsl:choose>	                                                              
                        
                        <!-- AFN TODO some AFN schools may want these                
                        <table>
                                <tr><td>@@sincerely@@</td></tr>
                                <tr><td>@@department@@</td></tr>
                        </table>                        
                        -->
                        
                </xsl:otherwise>
	        </xsl:choose>					
            
            <xsl:choose>
		        <xsl:when test="(string-length($is_email_partner) > 0)">
                <!-- START AFN EXAMPLE  Enter your institutions financial contact info                    
                    <p id="email_partner_financial_contact">
                        Our ILL Responder #: XXXX<br/>
                        (Please quote this number on your remittance)<br/><br/>
                        Please direct inquiries about this invoice to:<br/><br/>

                        YOUR IZ CONTACT - REPLACE THIS<br/>
                        Phone number: xxx-xxx-xxx ext. xxxxx <br/>
                        Fax number: xxx-xxx-xxx <br/>
                        Email: some_account@institution_.ca <br/>
                        Library Code: XXXXX<br/>
                    </p>
                    END AFN EXAMPLE -->                    

                    <!-- START AFN TODO Enter your institutions financial contact info -->
                    <!-- email partner footer -->
                    <p id="email_partner_financial_contact">
                        Please direct inquiries about this invoice to:<br/><br/>

						Interlibrary Loans<br/>
						James A. Gibson Library<br/>
						1812 Sir Isaac Brock Way<br/>
						St. Catharines, ON, L2S 3A1<br/>
                        Phone number: 905-688-5550  ext. 4583<br/>
                        Email: libhelp@brocku.ca<br/>
                        Library Code: OSTCB<br/>
                    </p>
                    <p id="email_partner_payment_options_intro">
                        <b>Possible Payment Options:</b><br/>
                    </p>
                    <ol id="email_partner_payment_options">
                        <li>Payment by cheque Make cheque payable to:</li>
                        <ul class="afn_letter_plain_list">
                            <li>Brock University</li>
                            <li>James A. Gibson Library  - ILL</li>
                            <li>1812 Sir Isaac Brock Way</li>
                            <li>St. Catharines, ON, L2S 3A1</li>
                        </ul>
                    </ol>
                    <!-- END AFN TODO Enter your institutions financial contact info -->                    
                </xsl:when>
                <xsl:otherwise>					
                    <!-- standard patron footer -->	
                    <xsl:call-template name="AFNLastFooter" />
                    <xsl:call-template name="AFNAccount" />
                </xsl:otherwise>
	        </xsl:choose>	
            <!-- END AFN-VERSION 1.8 -->
			
            </body>            
	</html>
</xsl:template>

</xsl:stylesheet>