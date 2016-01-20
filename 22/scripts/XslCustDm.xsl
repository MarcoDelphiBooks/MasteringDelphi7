<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="DATAPACKET">
    <table border="1">
      <xsl:apply-templates select="METADATA/FIELDS"/>
      <xsl:apply-templates select="ROWDATA/ROW"/>
    </table>
  </xsl:template>

  <xsl:template match="FIELDS">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="FIELD">
    <th>
      <xsl:value-of select="@attrname"/>
    </th>
  </xsl:template>

  <xsl:template match="ROWDATA/ROW">
  <xsl:variable name="fieldDefs" select="//METADATA/FIELDS"/>
  <xsl:variable name="currentRow" select="current()"/>
  <tr>
    <xsl:for-each select="$fieldDefs/FIELD">
      <td>
         <xsl:value-of select="$currentRow/@*[name()=current()/@attrname]"/><br/>
      </td>
    </xsl:for-each>
  </tr>
  </xsl:template>

</xsl:stylesheet>

