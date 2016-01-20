<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">

  <xsl:template match="/DATAPACKET">
    <HTML><BODY>

 	  <h1>Single Customer View</h1>
	  <table border="1" cellspacing="0" cellpadding="3">
              <xsl:apply-templates select="//ROW[@CustNo='1231']"/>
	  </table>	

<!--    <h1>Single Customer View (All customers)</h1>
    <xsl:apply-templates select="/DATAPACKET/ROWDATA/ROW"/> -->

	</BODY></HTML>
  </xsl:template>

  
  <xsl:template match="ROW">
      <H1>Customer <xsl:value-of select="@Company"/></H1>
	  <h2>(Single Customer View)</h2>
      <p/>
        <table border="1" cellspacing="0" cellpadding="3">
		<tr><td>CustNo</td><td><xsl:value-of select="@CustNo"/></td></tr>
		<tr><td>Address</td><td><xsl:value-of select="@Addr1"/><br/>
		<xsl:value-of select="@Addr2"/></td></tr>
		<tr><td>City</td><td><xsl:value-of select="@City"/></td></tr>
		<tr><td>State</td><td><xsl:value-of select="@State"/></td></tr>
		<tr><td>Zip</td><td><xsl:value-of select="@Zip"/></td></tr>
		<tr><td>Country</td><td><xsl:value-of select="@Country"/></td></tr>
		<tr><td>Phone</td><td><xsl:value-of select="@Phone"/></td></tr>
		<tr><td>Fax</td><td><xsl:value-of select="@Fax"/></td></tr>
		<tr><td>TaxRate</td><td><xsl:value-of select="@TaxRate"/></td></tr>
		<tr><td>Contact</td><td><xsl:value-of select="@Contact"/></td></tr>
		<tr><td>LastInvoiceDate</td><td><xsl:value-of select="@LastInvoiceDate"/></td></tr>
    	</table>
  </xsl:template>

</xsl:stylesheet>
