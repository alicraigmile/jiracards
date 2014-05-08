<?xml version="1.0" encoding="UTF-8"?>

  <xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

    <xsl:template match="/">
    <fo:root>

<fo:layout-master-set>
  <fo:simple-page-master master-name="A4" page-width="210mm"
page-height="297mm" margin-top="1cm" margin-bottom="1cm"
margin-left="1cm" margin-right="1cm">
  <fo:region-body margin="0cm"/>
  <fo:region-before extent="0cm"/>
  <fo:region-after extent="0cm"/>
  <fo:region-start extent="0cm"/>
  <fo:region-end extent="0cm"/>
  </fo:simple-page-master>
</fo:layout-master-set>

<fo:page-sequence master-reference="A4">
<fo:static-content flow-name="xsl-region-after">
  <fo:block text-align-last="center" font-size="10pt">
    <fo:page-number/>
  </fo:block>
</fo:static-content>
<fo:flow flow-name="xsl-region-body">
  <!--
    <fo:block font-size="48pt">Jira cards</fo:block>
    <fo:block font-size="12pt" font-family="sans-serif">
        A sample set of jira cards printed out.
      </fo:block>
      -->

      <xsl:for-each select="/cards/card">
 <fo:block-container width="110mm" page-break-inside="avoid">
    <fo:block margin-top="15mm" padding="5mm" border="solid 0.5mm black" background-color="#ff9900">
      <fo:block-container line-height="2">
        <fo:block font-weight="bold" margin-right="25mm">
          <xsl:choose>
            <xsl:when test="type = 'epic'">
              <fo:external-graphic src="url('icons/film.png')" vertical-align="middle" padding-right="5px"/>
            </xsl:when>
            <xsl:when test="type = 'story'">
              <fo:external-graphic src="url('icons/book.png')" vertical-align="middle" padding-right="5px"/>
            </xsl:when>
            <xsl:when test="type = 'bug'">
              <fo:external-graphic src="url('icons/bug.gif')" vertical-align="middle" padding-right="5px"/>
            </xsl:when>
          </xsl:choose>
          <xsl:value-of select="title" />
        </fo:block>
        <fo:block-container position="absolute" right="0mm" top="-5mm" width="20mm">
          <fo:block font-size="8pt" text-align="center">
            <fo:basic-link 
              external-destination="url('{link}')" 
                      color="black" text-decoration="underline">
                              <xsl:value-of select="ticket" />
                              </fo:basic-link>
                            </fo:block>
        </fo:block-container>
        <fo:block-container position="absolute" right="0mm" width="20mm" line-height="2">
          <fo:block border="solid 0.5mm black" background-color="white" text-align="center" >
            <xsl:choose>
              <xsl:when test="story-points">
                <xsl:value-of select="story-points" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>-</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </fo:block>
        </fo:block-container>
      </fo:block-container>
    </fo:block>
    <fo:block padding="5mm" border="solid 0.5mm black" line-height="2"  border-top-width="0mm" >
      <fo:block-container height="35mm">
        <fo:block><fo:inline color="#aaaaaa">As a</fo:inline><xsl:text> </xsl:text><xsl:value-of select="as_a" /></fo:block>
        <fo:block><fo:inline color="#aaaaaa">I want</fo:inline><xsl:text> </xsl:text><xsl:value-of select="i_want" /></fo:block>
        <fo:block><fo:inline color="#aaaaaa">So that</fo:inline><xsl:text> </xsl:text><xsl:value-of select="so_that" /></fo:block>
      </fo:block-container>
    </fo:block>
  </fo:block-container>

      </xsl:for-each>

  </fo:flow>

</fo:page-sequence>


</fo:root>

</xsl:template>
</xsl:stylesheet>
