<!---
	Name:		sendmail.cfm
	Author:		Ryan J. Heldt
	Created:	2018-10-20
	Purpose:	Sends The Week Ahead email.
--->

<cfif not structKeyExists(url, "token") or url.token neq variables.token>
    <cfinclude template = "_error_403.cfm" />
    <cfabort />
</cfif>

<cfsavecontent variable="mailmessage">
    <cfinclude template="_email.cfm" />
</cfsavecontent>
]
<cfmail
    to="family@cornerstonezearing.org"
	replyto="ryan@cornerstonezearing.org"
    from="Cornerstone Announcements #chr(60)#announcements@cornerstonezearing.org#chr(62)#"
    subject="The Week Ahead for #dateFormat(now(),"dddd, mmmm d, yyyy")#"
    server=""
    username=""
    password=""
    type="html">
#mailmessage#
</cfmail>

<h1>Process Complete</h1>