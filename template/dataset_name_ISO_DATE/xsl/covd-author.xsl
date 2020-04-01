<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="author">
  <html>
  <body>
		<table>

   <xsl:choose>
      <xsl:when test="name">
         <xsl:choose>
            <xsl:when test="name != ''">
               <tr>
                  <th>
                     <B>Author:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="name">
</xsl:value-of>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="pid">
         <xsl:choose>
            <xsl:when test="pid != ''">
               <tr>
                  <th>
                     <B>pid:
            </B>
                  </th>
                  <td>
                    <a href="{pid}"><xsl:value-of select="pid"/></a>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="email">
         <xsl:choose>
            <xsl:when test="email != ''">
               <tr>
                  <th>
                     <B>Email:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="email">
</xsl:value-of>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="affiliation">
         <xsl:choose>
            <xsl:when test="affiliation != ''">
               <tr>
                  <th>
                     <B>Affiliation:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="affiliation">
</xsl:value-of>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>

   <xsl:for-each select="papers/paper">                           
      <xsl:choose>
         <xsl:when test="name">
            <xsl:choose>
               <xsl:when test="name != ''">
                  <tr>
                     <th>
                        <B>Paper Title:
                        </B>
                     </th>
                     <td>
                      <B>  <xsl:value-of select="name">
                        </xsl:value-of></B>
                     </td>
                  </tr>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
      <xsl:choose>
         <xsl:when test="link">
            <xsl:choose>
               <xsl:when test="link != ''">
                  <tr>
                     <th>
                        <B>Paper Link:
                        </B>
                     </th>
                     <td>
                    <a href="{link}"><xsl:value-of select="link"/></a>
                     </td>
                  </tr>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
      
   </xsl:for-each>
        
		 </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
