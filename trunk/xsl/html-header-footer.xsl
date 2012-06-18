<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="url_cgi" select="'http://localhost/~chris/tesserae/cgi-bin'"/><!-- URL_CGI -->
<xsl:variable name="url_css" select="'http://localhost/~chris/tesserae/css'"/><!-- URL_CSS -->
<xsl:variable name="url_html" select="'http://localhost/~chris/tesserae/html'"/><!-- URL_HTML -->
<xsl:variable name="url_image" select="'http://localhost/~chris/tesserae/images'"/><!-- URL_IMAGE -->
<xsl:variable name="url_text" select="'http://localhost/~chris/tesserae/texts'"/><!-- URL_TEXT -->
	
	<xsl:template match="/">
		<html>
	      <head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<meta name="author" content="Neil Coffee, Jean-Pierre Koenig, Shakthi Poornima, Chris Forstall, Roelant Ossewaarde"/>
				<meta name="keywords" content="inter-text, text analysis, classics, university at buffalo, latin"/>
				<meta name="description" content="Intertext analyzer for Latin texts"/>
				<link rel="stylesheet" type="text/css">
					<xsl:attribute name="href"><xsl:value-of select="concat($url_css, '/style.css')"/></xsl:attribute>
                                </link>
				<link rel="shortcut icon">
					<xsl:attribute name="href"><xsl:value-of select="concat($url_image, '/favicon.ico')"/></xsl:attribute>
				</link>
				
	         <title>Tesserae</title>
	      </head>

	      <body>
            <a name="top"/>

				<div id="container">

					<div id="header"> 
						<div id="title">
							<h1><b>Tesserae</b></h1>
							<h2>Intertextual Phrase Matching</h2>
						</div>

						<div id="nav_main">
							<ul>
								<li>
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="concat($url_html, '/index.php')"/>
										</xsl:attribute>
										Search
									</a>
								</li>
								<li>
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="concat($url_html, '/help.php')"/>
										</xsl:attribute>
										Help
									</a>
								</li>
								<li>
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="concat($url_html, '/about.php')"/>
										</xsl:attribute>
										About
									</a>
								</li>
								<li>
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="concat($url_html, '/research.php')"/>
										</xsl:attribute>
										Research
									</a>
								</li>
							</ul>
						</div>
					</div>
					
					<div id="nav_sub">
						<ul>
							<li>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat($url_html, '/index.php')"/>
									</xsl:attribute>
									Basic Search
								</a>
							</li>
							<li>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat($url_html, '/la_table.php')"/>
									</xsl:attribute>
									Advanced Features
								</a>
							</li>
							<li>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat($url_html, '/legacy.php')"/>
									</xsl:attribute>
									Older Versions
								</a>
							</li>
							<li>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat($url_html, '/grc_table.php')"/>
									</xsl:attribute>
									Greek
								</a>
							</li>
							<li>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="concat($url_html, '/experimental.php')"/>
									</xsl:attribute>
									Experimental
								</a>
							</li>
						</ul>
					</div>
									
					<div id="results_sort">
						<form>
							<xsl:attribute name="action"><xsl:value-of select="concat($url_cgi, '/get-data.pl')"/></xsl:attribute>
							<xsl:attribute name="method">post</xsl:attribute>
						 	<xsl:attribute name="id">Form1</xsl:attribute>

			            <p>
			               Sort by
			               <select name="sort">
			                  <option value="target">target phrase<xsl:if test="sortkey='target'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if></option>
			                  <option value="source">source phrase<xsl:if test="sortkey='source'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if></option>
			                  <option value="keyword">shared words<xsl:if test="sortkey='keyword'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if></option>
			                  <option value="score">score<xsl:if test="sortkey='score'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if></option>
			               </select>

								and format as 
								<select name="format">
									<option value="html">html</option>
									<option value="text">text</option>
									<option value="csv">csv</option>
									<option value="xml">xml</option>
								</select>

			               <input type="hidden" name="session">
			                  <xsl:attribute name="value">
			                     <xsl:value-of select="results/@sessionID"/>
			                  </xsl:attribute>
			               </input>

			               <input type="submit" name="submit" value="Change Display" style="margin-left:1em;"/>

								<span style="margin-left:4em;"><a href="#fullinfo">view details</a></span>
			            </p>       
			         </form>
					</div>

	            <xsl:apply-templates select="results"/>
    
					<div style="margin:1em;text-align:left;">
						<a href="#top">Back to top</a>
					</div>

					<div style="margin-left:100px;text-align:left;">
						<h2>Session Details</h2>
						<a name="fullinfo"/>
						<p>
							<b>Session ID: </b>
							<xsl:value-of select="results/@sessionID"/>
						</p>
						<p>
							<b>Source Text: </b>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="concat($url_text, '/', results/@source, '.tess')"/>
								</xsl:attribute>
								<xsl:value-of select="concat($url_text, '/', results/@source, '.tess')"/>
							</a>

							<br/>

	                    <b>Target Text: </b>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="concat($url_text, '/', results/@target, '.tess')"/>
								</xsl:attribute>
								<xsl:value-of select="concat($url_text, '/', results/@target, '.tess')"/>             
							</a>
						</p>

						<p>
							<b>Comments: </b>
							<xsl:value-of select="results/comments"/>
						</p>
						<p>
							<b>Stop words: </b>
							<xsl:value-of select="results/commonwords"/>
						</p>
					</div>
				
					<div id="footer">
						<div id="footer_icon">
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="concat($url_image, '/DHIBlogo.png')"/>
								</xsl:attribute>
								<xsl:attribute name="alt">
									DHIB logo
								</xsl:attribute>
							</img>
						</div>
						<div id="footer_content">
							<p> 
								Tesserae is a collaborative project of the 
								<a href="http://www.buffalo.edu">University at Buffalo</a>'s <br />
								<a href="http://www.classics.buffalo.edu"><b>Department of Classics</b></a> and
								<a href="http://linguistics.buffalo.edu"><b>Department of Linguistics</b></a>
							</p>
		   					<p>
								This project is funded by the
								<a href="http://digitalhumanities.buffalo.edu/">
									<b>Digital Humanities Initiative at Buffalo</b>
								</a>.<br />
							</p>
							<p>	
								Inquiries or comments about this website should be 
								directed to <a href="mailto:ncoffee@buffalo.edu">
								<b>Neil Coffee</b></a>.<br />

								Department of Classics | 338 MFAC | Buffalo, NY 14261<br />

		   					tel: (716) 645-2154 | fax: (716) 645-2225
							</p>
						</div>
					</div>
				</div>					
	      </body>
	   </html>
	</xsl:template>
</xsl:stylesheet>
