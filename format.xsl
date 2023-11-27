<?xml version="1.0" encoding="UTF-8"?>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<body style="font-family:Arial;font-size:24px;background-color:#404040;">
<xsl:for-each select="rss/events/event">
    <div style="background-color:#4d4dff;color:white;padding:8px">
        <span style="font-weight:bold"><xsl:value-of select="title"/> - </span>
        <span style="font-size:18px"><xsl:value-of select="date"/></span>
    </div>
    <div style="margin-left:20px;margin-top:0.75em;margin-bottom:1em;color:white;font-size:16px">
        <p style="margin-top:0px">
        <xsl:value-of select="description"/>
        </p>
    </div>
</xsl:for-each>
</body>
</html>
