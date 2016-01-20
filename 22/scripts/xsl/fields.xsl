<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
  <xsl:template match="/DATAPACKET">
    <HTML><BODY>
      <H1>Fields List</H1>
      <ul>
   	    <xsl:for-each select="/DATAPACKET/METADATA/FIELDS">
	      <xsl:apply-templates select="FIELD"/>
 	    </xsl:for-each>
	</ul>  
      </BODY>
    </HTML>
  </xsl:template>

  <xsl:template match="FIELD">
    <li><xsl:value-of select="@attrname"/> (<xsl:value-of select="@fieldtype"/>
	  <xsl:if test="@WIDTH"> - width: <xsl:value-of select="@WIDTH"/></xsl:if>)
	</li>  
  </xsl:template>

</xsl:stylesheet>
