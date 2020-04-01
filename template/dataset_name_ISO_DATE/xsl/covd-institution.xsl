<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="institution">
  <html>
  <body>
<table>
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
   <xsl:choose>
      <xsl:when test="name">
         <xsl:choose>
            <xsl:when test="name != ''">
               <tr>
                  <th>
                     <B>Institution:
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
                     <xsl:value-of select="pid">
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
      <xsl:when test="address/addrLine">
         <xsl:choose>
            <xsl:when test="address/addrLine != ''">
               <tr>
                  <th>
                     <B>Address:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="address/addrLine">
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
      <xsl:when test="address/postCode">
         <xsl:choose>
            <xsl:when test="address/postCode != ''">
               <tr>
                  <th>
                     <B>PostCode:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="address/postCode">
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
      <xsl:when test="address/settlement">
         <xsl:choose>
            <xsl:when test="address/settlement != ''">
               <tr>
                  <th>
                     <B>City/Settlement:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="address/settlement">
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
      <xsl:when test="address/region">
         <xsl:choose>
            <xsl:when test="address/region != ''">
               <tr>
                  <th>
                     <B>Region:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="address/region">
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
      <xsl:when test="address/country">
         <xsl:choose>
            <xsl:when test="address/country != ''">
               <tr>
                  <th>
                     <B>Country:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="address/country">
</xsl:value-of>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:for-each select="authors/author">
   <xsl:choose>
      <xsl:when test="name">
         <xsl:choose>
            <xsl:when test="name != ''">
               <tr>
                  <th>
                     <B>Author Name:
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
      <xsl:when test="link">
         <xsl:choose>
            <xsl:when test="link != ''">
               <tr>
                  <th>
                     <B>Author link:
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
