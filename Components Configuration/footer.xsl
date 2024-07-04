<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="salutation">

</xsl:template>

<xsl:template name="lastFooter">
	<table> 
		<xsl:attribute name="style"> 
		<xsl:call-template name="footerTableStyleCss" />  
		</xsl:attribute> 
		<tr> 
			<p>If you have questions or need assistance, please contact us: <a href="mailto:libhelp@brocku.ca">libhelp@brocku.ca</a></p> 
		</tr> 
	</table>
</xsl:template>

<xsl:template name="lastiLLFooter">
	<table> 
		<xsl:attribute name="style"> 
		<xsl:call-template name="footerTableStyleCss" />  
		</xsl:attribute> 
		<tr> 
			<p>If you have questions or need assistance, please contact us: <a href="mailto:libhelp@brocku.ca">libill@brocku.ca</a></p> 
		</tr> 
	</table>
</xsl:template>

<xsl:template name="contactUs">
	<table align="left">
	<tr>
	<td align="left">
	<a>
                        <xsl:attribute name="href">
                          @@email_contact_us@@
                        </xsl:attribute>
						@@contact_us@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>

<xsl:template name="myAccount">
	<table align="left">
	<tr>
	<td align="left">

	<xsl:choose>
		<xsl:when test="notification_data/user_for_printing/user_group = 'TUGUSER' ">		
			Please check your Omni account for more information.
		</xsl:when>
		<xsl:when test="notification_data/user/user_group = 'TUGUSER' ">
			Please check your Omni account for more information.
		</xsl:when>
		<xsl:otherwise>			
			<a>
				<xsl:attribute name="href">
					@@email_my_account@@
				</xsl:attribute>
				@@my_account@@
			</a>
		</xsl:otherwise>
	</xsl:choose>	
	</td>
</tr>
	</table>
</xsl:template>

<!-- AFN CODE -->

<!-- create an OCUL AFN language specific variable for contact link text -->
<xsl:template name="afn_en_contact_us">
	If you have questions or need assistance, please contact us:
</xsl:template>

<xsl:template name="afn_fr_contact_us">
    <!-- AFN VERSION 1.6 changed some french text -->
    Si vous avez des questions, ou si vous avez besoin d’aide, veuillez nous contacter:
</xsl:template>

<xsl:variable name="is_afn_patron">
	<xsl:if test="(notification_data/user_for_printing/user_group = 'AFNUSER') or (notification_data/user/user_group = 'AFNUSER') or (notification_data/request/user_group = 'AFNUSER') or (notification_data/user_for_printing/user_group = 'TUGUSER') or (notification_data/user/user_group = 'TUGUSER') or (notification_data/request/user_group = 'TUGUSER')">	
		TRUE		
	</xsl:if>
</xsl:variable>

<!-- perform a test to see if the external id looks like OCUL alma codes 01OCUL_AU...just looking at format / first 2 digits 01OCUL 01UTON-->
<!-- normally in notification_data/receivers/receiver/user/external_id, but not always. Codes don't match, we'll show no home institution in AFN info -->
<xsl:variable name="test_external_id">
	<xsl:value-of select="notification_data/receivers/receiver/user/external_id"/>
</xsl:variable>

<xsl:variable name="external_id">
	<xsl:choose>
		<xsl:when test="(substring($test_external_id,1,2) = '01')">
			<xsl:value-of select="$test_external_id"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="notification_data/organization_unit/code"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:variable>

<xsl:variable name="is_preferred_lang_fr">
    <xsl:choose>
        <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'fr'">
            TRUE
        </xsl:when>
    </xsl:choose>
</xsl:variable>

<!-- create an OCUL AFN specific footer -->
<xsl:template name="AFNLastFooter">				
	<table> 
		<xsl:attribute name="style"> 
		<xsl:call-template name="footerTableStyleCss" />  
		</xsl:attribute> 
		<xsl:choose>
			<xsl:when test="(string-length($is_afn_patron) > 0)">
				<xsl:choose>	
					<!-- handle AFN supported languages -->
					<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">			
						<xsl:choose>
							<!-- AFN-VERSION 1.8 -->
							<xsl:when test="$external_id = '01OCUL_AU' ">
								<a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_BU' ">
								<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_CRL' ">
								<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_LHD' ">
								<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_LU' ">
								<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
							</xsl:when>			
							<xsl:when test="$external_id = '01OCUL_NIP' ">
								<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_IT' ">
								<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_QU' ">
								<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_TU' ">
								<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_GUE' ">
								<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_UO' ">
								<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_WTL' ">
								<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
							</xsl:when>
							<xsl:when test="$external_id = '01UTON_UW' ">
								<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_UWO' ">
								<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_WLU' ">
								<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_YOR' ">
								<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<!-- AFN-VERSION 1.7 ADD McMaster & OCADU -->
							<xsl:when test="$external_id = '01OCUL_MU' ">
								<a href="https://mcmaster.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_MU:OMNI&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_OCAD' ">
								<a href="https://ocadu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_OCAD:OMNI&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
							</xsl:when>
							<!-- END OF AFN-VERSION 1.7 ADD McMaster & OCADU -->
							<xsl:when test="$external_id = '01OCUL_TMU' ">
          							<a href="https://torontomu.primo.exlibrisgroup.com/discovery/search?vid=01OCUL_TMU:01OCUL_TMU&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
         						</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="afn_fr_visit_home_account_link_text" />
							</xsl:otherwise>
							<!-- END OF AFN-VERSION 1.8 -->		
						</xsl:choose>							
					</xsl:when>
					<!-- default AFN language is english -->
					<xsl:otherwise>						
						<xsl:choose>
							<!-- AFN-VERSION 1.8 -->
							<xsl:when test="$external_id = '01OCUL_AU' ">
								<a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>			
							<xsl:when test="$external_id = '01OCUL_BU' ">
								<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_CRL' ">
								<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_LHD' ">
								<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_LU' ">
								<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
							</xsl:when>			
							<xsl:when test="$external_id = '01OCUL_NIP' ">
								<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_IT' ">
								<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_QU' ">
								<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_TU' ">
								<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_GUE' ">
								<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>	
							<xsl:when test="$external_id = '01OCUL_UO' ">
								<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_WTL' ">
								<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
							</xsl:when>
							<xsl:when test="$external_id = '01UTON_UW' ">
								<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
							</xsl:when>		
							<xsl:when test="$external_id = '01OCUL_UWO' ">
								<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_WLU' ">
								<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_YOR' ">
								<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<!-- AFN-VERSION 1.7 ADD McMaster & OCADU -->
							<xsl:when test="$external_id = '01OCUL_MU' ">
								<a href="https://mcmaster.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_MU:OMNI&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<xsl:when test="$external_id = '01OCUL_OCAD' ">
								<a href="https://ocadu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_OCAD:OMNI&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
							</xsl:when>
							<!-- END OF AFN-VERSION 1.7 ADD McMaster & OCADU -->		
							<xsl:when test="$external_id = '01OCUL_TMU' ">
          							<a href="https://torontomu.primo.exlibrisgroup.com/discovery/search?vid=01OCUL_TMU:01OCUL_TMU&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
         						</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="afn_en_visit_home_account_link_text" />
							</xsl:otherwise>
							<!-- END OF AFN-VERSION 1.8 -->
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>					
			<xsl:otherwise>
				<tr>
					<!-- AFN TODO -->
					<p>If you have questions or need assistance, please contact us: <a href="mailto:libhelp@brocku.ca"> libhelp@brocku.ca </a></p> <!-- | 905-688-5550 x4583 | STC IRC x3357 | HAM IRC x3602 </p> -->
					<!-- END OF AFN TODO -->
				</tr>
			</xsl:otherwise>				
		</xsl:choose>		
	</table>
</xsl:template>

<!-- create an OCUL AFN language specific variable for visiting Omni account link text -->
<xsl:template name="afn_en_visit_home_account_link_text">
	Visit Omni at your home institution
</xsl:template>

<xsl:template name="afn_fr_visit_home_account_link_text">
	Visitez Omni de votre institution d'origine
</xsl:template>

<xsl:template name="AFNVisitLoansLink">	

	<table align="left">
		<tr>
			<td align="left">
				<xsl:choose>
					<xsl:when test="(string-length($is_afn_patron) > 0)">
						<xsl:choose>
							<!-- handle AFN supported languages-->
							<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
								<xsl:choose>
									<!-- AFN-VERSION 1.8 -->
									<xsl:when test="$external_id = '01OCUL_AU' ">
										<a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_BU' ">
										<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_CRL' ">
										<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LHD' ">
										<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LU' ">
										<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
									</xsl:when>			
									<xsl:when test="$external_id = '01OCUL_NIP' ">
										<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_IT' ">
										<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_QU' ">
										<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_TU' ">
										<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_GUE' ">
										<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UO' ">
										<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WTL' ">
										<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01UTON_UW' ">
										<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UWO' ">
										<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WLU' ">
										<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_YOR' ">
										<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
                                    <!-- AFN-VERSION 1.7 ADD McMaster & OCADU -->
                                    <xsl:when test="$external_id = '01OCUL_MU' ">
										<a href="https://mcmaster.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_MU:OMNI&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
                                    <xsl:when test="$external_id = '01OCUL_OCAD' ">
										<a href="https://ocadu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_OCAD:OMNI&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
									</xsl:when>
                                    <!-- END OF AFN-VERSION 1.7 ADD McMaster & OCADU -->		
									<xsl:when test="$external_id = '01OCUL_TMU' ">
          									<a href="https://torontomu.primo.exlibrisgroup.com/discovery/search?vid=01OCUL_TMU:01OCUL_TMU&amp;section=loans&amp;lang=fr"><xsl:call-template name="afn_fr_visit_home_account_link_text" /></a>
         								</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="afn_fr_visit_home_account_link_text" />
									</xsl:otherwise>
                                    <!-- END OF AFN-VERSION 1.8 -->									
								</xsl:choose>
							</xsl:when>
							<!-- default AFN language is english -->
							<xsl:otherwise>												
								<xsl:choose>
									<!-- AFN-VERSION 1.8 -->
									<xsl:when test="$external_id = '01OCUL_AU' ">
								        <a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>			
									<xsl:when test="$external_id = '01OCUL_BU' ">
										<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_CRL' ">
										<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LHD' ">
										<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LU' ">
										<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
									</xsl:when>			
									<xsl:when test="$external_id = '01OCUL_NIP' ">
										<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_IT' ">
										<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_QU' ">
										<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_TU' ">
										<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_GUE' ">
										<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>	
									<xsl:when test="$external_id = '01OCUL_UO' ">
										<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WTL' ">
										<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01UTON_UW' ">
										<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
									</xsl:when>		
									<xsl:when test="$external_id = '01OCUL_UWO' ">
										<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WLU' ">
										<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_YOR' ">
										<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
                                    <!-- AFN-VERSION 1.7 ADD McMaster & OCADU -->
                                    <xsl:when test="$external_id = '01OCUL_MU' ">
										<a href="https://mcmaster.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_MU:OMNI&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
                                    <xsl:when test="$external_id = '01OCUL_OCAD' ">
										<a href="https://ocadu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_OCAD:OMNI&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
									</xsl:when>
                                    <!-- END OF AFN-VERSION 1.7 ADD McMaster & OCADU -->		
									<xsl:when test="$external_id = '01OCUL_TMU' ">
          									<a href="https://torontomu.primo.exlibrisgroup.com/discovery/search?vid=01OCUL_TMU:01OCUL_TMU&amp;section=loans&amp;lang=en"><xsl:call-template name="afn_en_visit_home_account_link_text" /></a>
         								</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="afn_en_visit_home_account_link_text" />
									</xsl:otherwise>
                                    <!-- END OF AFN-VERSION 1.8 -->
								</xsl:choose>														
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>						
						<!-- AFN TODO -->
						<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;section=loan&amp;lang=en">Login to your library account</a>
						<!-- END OF AFN TODO -->
					</xsl:otherwise>
				</xsl:choose>	
			</td>
		</tr>
	</table>
</xsl:template>

<!-- create an OCUL AFN language specific variable for login to account link text -->
<xsl:template name="afn_en_account_link_text">
	Login to My Account
</xsl:template>

<xsl:template name="afn_fr_account_link_text">
	Connexion à mon compte
</xsl:template>

<xsl:template name="AFNAccount">	
	<table align="left">
		<tr>
			<td align="left">
				<xsl:choose>	
					<xsl:when test="(string-length($is_afn_patron) > 0)">
						<xsl:choose>
							<!-- handle AFN supported languages -->
							<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
								<xsl:choose>
									<xsl:when test="$external_id = '01OCUL_AU' ">
										<a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_BU' ">
										<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_CRL' ">
										<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LHD' ">
										<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LU' ">
										<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>						
									</xsl:when>			
									<xsl:when test="$external_id = '01OCUL_NIP' ">
										<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_IT' ">
										<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_QU' ">
										<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_TU' ">
										<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_GUE' ">
										<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UO' ">
										<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WTL' ">
										<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01UTON_UW' ">
										<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UWO' ">
										<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WLU' ">
										<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_YOR' ">
										<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
                                    <!-- AFN-VERSION 1.7 ADD McMaster & OCADU -->
                                    <xsl:when test="$external_id = '01OCUL_MU' ">
										<a href="https://mcmaster.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_MU:OMNI&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
                                    <xsl:when test="$external_id = '01OCUL_OCAD' ">
										<a href="https://ocadu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_OCAD:OMNI&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
									</xsl:when>
                                    <!-- END OF AFN-VERSION 1.7 ADD McMaster & OCADU -->		
									<xsl:when test="$external_id = '01OCUL_TMU' ">
          									<a href="https://torontomu.primo.exlibrisgroup.com/discovery/search?vid=01OCUL_TMU:01OCUL_TMU&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
         								</xsl:when>
								</xsl:choose>
							</xsl:when>
							<!-- default AFN language is english -->
							<xsl:otherwise>												
								<xsl:choose>
									<xsl:when test="$external_id = '01OCUL_AU' ">
										<a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>			
									<xsl:when test="$external_id = '01OCUL_BU' ">
										<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_CRL' ">
										<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LHD' ">
										<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LU' ">
										<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>						
									</xsl:when>			
									<xsl:when test="$external_id = '01OCUL_NIP' ">
										<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_IT' ">
										<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_QU' ">
										<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_TU' ">
										<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_GUE' ">
										<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>	
									<xsl:when test="$external_id = '01OCUL_UO' ">
										<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WTL' ">
										<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01UTON_UW' ">
										<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>						
									</xsl:when>		
									<xsl:when test="$external_id = '01OCUL_UWO' ">
										<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>						
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WLU' ">
										<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_YOR' ">
										<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
                                    <!-- AFN-VERSION 1.7 ADD McMaster & OCADU -->
                                    <xsl:when test="$external_id = '01OCUL_MU' ">
										<a href="https://mcmaster.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_MU:OMNI&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
                                    <xsl:when test="$external_id = '01OCUL_OCAD' ">
										<a href="https://ocadu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_OCAD:OMNI&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
									</xsl:when>
                                    <!-- END OF AFN-VERSION 1.7 ADD McMaster & OCADU -->
									<xsl:when test="$external_id = '01OCUL_TMU' ">
          									<a href="https://torontomu.primo.exlibrisgroup.com/discovery/search?vid=01OCUL_TMU:01OCUL_TMU&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
         								</xsl:when>
								</xsl:choose>															
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>						
						<!-- AFN TODO -->
						<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;lang=en">Login to your Library Account</a>
						<!-- END OF AFN TODO -->
					</xsl:otherwise>
				</xsl:choose>	
			</td>
		</tr>
	</table>
</xsl:template>

<!-- AFN-VERSION 1.4 ADD  AFNOrgName template and test_org_code var -->

<!-- create an OCUL AFN template for determining org name based on ex libris alma code -->
<!--
    test orginization code <path>01OCUL.01OCUL_GUE.mclaughlin</path> eg. 01OCUL_GUE is Guelph 
    with the code, we can create a human readable institution name that doesn't always appear in the
    data xml for a letter
-->
<xsl:variable name="test_org_code">
    <xsl:value-of select="notification_data/organization_unit/path"/>
</xsl:variable>

<xsl:template name="AFNOrgName">	
    <xsl:choose>
        <xsl:when test="contains($test_org_code, '01OCUL_AU')">
            Algoma University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_BU')">
            Brock University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_CRL')">
            Carleton University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_LHD')">
            Lakehead University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_LU')">
            Laurentian University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_NIP')">
            Nipissing University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_IT')">
            Ontario Tech
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_QU')">
            Queen's University
        </xsl:when>        
        <xsl:when test="contains($test_org_code, '01OCUL_GUE')">
            University of Guelph
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_TU')">
            Trent University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_UO')">
            University of Ottawa
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_WTL')">
            University of Waterloo
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01UTON_UW')">
            University of Windsor
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_UWO')">
            Western University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_WLU')">
            Wilfrid Laurier University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_YOR')">
            York University
        </xsl:when>
        <!-- AFN-VERSION 1.7 ADD McMaster & OCADU -->
        <xsl:when test="contains($test_org_code, '01OCUL_MU')">
            McMaster University
        </xsl:when>
        <xsl:when test="contains($test_org_code, '01OCUL_OCAD')">
            OCAD University
        </xsl:when>
        <!-- END OF AFN-VERSION 1.7 ADD McMaster & OCADU -->		
	<xsl:when test="contains($test_org_code, '01OCUL_TMU')">
	    Toronto Metropolitan University
	</xsl:when>
        <xsl:otherwise>
            <!-- AFN TODO -->
            <!-- your home institution -->
            Brock University
            <!-- END OF AFN TODO -->
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
<!-- END of Org name template -->

<!-- END OF AFN CODE -->

</xsl:stylesheet>
