<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <xsl:template match="/">
      <html>
         <body>
            <xsl:for-each select="root">
               <table>
   <xsl:choose>
      <xsl:when test="title">
         <xsl:choose>
            <xsl:when test="title != ''">
               <tr>
                  <th>
                     <B>Title:
            </B>
                  </th>
                  <td>
                     <b><xsl:value-of select="title">
</xsl:value-of> </b>
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
			       <B>Pid: </B>
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
      <xsl:when test="abstract">
         <xsl:choose>
            <xsl:when test="abstract != ''">
               <tr>
                  <th>
                     <B>Abstract:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="abstract">
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
      <xsl:when test="authors">
         <xsl:choose>
            <xsl:when test="authors != ''">
               <tr>
                  <th>
                     <B>authors:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="authors">
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
      <xsl:when test="journal">
         <xsl:choose>
            <xsl:when test="journal != ''">
               <tr>
                  <th>
                     <B>journal:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="journal">
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
      <xsl:when test="doi">
         <xsl:choose>
            <xsl:when test="doi != ''">
               <tr>
                  <th>
                     <B>doi:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="doi">
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
      <xsl:when test="doi_url">
         <xsl:choose>
            <xsl:when test="doi_url != ''">
               <tr>
                  <th>
                     <B>doi_url:
            </B>
                  </th>
                  <td>
		     <a href="{doi_url}"><xsl:value-of select="doi_url"/></a>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="sha">
         <xsl:choose>
            <xsl:when test="sha != ''">
               <tr>
                  <th>
                     <B>sha:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="sha">
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
      <xsl:when test="license">
         <xsl:choose>
            <xsl:when test="license != ''">
               <tr>
                  <th>
                     <B>license:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="license">
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
      <xsl:when test="license_url">
         <xsl:choose>
            <xsl:when test="license_url != ''">
               <tr>
                  <th>
                     <B>license_url:
            </B>
                  </th>
                  <td>
		     <a href="{license_url}"><xsl:value-of select="license_url"/></a>
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
                     <B>publish_time:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="publish_time">
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
      <xsl:when test="source_x">
         <xsl:choose>
            <xsl:when test="source_x != ''">
               <tr>
                  <th>
                     <B>source_x:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="source_x">
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
      <xsl:when test="source_x_url">
         <xsl:choose>
            <xsl:when test="source_x_url != ''">
               <tr>
                  <th>
                     <B>source_x_url:
            </B>
                  </th>
                  <td>
		     <a href="{source_x_url}"><xsl:value-of select="source_x_url"/></a>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="pubmed_id">
         <xsl:choose>
            <xsl:when test="pubmed_id != ''">
               <tr>
                  <th>
                     <B>pubmed_id:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="pubmed_id">
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
      <xsl:when test="pubmed_id_url">
         <xsl:choose>
            <xsl:when test="pubmed_id_url != ''">
               <tr>
                  <th>
                     <B>pubmed_id_url:
            </B>
                  </th>
                  <td>
		     <a href="{pubmed_id_url}"><xsl:value-of select="pubmed_id_url"/></a>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="pmcid">
         <xsl:choose>
            <xsl:when test="pmcid != ''">
               <tr>
                  <th>
                     <B>pmcid:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="pmcid">
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
      <xsl:when test="pmcid_url">
         <xsl:choose>
            <xsl:when test="pmcid_url != ''">
               <tr>
                  <th>
                     <B>pmcid_url:
            </B>
                  </th>
                  <td>
		     <a href="{pmcid_url}"><xsl:value-of select="pmcid_url"/></a>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="microsoft_academic_paper_id">
         <xsl:choose>
            <xsl:when test="microsoft_academic_paper_id != ''">
               <tr>
                  <th>
                     <B>microsoft_academic_paper_id:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="microsoft_academic_paper_id">
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
      <xsl:when test="microsoft_academic_paper_id_url">
         <xsl:choose>
            <xsl:when test="microsoft_academic_paper_id_url != ''">
               <tr>
                  <th>
                     <B>microsoft_academic_paper_id_url:
            </B>
                  </th>
                  <td>
		     <a href="{microsoft_academic_paper_id_url}"><xsl:value-of select="microsoft_academic_paper_id_url"/></a>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="who_no_covidence">
         <xsl:choose>
            <xsl:when test="who_no_covidence != ''">
               <tr>
                  <th>
                     <B>who_no_covidence:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="who_no_covidence">
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
      <xsl:when test="who_no_covidence_url">
         <xsl:choose>
            <xsl:when test="who_no_covidence_url != ''">
               <tr>
                  <th>
                     <B>who_no_covidence_url:
            </B>
                  </th>
                  <td>
		     <a href="{who_no_covidence_url}"><xsl:value-of select="who_no_covidence_url"/></a>
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
                     <B>has_full_text:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="has_full_text">
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
      <xsl:when test="full_text_file">
         <xsl:choose>
            <xsl:when test="full_text_file!= ''">
               <tr>
                  <th>
                     <B>Full-text Data Subset:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="full_text_file">
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
      <xsl:when test="unicode_content_json">
         <xsl:choose>
            <xsl:when test="unicode_content_json != ''">
               <tr>
                  <th>
                     <B>unicode_content_json:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="unicode_content_json">
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
      <xsl:when test="unicode_content_json_extracted_text">
         <xsl:choose>
            <xsl:when test="unicode_content_json_extracted_text != ''">
               <tr>
                  <th>
                     <B>unicode_content_json_extracted_text:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="unicode_content_json_extracted_text">
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
      <xsl:when test="unicode_content_json_extracted_text_keywords">
         <xsl:choose>
            <xsl:when test="unicode_content_json_extracted_text_keywords != ''">
               <tr>
                  <th>
                     <B>unicode_content_json_extracted_text:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="unicode_content_json_extracted_text_keywords">
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
      <xsl:when test="content_dataset">
         <xsl:choose>
            <xsl:when test="content_dataset != ''">
               <tr>
                  <th>
                     <B>content_dataset:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="content_dataset">
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
      <xsl:when test="dataset_file">
         <xsl:choose>
            <xsl:when test="dataset_file != ''">
               <tr>
                  <th>
                     <B>dataset_file:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="dataset_file">
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
      <xsl:when test="dataset_name">
         <xsl:choose>
            <xsl:when test="dataset_name != ''">
               <tr>
                  <th>
                     <B>dataset_name:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="dataset_name">
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
      <xsl:when test="dataset_url">
         <xsl:choose>
            <xsl:when test="dataset_url != ''">
               <tr>
                  <th>
                     <B>dataset_url:
            </B>
                  </th>
                  <td>
		     <a href="{dataset_url}"><xsl:value-of select="dataset_url"/></a>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="dataset_notes">
         <xsl:choose>
            <xsl:when test="dataset_notes != ''">
               <tr>
                  <th>
                     <B>dataset_notes:
            </B>
                  </th>
                  <td>
                     <xsl:value-of select="dataset_notes">
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
                     <xsl:when test="dataset_version">
                        <xsl:choose>
                           <xsl:when test="dataset_version != ''">
                              <tr>
                                 <th>
                                    <B>DataSet Version:
                                    </B>
                                 </th>
                                 <td>
                                    <xsl:value-of select="dataset_version">
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
                     <xsl:when test="content_json">
                        <xsl:choose>
                           <xsl:when test="content_json != ''">
                              <tr>
                                 <th>
                                    <B>Json Content in Record:
                                    </B>
                                 </th>
                                 <td>
                                    <b>First 5000 Characters:</b><xsl:value-of select="substring(content_json, 1, 5000)">
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
                     <xsl:when test="content_json_extracted_text_keywords">
                        <xsl:choose>
                           <xsl:when test="content_json_extracted_text_keywords != ''">
                              <tr>
                                 <th>
                                    <B>Keywords Extracted from Text Content:
                                    </B>
                                 </th>
                                 <td>
                                    <xsl:value-of select="content_json_extracted_text_keywords">
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
                     <xsl:when test="content_json_extracted_text">
                        <xsl:choose>
                           <xsl:when test="content_json_extracted_text != ''">
                              <tr>
                                 <th>
                                    <B>Extracted Text Content in Record:
                                    </B>
                                 </th>
                                 <td>
                                    <b>First 5000 Characters:</b><xsl:value-of select="substring(content_json_extracted_text, 1, 5000)">
                                    </xsl:value-of>
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
