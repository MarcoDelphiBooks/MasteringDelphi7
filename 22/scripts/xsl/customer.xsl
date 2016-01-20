<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" version="1.0">
  <xsl:template match="/DATAPACKET">
    <HTML><BODY>
      <H1>Customers List</H1>
      <p/>
        <table border="1" cellspacing="0" cellpadding="3">
          <tr> 
  	    <xsl:for-each select="/DATAPACKET/METADATA/FIELDS">
	      <xsl:apply-templates select="FIELD"/>
	    </xsl:for-each>
          </tr>
          <xsl:for-each select="/DATAPACKET/ROWDATA">
	    <xsl:apply-templates select="ROW"/>
	  </xsl:for-each>
	</table>
      </BODY>
    </HTML>
  </xsl:template>

  <xsl:template match="FIELD">
    <th>
      <xsl:value-of select="@attrname"/>
    </th>
  </xsl:template>

  <xsl:template match="ROW">
    <tr valign="top">
      <td align="left"><xsl:value-of select="@CustNo"/></td>
      <td align="left"><xsl:value-of select="@Company"/></td>
      <td align="left"><xsl:value-of select="@Addr1"/></td>
      <td align="left"><xsl:value-of select="@Addr2"/></td>
      <td align="left"><xsl:value-of select="@City"/></td>
      <td align="left"><xsl:value-of select="@State"/></td>
      <td align="left"><xsl:value-of select="@Zip"/></td>
      <td align="left"><xsl:value-of select="@Country"/></td>
      <td align="left"><xsl:value-of select="@Phone"/></td>
      <td align="left"><xsl:value-of select="@Fax"/></td>
      <td align="left"><xsl:value-of select="@TaxRate"/></td>
      <td align="left"><xsl:value-of select="@Contact"/></td>
      <td align="left"><xsl:value-of select="@LastInvoiceDate"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
