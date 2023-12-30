<!---
	Name:		email.cfm
	Author:		Ryan J. Heldt
	Created:	2018-10-20
	Purpose:	Generates The Week Ahead email.
--->

<cfif not structKeyExists(url, "token") or url.token neq variables.token>
    <cfinclude template = "_error_403.cfm" />
    <cfabort />
</cfif>

<cfsilent>
    <!--- Upcoming Events --->
    <cfinclude template="_extract_events.cfm" />

    <!--- Reading Plans --->
    <cfinclude template="_reading_plan.cfm" />

    <!--- Memory Verse RSS ---> 
    <!---<cffeed source="https://dailyverses.net/rss.xml" query="qryVerses">--->

    <!--- Devotion RSS --->
    <cffeed source="http://www.adevotion.org/feed" query="qryDevotion">

    <!--- Blessings --->
    <cfset lstBlessings="Remember, greater love has no one than this: to lay down one's life for one's friends. (John 15:13)|We pray that the God of hope fill you with all joy and peace as you trust in him, so that you may overflow with hope by the power of the Holy Spirit. (Roman's 15:13)|Remember, that because of the Lord's great love we are not consumed; his compassions never fail. (Lamentations 3:22)|This week, encourage one another and build each other up, just as in fact you are doing. (1 Thessalonians 5:11)|Remember to trust in the Lord with all your heart and lean not on your own understanding; in all your ways submit to him, and he will make your paths straight. (Proverbs 3:5-6)|Remember, the Spirit God gave us does not make us timid, but gives us power, love and self-discipline. (2 Timothy 1:7)|Remember that God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life. (John 3:16)" />
    <cfset objBlessings=listToArray(lstBlessings,"|") />
    <cfset arraySort(objBlessings,"textnocase","ASC") />
    <cfset blessing=objBlessings[randRange(1,arrayLen(objBlessings))]>

    <!--- Sermons --->
    <cfquery name="qrySermons" datasource="cstone_sermons">
        SELECT TOP 1 S.*, SS.Name AS CategoryName
        FROM Sermons S
            INNER JOIN SermonSeries SS ON S.SermonSeriesID = SS.SermonSeriesID
        ORDER BY S.SermonDate DESC
    </cfquery>
</cfsilent>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cornerstone Church: The Week Ahead</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style type="text/css">body,#bodyTable,#bodyCell{height:100%!important;margin:0;padding:0;width:100%!important}table{border-collapse:collapse}img,a img{border:0;outline:none;text-decoration:none}h1,h2,h3,h4,h5,h6{margin:0;padding:0}p{margin:1em 0;padding:0}a{word-wrap:break-word}.ReadMsgBody{width:100%}.ExternalClass{width:100%}.ExternalClass,.ExternalClass p,.ExternalClass span,.ExternalClass font,.ExternalClass td,.ExternalClass div{line-height:100%}table,td{mso-table-lspace:0;mso-table-rspace:0}#outlook a{padding:0}img{-ms-interpolation-mode:bicubic}body,table,td,p,a,li,blockquote{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}#bodyCell{padding:20px}.Image{vertical-align:bottom}.TextContent img{height:auto!important}body,#bodyTable{background-color:#fff}#bodyCell{border-top:0}#templateContainer{border:0}h1{color:#606060!important;display:block;font-family:Helvetica;font-size:40px;font-style:normal;font-weight:700;line-height:125%;letter-spacing:-1px;margin:0;text-align:left}h2{color:#404040!important;display:block;font-family:Helvetica;font-size:26px;font-style:normal;font-weight:700;line-height:125%;letter-spacing:-.75px;margin:0;text-align:left}h3{color:#606060!important;display:block;font-family:Helvetica;font-size:18px;font-style:normal;font-weight:700;line-height:125%;letter-spacing:-.5px;margin:0;text-align:left}h4{color:gray!important;display:block;font-family:Helvetica;font-size:16px;font-style:normal;font-weight:700;line-height:125%;letter-spacing:normal;margin:0;text-align:left}#templatePreheader{background-color:#fff;border-top:0;border-bottom:0}.preheaderContainer .TextContent,.preheaderContainer .TextContent p{color:#606060;font-family:Helvetica;font-size:11px;line-height:125%;text-align:left}.preheaderContainer .TextContent a{color:#0073aa;font-weight:400;text-decoration:underline}#templateHeader{background-color:#fff;border-top:0;border-bottom:0}.headerContainer .TextContent,.headerContainer .TextContent p{color:#606060;font-family:Helvetica;font-size:15px;line-height:150%;text-align:left}.headerContainer .TextContent a{color:#6DC6DD;font-weight:400;text-decoration:underline}#templateBody{background-color:#fff;border-top:0;border-bottom:0}.bodyContainer .TextContent,.bodyContainer .TextContent p{color:#606060;font-family:Helvetica;font-size:15px;line-height:150%;text-align:left}.bodyContainer .TextContent a{color:#6DC6DD;font-weight:400;text-decoration:underline}#templateFooter{background-color:#fff;border-top:0;border-bottom:0}.footerContainer .TextContent,.footerContainer .TextContent p{color:#606060;font-family:Helvetica;font-size:11px;line-height:125%;text-align:left}.footerContainer .TextContent a{color:#0073aa;font-weight:400;text-decoration:underline}@media only screen and (max-width: 480px){body,table,td,p,a,li,blockquote{-webkit-text-size-adjust:none!important}body{width:100%!important;min-width:100%!important}td[id=bodyCell]{padding:10px!important}table[class=TextContentContainer]{width:100%!important}table[class=BoxedTextContentContainer]{width:100%!important}table[class=mcpreview-image-uploader]{width:100%!important;display:none!important}img[class=Image]{width:100%!important}table[class=ImageGroupContentContainer]{width:100%!important}td[class=ImageGroupContent]{padding:9px!important}td[class=ImageGroupBlockInner]{padding-bottom:0!important;padding-top:0!important}table[class=CaptionTopContent],table[class=CaptionBottomContent]{width:100%!important}table[class=CaptionLeftTextContentContainer],table[class=CaptionRightTextContentContainer],table[class=CaptionLeftImageContentContainer],table[class=CaptionRightImageContentContainer],table[class=ImageCardLeftTextContentContainer],table[class=ImageCardRightTextContentContainer]{width:100%!important}td[class=ImageCardLeftImageContent],td[class=ImageCardRightImageContent]{padding-right:18px!important;padding-left:18px!important;padding-bottom:0!important}td[class=ImageCardBottomImageContent]{padding-bottom:9px!important}td[class=ImageCardTopImageContent]{padding-top:18px!important}td[class=ImageCardLeftImageContent],td[class=ImageCardRightImageContent]{padding-right:18px!important;padding-left:18px!important;padding-bottom:0!important}td[class=ImageCardBottomImageContent]{padding-bottom:9px!important}td[class=ImageCardTopImageContent]{padding-top:18px!important}table[class=CaptionLeftContentOuter] td[class=TextContent],table[class=CaptionRightContentOuter] td[class=TextContent]{padding-top:9px!important}td[class=CaptionBlockInner] table[class=CaptionTopContent]:last-child td[class=TextContent]{padding-top:18px!important}td[class=BoxedTextContentColumn]{padding-left:18px!important;padding-right:18px!important}td[class=TextContent]{padding-right:18px!important;padding-left:18px!important}table[id=templateContainer],table[id=templatePreheader],table[id=templateHeader],table[id=templateBody],table[id=templateFooter]{max-width:600px!important;width:100%!important}h1{font-size:24px!important;line-height:125%!important}h2{font-size:20px!important;line-height:125%!important}h3{font-size:18px!important;line-height:125%!important}h4{font-size:16px!important;line-height:125%!important}table[class=BoxedTextContentContainer] td[class=TextContent],td[class=BoxedTextContentContainer] td[class=TextContent] p{font-size:18px!important;line-height:125%!important}table[id=templatePreheader]{display:block!important}td[class=preheaderContainer] td[class=TextContent],td[class=preheaderContainer] td[class=TextContent] p{font-size:14px!important;line-height:115%!important}td[class=headerContainer] td[class=TextContent],td[class=headerContainer] td[class=TextContent] p{font-size:18px!important;line-height:125%!important}td[class=bodyContainer] td[class=TextContent],td[class=bodyContainer] td[class=TextContent] p{font-size:18px!important;line-height:125%!important}td[class=footerContainer] td[class=TextContent],td[class=footerContainer] td[class=TextContent] p{font-size:14px!important;line-height:115%!important}td[class=footerContainer] a[class=utilityLink]{display:block!important}}</style>
</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0">
    <!-- FRAMEWORK -->
    <center><table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable"><tr><td align="center" valign="top" id="bodyCell"><table border="0" cellpadding="0" cellspacing="0" width="600" id="templateContainer"><tr><td align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="600" id="templateHeader"><tr><td valign="top" class="headerContainer">

    <!-- HEADER -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ImageBlock">
        <tr>
            <td valign="top" style="padding:0px" class="ImageBlockInner">
                <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0" class="ImageContentContainer">
                    <tr>
                        <td class="ImageContent" valign="top" style="padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0;">
                            <img align="left" alt="The Week Ahead" src="https://sermons.cornerstonezearing.org/calendar/images/weekahead.png" width="600" style="max-width:600px; padding-bottom: 0; display: inline !important; vertical-align: bottom;" class="Image" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- SPACER -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="DividerBlock">
        <tr>
            <td class="DividerBlockInner" style="padding: 20px 18px;">
                <table class="DividerContent" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- FRAMEWORK -->
    </td></tr></table></td></tr><tr><td align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="600" id="templateBody"><tr><td valign="top" class="bodyContainer">

    <!-- INTRO -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="TextBlock">
        <tr>
            <td valign="top" class="TextBlockInner">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="600" class="TextContentContainer">
                    <tr>
                        <td valign="top" class="TextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;">
                            <span style="font-family:arial,helvetica neue,helvetica,sans-serif">
                                <span style="font-size:39px">
                                    <span style="color:#0073aa">
                                        <cfset nextWeek = dateAdd("d",7,now()) />
                                        <cfoutput>
                                            Week of
                                            <cfif month(nextWeek) is month(now())>
                                                #dateFormat(now(),"mmmm d")#-#dateFormat(nextWeek,"d")#
                                            <cfelse>
                                                #dateFormat(now(),"mmmm d")#-#dateFormat(nextWeek,"mmmm d")#
                                            </cfif>
                                        </cfoutput>
                                    </span>
                                </span>
                                <br />
                                <br />
                                <span style="color:#697b7c">
                                    <span style="font-size:14px; line-height:14px; text-align:justify">
                                        <strong>Happy Monday morning, Cornerstone Family!</strong> Below everything you need
                                        to know for the week ahead &mdash; a list of upcoming church events, last week's sermon,
                                        our reading plan, a short devotion, and more. <cfoutput>#blessing#</cfoutput><br />&nbsp;<br />
                                        Have a great week!
                                    </span>
                                </span>
                            </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- HLINE -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ImageBlock">
        <tr>
            <td valign="top" style="padding:0px" class="ImageBlockInner">
                <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0" class="ImageContentContainer">
                    <tr>
                        <td class="ImageContent" valign="top" style="padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0;">
                            <img align="left" alt="" src="https://sermons.cornerstonezearing.org/calendar/images/hline.png" width="600" style="max-width:600px; padding-bottom: 0; display: inline !important; vertical-align: bottom;" class="Image" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- EVENTS -->
    <cfoutput query="qryEvents">
        <cfif (dateDiff("d", Now(), qryEvents.Date) + 1) lt 9>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="CaptionBlock">
                <tr>
                    <td class="CaptionBlockInner" valign="top" style="padding:9px;">
                        <table border="0" cellpadding="0" cellspacing="0" class="CaptionRightContentOuter" width="100%">
                            <tr>
                                <td valign="top" class="CaptionRightContentInner" style="padding:0 9px ;">
                                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="CaptionRightImageContentContainer">
                                        <tr>
                                            <td class="CaptionRightImageContent" valign="top">
                                                <img alt="" src="https://sermons.cornerstonezearing.org/calendar/images/#lCase(dateFormat(qryEvents.Date, "mmmm"))#.png" width="132" style="max-width:268px;" class="Image" /><br /><img alt="" src="https://sermons.cornerstonezearing.org/calendar/images/#dateFormat(qryEvents.Date, "dd")#.png" width="132" style="max-width:268px;" class="Image" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="CaptionRightTextContentContainer" align="right" border="0" cellpadding="0" cellspacing="0" width="396">
                                        <tr>
                                            <td valign="top" class="TextContent" style="text-align: left;">
                                                <span style="font-size:24px; color:##0073aa">#ListFirst(qryEvents.Name,"@")#</span><br />
                                                <strong>#dateFormat(qryEvents.Date, "dddd, mmmm d")# at #lCase(timeFormat(qryEvents.Date, "h:mm tt"))#</strong><br />
                                                <span style="font-size:12px;">#qryEvents.Description#</span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </cfif>
    </cfoutput>

    <!-- SPACER -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="DividerBlock">
        <tr>
            <td class="DividerBlockInner" style="padding: 20px 18px 0px;">
                <table class="DividerContent" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- BUTTON -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ButtonBlock">
        <tr>
            <td style="padding-top:0; padding-right:18px; padding-bottom:18px; padding-left:18px;" valign="top" class="ButtonBlockInner">
                <table border="0" cellpadding="0" cellspacing="0" class="ButtonContentContainer" style="border-collapse: separate !important;border-radius: 5px;background-color: #0073aa;">
                    <tr>
                        <td class="ButtonContent" style="font-family: Arial; font-size: 16px; padding: 16px;">
                            <a class="Button " title="Events Calendar" href="https://www.cornerstonezearing.org/events/" target="_blank" style="letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;">
                                Events Calendar
                            </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- HLINE -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ImageBlock">
        <tr>
            <td valign="top" style="padding:9px" class="ImageBlockInner">
                <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0" class="ImageContentContainer">
                    <tr>
                        <td class="ImageContent" valign="top" style="padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0;">
                            <img align="left" alt="" src="https://sermons.cornerstonezearing.org/calendar/images/hline.png" width="564" style="max-width:600px; padding-bottom: 0; display: inline !important; vertical-align: bottom;" class="Image" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- SERMON  -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="TextBlock">
        <tr>
            <td valign="top" class="TextBlockInner">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="600" class="TextContentContainer">
                    <tr>
                        <td valign="top" class="TextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;">
                            <p><strong>INSTRUCTION</strong></p>
                            <span style="font-family:arial,helvetica neue,helvetica,sans-serif">
                                <span style="font-size:39px">
                                    <span style="color:#0073aa">
                                        <cfoutput>#qrySermons.Name#</cfoutput>
                                    </span>
                                </span>
                                <br />
                                <span style="color:#697b7c">
                                    <span style="font-size:14px; line-height:14px; text-align:justify">
                                        <p><cfoutput>Did you miss the message on #DateFormat(qrySermons.SermonDate, "dddd, mmmm d, yyyy")# 
                                        from our sermon series <em>#qrySermons.CategoryName#</em>? Listen to it now!</cfoutput></p>
                                    </span>
                                </span>
                            </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- LISTEN NOW -->
    <table border="0" cellpadding="0" cellspacing="0" class="ButtonBlock">
        <tr>
            <td style="padding-top:0; padding-right:18px; padding-bottom:18px; padding-left:18px;" valign="top" class="ButtonBlockInner">
                <table border="0" cellpadding="0" cellspacing="0" class="ButtonContentContainer" style="border-collapse: separate !important;border-radius: 5px;background-color: #0073aa;">
                    <tr>
                        <td class="ButtonContent" style="font-family: Arial; font-size: 16px; padding: 16px;">
                            <a class="Button " title="Listen Now" href="https://www.cornerstonezearing.org/sermon/<cfoutput>#DateFormat(qrySermons.SermonDate, "yyyymmdd")#</cfoutput>/" target="_blank" style="letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;">Listen Now</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="padding-top:0; padding-right:18px; padding-bottom:18px; padding-left:18px;" valign="top" class="ButtonBlockInner">
                <table border="0" cellpadding="0" cellspacing="0" class="ButtonContentContainer" style="border-collapse: separate !important;border-radius: 5px;background-color: #0073aa;">
                    <tr>
                        <td class="ButtonContent" style="font-family: Arial; font-size: 16px; padding: 16px;">
                            <a class="Button " title="More Sermons" href="https://www.cornerstonezearing.org/sermons/" target="_blank" style="letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;">More Sermons</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- HLINE -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ImageBlock">
        <tr>
            <td valign="top" style="padding:9px" class="ImageBlockInner">
                <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0" class="ImageContentContainer">
                    <tr>
                        <td class="ImageContent" valign="top" style="padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0;">
                            <img align="left" alt="" src="https://sermons.cornerstonezearing.org/calendar/images/hline.png" width="564" style="max-width:600px; padding-bottom: 0; display: inline !important; vertical-align: bottom;" class="Image" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- SCRIPTURE  -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="TextBlock">
        <tr>
            <td valign="top" class="TextBlockInner">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="600" class="TextContentContainer">
                    <tr>
                        <td valign="top" class="TextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;">
                            <p><strong>SCRIPTURE</strong></p>
                            <span style="font-family:arial,helvetica neue,helvetica,sans-serif">
                                <span style="font-size:39px">
                                    <span style="color:#0073aa">
                                        2019 Bible Reading Plan
                                    </span>
                                </span>
                                <p>It is our goal as a body of believers to get through the entire Bible during 2019. The reading plan for this week is below, and matches the <em>Daily Bible Reading Plan</em> tract distributed by Cornerstone.</p>
                                <table style="color:#697b7c; font-size:14px; line-height:14px; text-align:justify">
                                    <cfloop from="0" to="6" index="rr">
                                        <cfset dt = dateAdd("d",rr,now()) />
                                        <cfoutput>
                                            <tr>
                                                <td>#dateFormat(dt,"ddd")#&nbsp;&nbsp;</td>
                                                <td>#dateFormat(dt,"mmm d")#:&nbsp;&nbsp;</td>
                                                <td>#stcReadings[uCase(dateFormat(dt,"mmmd"))]#</td>
                                            </tr>
                                        </cfoutput>
                                    </cfloop>
                                </table>
                                <!---<span style="color:#697b7c; font-size:14px; line-height:14px; text-align:justify">
                                    <p><cfoutput>#qryVerses.Content#</cfoutput><br />
                                    &mdash; <em><cfoutput>#qryVerses.Title#</cfoutput></em></p>
                                    <small><em>Courtesy <a href="<cfoutput>#qryVerses.RSSLink#</cfoutput>" target="_blank">Daily Verses</a></em></small>
                                </span>--->
                            </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- HLINE -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ImageBlock">
        <tr>
            <td valign="top" style="padding:9px" class="ImageBlockInner">
                <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0" class="ImageContentContainer">
                    <tr>
                        <td class="ImageContent" valign="top" style="padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0;">
                            <img align="left" alt="" src="https://sermons.cornerstonezearing.org/calendar/images/hline.png" width="564" style="max-width:600px; padding-bottom: 0; display: inline !important; vertical-align: bottom;" class="Image" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- DEVOTION -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="TextBlock">
        <tr>
            <td valign="top" class="TextBlockInner">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="600" class="TextContentContainer">
                    <tr>
                        <td valign="top" class="TextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;">
                            <p><strong>DEVOTION</strong></p>
                            <span style="font-family:arial,helvetica neue,helvetica,sans-serif">
                                <span style="font-size:39px">
                                    <span style="color:#0073aa">
                                        <cfoutput>#qryDevotion.Title#</cfoutput>
                                    </span>
                                </span>
                                <br />
                                <span style="color:#697b7c">
                                    <span style="font-size:14px; line-height:14px; text-align:justify">
                                        <cfoutput>#qryDevotion.Content#</cfoutput>
                                        <small><em>Courtesy <a href="<cfoutput>#qryDevotion.LinkHref#</cfoutput>" target="_blank">A Bible Devotion</a></em></small>
                                    </span>
                                </span>
                            </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- HLINE -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ImageBlock">
        <tr>
            <td valign="top" style="padding:9px" class="ImageBlockInner">
                <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0" class="ImageContentContainer">
                    <tr>
                        <td class="ImageContent" valign="top" style="padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0;">
                            <img align="left" alt="" src="https://sermons.cornerstonezearing.org/calendar/images/hline.png" width="564" style="max-width:600px; padding-bottom: 0; display: inline !important; vertical-align: bottom;" class="Image" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- FRAMEWORK -->
    </td></tr></table></td></tr><tr><td align="center" valign="top">

    <!-- FOOTER -->
    <table border="0" cellpadding="0" cellspacing="0" width="600" id="templateFooter">
        <tr>
            <td valign="top" class="footerContainer" style="padding-bottom:9px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="TextBlock">
                    <tr>
                        <td valign="top" class="TextBlockInner">
                            <table align="left" border="0" cellpadding="0" cellspacing="0" width="600" class="TextContentContainer">
                                <tr>
                                    <td valign="top" class="TextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;">
                                        <div style="text-align: center;">
                                            Cornerstone Church of Christ &bull; 14777 US Hwy 65 &bull; Zearing, Iowa 50278
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- FRAMEWORK -->
    </td></tr><tr><td align="center" valign="top">

    <!-- SOCIAL MEDIA -->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="FollowBlock">
        <tr>
            <td align="center" valign="top" style="padding:9px" class="FollowBlockInner">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="FollowContentContainer">
                    <tr>
                        <td align="center" style="padding-left:9px;padding-right:9px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="FollowContent">
                                <tr>
                                    <td align="center" valign="top" style="padding-top:9px; padding-right:9px; padding-left:9px;">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td valign="top">
                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="FollowStacked">
                                                        <tr>
                                                            <td align="center" valign="top" class="FollowIconContent" style="padding-right:10px; padding-bottom:9px;">
                                                                <a href="https://www.facebook.com/cornerstonezearing" target="_blank"><img src="https://sermons.cornerstonezearing.org/calendar/images/outline-color-facebook-96.png" alt="Facebook" class="FollowBlockIcon" width="48" style="width:48px; max-width:48px; display:block;" /></a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!--[if gte mso 6]></td><td align="left" valign="top"><![endif]-->
                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="FollowStacked">
                                                        <tr>
                                                            <td align="center" valign="top" class="FollowIconContent" style="padding-right:10px; padding-bottom:9px;">
                                                                <a href="https://twitter.com/cstonezearing" target="_blank"><img src="https://sermons.cornerstonezearing.org/calendar/images/outline-color-twitter-96.png" alt="Twitter" class="FollowBlockIcon" width="48" style="width:48px; max-width:48px; display:block;" /></a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!--[if gte mso 6]></td><td align="left" valign="top"><![endif]-->
                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="FollowStacked">
                                                        <tr>
                                                            <td align="center" valign="top" class="FollowIconContent" style="padding-right:0; padding-bottom:9px;">
                                                                <a href="https://www.cornerstonezearing.org/" target="_blank"><img src="https://sermons.cornerstonezearing.org/calendar/images/outline-color-link-96.png" alt="Website" class="FollowBlockIcon" width="48" style="width:48px; max-width:48px; display:block;" /></a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!--[if gte mso 6]></td><td align="left" valign="top"><![endif]-->
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <!-- FRAMEWORK -->
    </td></tr></table></td></tr></table></center>
</body>
</html>