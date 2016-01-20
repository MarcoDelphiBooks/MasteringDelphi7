<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">

  <xsl:template match="/DATAPACKET">
    <HTML><BODY>

 	  <h1>Single Customer View</h1>
	  <table border="1" cellspacing="0" cellpadding="3">
              <xsl:apply-templates select="//ROW[@CustNo='1231']"/>
	  </table>	

<!--    <h1>Single Customer View (All customers)</h1>
    <xsl:apply-templates select="DATAPACKET/ROWDATA/ROW"/> -->

	</BODY></HTML>
  </xsl:template>

  
  <xsl:template match="ROW">
      <H1>Customer <xsl:value-of select="@Company"/></H1>
	  <h2>(Single Customer View)</h2>
      <p/>
        <form action="change" method="POST"> 
          <table>
		<tr><td>CustNo</td><td>
                <input type="text" name="CustNo">
                   <xsl:attribute name="value">
                     <xsl:value-of select="@CustNo"/>
                   </xsl:attribute>
                </input></td></tr>
		<tr><td>Address</td><td>
                <input type="text" name="Addr1">
                   <xsl:attribute name="value">
                     <xsl:value-of select="@Addr1"/>
                   </xsl:attribute>
                </input></td></tr>
		<tr><td>City</td><td>
                <input type="text" name="City">
                   <xsl:attribute name="value">
                     <xsl:value-of select="@City"/>
                   </xsl:attribute>
                </input></td></tr>
		<tr><td>State</td><td>
                <input type="text" name="State">
                   <xsl:attribute name="value">
                     <xsl:value-of select="@State"/>
                   </xsl:attribute>
                </input></td></tr>
		<tr><td>Country</td><td>
                <input type="text" name="Country">
                   <xsl:attribute name="value">
                     <xsl:value-of select="@Country"/>
                   </xsl:attribute>
                </input></td></tr>
    	</table>
        <input type="submit" value="Update"/>
    </form>
  </xsl:template>

</xsl:stylesheet>
