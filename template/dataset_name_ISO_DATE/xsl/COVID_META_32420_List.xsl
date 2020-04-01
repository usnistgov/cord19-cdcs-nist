<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <xsl:template match="/">
      <html>
         <body>
            <xsl:for-each select="root">
               <table>
   <xsl:choose>
      <xsl:when test="journal">
         <xsl:choose>
            <xsl:when test="journal != ''">
               <tr>
                  <th>
                     <B>journal: </B>
                  </th>
                  <td>
			  <xsl:value-of select="journal"/>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="authors">
         <xsl:choose>
            <xsl:when test="authors != ''">
               <tr>
                  <th>
                     <B>authors: </B>
                  </th>
                  <td>
			  <xsl:value-of select="authors"/>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="publish_time">
         <xsl:choose>
            <xsl:when test="publish_time != ''">
               <tr>
                  <th>
                     <B>publish_time: </B>
                  </th>
                  <td>
			  <xsl:value-of select="publish_time"/>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="has_full_text">
         <xsl:choose>
            <xsl:when test="has_full_text != ''">
               <tr>
                  <th>
                     <B>has_full_text: </B>
                  </th>
                  <td>
			  <xsl:value-of select="has_full_text"/>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
               </table>

            </xsl:for-each>
         </body>
      </html>
   </xsl:template>

</xsl:stylesheet>
