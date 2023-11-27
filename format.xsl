<?xml version="1.0" encoding="UTF-8"?>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<body style="font-family:Arial;font-size:24px;background-color:#404040;">
<xsl:for-each select="rss/events/event">
    <div style="background-color:#4d4dff;color:white;padding:4px">
        <span style="font-weight:bold"><xsl:value-of select="title"/> - </span>
        <xsl:value-of select="date"/>
    </div>
    <div style="margin-left:20px;margin-bottom:1em;color:white;font-size:20px">
        <p style="margin-top:3px;margin-bottom:3px">
        <xsl:value-of select="description"/>
        </p>
    </div>
</xsl:for-each>
</body>
</html>
