<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"  
    xmlns:xsl="http://www.w3.org/TR/WD-xsl">
    
  <xsl:template match="/">

<html>
<head>
  <title>Books</title>
</head>

<body>

<h1>Books</h1>

<h2>All Authors</h2>
<ul>
  <xsl:for-each select="books//author">
    <li><xsl:value-of select="."/></li>
  </xsl:for-each>
</ul>

<h2>All Authors (template)</h2>
<ul>
  <xsl:for-each select="books//author">
    <xsl:apply-templates select="."/>
  </xsl:for-each>

</ul>

<h3>E-Authors</h3>
<ul>
  <xsl:for-each select="books/ebook/author">
    <li><xsl:value-of select="."/></li>
  </xsl:for-each>
</ul>

<hr/>

<h2>Printed Books</h2>
<ul>
  <xsl:for-each select="books/book">
    <li><xsl:value-of select="title"/></li>
  </xsl:for-each>
</ul>

<hr/>

<h3>Marco's books</h3>
<ul>
  <xsl:for-each select="books/book[author='Cantu']">
    <li><xsl:value-of select="title"/></li>
  </xsl:for-each>
</ul>

<h3>Marco's works (books + ebooks)</h3>
<ul>
  <xsl:for-each select="books/*[author = 'Cantu']">
    <li> <xsl:value-of select="title"/>
        <xsl:if test="url">
           (<a><xsl:attribute name="href"><xsl:value-of select="url"/>
               </xsl:attribute>Jump to document</a>)
        </xsl:if>
     </li>
  </xsl:for-each>
</ul>

<h3>Same effect</h3>
<ul>
  <xsl:for-each select="books/*">
     <li>
       <xsl:choose>
           <xsl:when test="url">
               <a><xsl:attribute name="href"><xsl:value-of select="url"/>
               </xsl:attribute><xsl:value-of select="title"/></a>
           </xsl:when>
           <xsl:otherwise>  
               <xsl:value-of select="title"/>
           </xsl:otherwise>
       </xsl:choose>
       (<xsl:value-of select="author"/>)
     </li>
  </xsl:for-each>
</ul>


</body>
</html>

</xsl:template>

<xsl:template match="author">
  <li><xsl:value-of select="."/></li>
</xsl:template>

</xsl:stylesheet> 