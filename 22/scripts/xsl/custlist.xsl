<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
  <xsl:template match="/DATAPACKET">
    <HTML><BODY>
      <h1>Customers List</h1>
        <ul>
         <xsl:for-each select="/DATAPACKET/ROWDATA">
  	      <xsl:apply-templates select="ROW"/>
	    </xsl:for-each>
        </ul>
      </BODY>
    </HTML>
  </xsl:template>

  <xsl:template match="ROW">
    <li><xsl:value-of select="@Company"/>

( 
<a><xsl:attribute name="href">show?style=single.xsl&amp;id=<xsl:value-of select="@CustNo"/></xsl:attribute>Show</a>
 - 
<a><xsl:attribute name="href">show?style=singleedit.xsl&amp;id=<xsl:value-of select="@CustNo"/></xsl:attribute>Edit</a>
 )

   </li>

  </xsl:template>
</xsl:stylesheet>
