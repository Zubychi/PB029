<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output 
        method="html" 
        encoding="UTF-8" 
        indent="yes" 
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>


    <xsl:template match="/contacts">
        <html>
            <head>
                <meta name="language" content="SK"/>
                <meta name="description" content="Zoznam kontaktov obsahujúci mená, adresy a rôzne kontakty."/>
                <meta name="keywords" content="zoznam,kontakty,adresy,telefón,email"/>
                <meta name="author" content="Denisa Rudincová, 524996@mail.muni.cz"></meta>

                <link rel="stylesheet" type="text/css" href="style.css" />
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
        <xsl:choose>
            <xsl:when test="address or phone or email or web or personalized-contact or note">
                    <ul>
                        <xsl:choose>
                            <xsl:when test="address">
                                <li>
                                    <h4>Adresy</h4>
                                    <xsl:apply-templates select="address"/>
                                </li>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="phone">
                                <li>
                                    <h4>Telefónne čísla</h4>
                                    <xsl:apply-templates select="phone"/>
                                </li>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="email">
                                <li>
                                    <h4>E-mailové adresy</h4>
                                    <xsl:apply-templates select="email"/>
                                </li>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="web">
                                <li>
                                    <h4>Weby</h4>
                                    <xsl:apply-templates select="web"/>
                                </li>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="personalized-contact">
                                <li>
                                    <h4>Iné kontakty</h4>
                                    <xsl:apply-templates select="personalized-contact"/>
                                </li>
                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="note">
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
                            </xsl:when>
                        </xsl:choose>
                    </ul>

            </xsl:when>
        </xsl:choose>
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