<!---
	Name:		index.cfm
	Author:		Ryan J. Heldt
	Created:	2017-01-25
	Purpose:	I display a list of upcoming calendar events.
--->

<cfif not structKeyExists(url, "token") or url.token neq variables.token>
    <cfinclude template = "_error_403.cfm" />
    <cfabort />
</cfif>

<cfset variables.pagetitle = "Upcoming Events" />
<cfinclude template = "_extract_events.cfm" />
<cfinclude template = "_header.cfm" />

<h2>Upcoming Events</h2>
<br />

<cfif structKeyExists(url, "format") and url.format is "mediashout">

    <h3>For MediaShout</h3>
    <cfoutput query="qryEvents">
        <cfif qryEvents.Name neq "Sunday School" and qryEvents.Name neq "Sunday Service" and qryEvents.Name neq "Worship Team Practice">
            &bull;
            <cfif (dateDiff("d", Now(), qryEvents.Date) + 1) lt 7>
                #dateFormat(qryEvents.Date, "ddd")#:
            <cfelse>
                #dateFormat(qryEvents.Date, "mmm d")#:
            </cfif>
            #qryEvents.Name# |
            #lCase(timeFormat(qryEvents.Date, "h:mm tt"))#
            <br />
        </cfif>
    </cfoutput>

<cfelse>

    <h3>For Bulletin</h3>
    <cfoutput query="qryEvents">
        <cfif qryEvents.Name neq "Sunday School" and qryEvents.Name neq "Sunday Service" and qryEvents.Name neq "Worship Team Practice">

            <cfif (dateDiff("d", Now(), qryEvents.Date) + 1) lt 7>
                #dateFormat(qryEvents.Date, "ddd")#:
            <cfelse>
                #dateFormat(qryEvents.Date, "mmm d")#:
            </cfif>
            #qryEvents.Name# |
            #lCase(timeFormat(qryEvents.Date, "h:mm tt"))#
            <br />
        </cfif>
    </cfoutput>
</cfif>

<cfinclude template = "_footer.cfm" />