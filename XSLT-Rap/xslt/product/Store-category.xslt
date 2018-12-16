<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <div class="category-filter ajaxfilterresponse">
      <div class="dropdown">

        <xsl:apply-templates select="/ProductFilter/Group"></xsl:apply-templates>
       
      </div>
    </div>
  </xsl:template>

  
  <xsl:template match="Group">   
    <xsl:if test="GroupId='6'">
        <div class="title">
          <p>
            <xsl:value-of select="/ProductFilter/SortByText"/>
          </p>
          <span class="mdi mdi-chevron-down"></span>
        </div>
        <div class="content">
          <ul>
              <xsl:apply-templates select="Option"></xsl:apply-templates>
          </ul>
        </div>
        </xsl:if>
  </xsl:template>

  <xsl:template match="Option" >
    <li>
        <xsl:if test="IsActive='true'">
          <xsl:attribute name="class">
            <xsl:text>active</xsl:text>
          </xsl:attribute>
        </xsl:if>
      <a class="ajaxlink">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>