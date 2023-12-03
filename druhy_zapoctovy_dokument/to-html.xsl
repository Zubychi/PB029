<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output 
        method="html" 
        encoding="UTF-8" 
        indent="yes" 
        doctype-public="-//W3C//DTD HTML 4.01//EN" 
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>


    <xsl:template match="/contacts">
        <html>
            <head>
                <style type="text/css">
                    <![CDATA[
body {
    min-width: 40em;
    margin: auto;
    background-color: #6688B0;
    font-family: sans-serif, serif;
    color: #000000;
}

#zahlavie {
    position: relative;
    top: 0em;
    min-width: 40em;
    max-width: 50em;
    height: 5em;
    margin: 0em auto;
    padding: 1em;
    background-color: #0F084B;
    color: #FFFFFF;
}

#obsah {
    position: relative;
    min-width: 40em;
    max-width: 52em;
    margin: 0em auto;
    padding: 1em 0em;
    background-color: #A6CFD5;
    color: #000000;
}

#text {
    padding: 0em 1em;
}

a {
    color: #26408B;
}

a:hover {
    color: #0F084B;
}

h1 {
    letter-spacing: 8px;
}

h3 {
    margin: 0.5em 0em 0em 0em;
    color: #0F084B;
}

.record {
    padding: 0em 0.5em;
    background-color: #A6CFD5;
    color: #000000;
    border-bottom: 10px double #0f084b;
}

div.value {
    text-indent: 1em;
}

.label {
    font-weight: bold;
}

.notes li {
    margin: 0.5em 2.5em 0.5em 0.5em;
}

.address {
    margin: 0.5em 0.5em 1em 1em;
}
                    ]]>
                </style>

                <title>Kontakty</title>
            </head>

            <body>
                <div id="zahlavie">
                    <h1>Kontakty</h1>
                </div>
                <div id="obsah">
                    <div id="text">
                        <xsl:apply-templates select="record">
                            <xsl:sort select="name/lastname" order="ascending"/>
                            <xsl:sort select="name/firstname" order="ascending"/>
                        </xsl:apply-templates>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="record">
        <div class="record">
            <xsl:apply-templates select="name"/>
            <ul>
                <li>
                    <h4>Adresy</h4>
                    <xsl:apply-templates select="address"/>
                </li>
                <li>
                    <h4>Telefónne čísla</h4>
                    <xsl:apply-templates select="phone"/>
                </li>
                <li>
                    <h4>E-maily</h4>
                    <xsl:apply-templates select="email"/>
                </li>
                <li>
                    <h4>Weby</h4>
                    <xsl:apply-templates select="web"/>
                </li>
                <li>
                    <h4>Iné kontakty</h4>
                    <xsl:apply-templates select="personalized-contact"/>
                </li>
                <li>
                    <h4>Poznámky</h4>
                    <div class="notes">
                    <ul>
                    <xsl:for-each select="note">
                        <li>
                        <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                    </ul>
                    </div>
                </li>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="name">
        <h3><span><xsl:value-of select="lastname"/>, <xsl:value-of select="firstname"/>
            <xsl:choose>
                <xsl:when test="boolean(middlename/text())">
                    <xsl:value-of select="concat(' ', middlename)"/>
                </xsl:when>
            </xsl:choose>
        </span></h3>
    </xsl:template>

    <xsl:template match="address">
        <div class="address">
            <xsl:value-of select="concat(street, ' ', house-number)"/><br/>
            <xsl:value-of select="concat(zipcode, ' ', city)"/><br/>
            <xsl:value-of select="country"/> <br/>
        </div>
    </xsl:template>

    <xsl:template match="phone">
        <span class="label"><xsl:value-of select="concat(type, ': ')"/></span>
        <span class="value"><xsl:value-of select="value"/></span>
        <br/>
    </xsl:template>

    <xsl:template match="email">
        <span class="label"><xsl:value-of select="concat(type, ': ')"/></span>
        <a class="value">
            <xsl:attribute name="href">
                <xsl:text>mailto:</xsl:text>
                <xsl:value-of select="value"/>
            </xsl:attribute>
            <xsl:value-of select="value"/>
        </a>
        <br/>
    </xsl:template>

    <xsl:template match="web">
        <a class="value">
            <xsl:attribute name="href">
                <xsl:value-of select="text()"/>
                </xsl:attribute>
            <xsl:value-of select="text()"/>
        </a>

        <br/>
    </xsl:template>

    <xsl:template match="personalized-contact">
        <span class="label"><xsl:value-of select="concat(service, ': ')"/></span>
        <span class="value"><xsl:value-of select="value"/></span>
        <br/>
    </xsl:template>

</xsl:transform>