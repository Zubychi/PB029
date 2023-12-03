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
                            min-width: 39em;
                            margin: auto;
                            padding: 0em 2em;
                            background-color: #FFCC7F;
                            font-family: sans-serif, serif;
                            color: #000000;
                        }
                        #zahlavi {
                            position: relative;
                            top: 0em;
                            min-width: 35em;
                            max-width: 50em;
                            height: 5em;
                            margin: 0em auto;
                            padding: 1em;
                            background-color: #000000;
                            color: #FFFFFF;
                        }
                        #obsah {
                            position: relative;
                            min-width: 35em;
                            max-width: 52em;
                            margin: 0em auto;
                            padding: 1em 0em;
                            background-color: #FFF3E0;
                            color: #000000;
                        }
                        #text {
                            padding: 0em 1em;
                        }
                        a {
                            color: #807340;
                        }
                        a:hover {
                            color: #FF6600;
                        }
                        h3 {
                            margin: 0.5em 0em 0em 0em;
                        }
                        .program-background h3 {
                            background-color: #FFF3E0;
                            color: #000000;
                        }

                        .record-name {
                            padding: 0em 0.5em;
                            background-color: #E6E1CF;
                            color: #000000;
                        }

                        .record-background {
                            margin: 0;
                            padding: 0.5em 0.3em 0.3em 2em;
                            list-style: none;
                            background-color: #E6E1CF;
                            color: #000000;
                        }

                        div.value {
                            text-indent: 1.5em;
                        }

                        .label {
                            font-style: italic;
                        }
                    ]]>
                </style>
                <title>Kontakty</title>
            </head>

            <body>
                <div id="zahlavi">
                    <h1>Kontakty</h1>
                </div>
                <div id="obsah">
                    <div id="text">
                        <xsl:apply-templates select="*"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="record">
        <h3><span class="record-name"><xsl:value-of select="note"/></span></h3>
        <div class="record-background">
            <xsl:apply-templates select="*"/>
        </div>
    </xsl:template>
</xsl:transform>