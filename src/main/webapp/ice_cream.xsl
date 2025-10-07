<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
  <body>
    <h2>Feedback Summary</h2>
    <table border="1" cellpadding="8">
      <tr bgcolor="#9acd32">
        <th>Name</th>
        <th>Email</th>
        <th>Rating</th>
        <th>Comments</th>
      </tr>
      <xsl:for-each select="feedbacks/feedback">
        <tr>
          <td><xsl:value-of select="name"/></td>
          <td><xsl:value-of select="email"/></td>
          <td><xsl:value-of select="rating"/></td>
          <td><xsl:value-of select="comments"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
