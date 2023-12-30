<!---
	Name:		_extract_events.cfm
	Author:		Ryan J. Heldt
	Created:	2017-01-24
	Purpose:	I do some old fashioned screen scraping to derive a list of parseable events.
--->

<cfsilent>
<cfscript>
    
// Create query object to store parsed events
qryEvents = queryNew("EventID,Name,Location,Description,Date,IsPrivate,URL", "varchar,varchar,varchar,varchar,timestamp,bit,varchar");

// Grab events from agenda page using Jsoup
jsoup = createObject("java", "org.jsoup.Jsoup");
dom = jsoup.connect("http://www.cornerstonezearing.org/events/action~agenda/cat_ids~71,73").get();
events = dom.select(".ai1ec-event");

// Loop over events
for (event in events) {
    queryAddRow(qryEvents);

    // EventID and URL
    link = event.select(".ai1ec-read-more");
    querySetCell(qryEvents, "EventID", listLast(link.attr("abs:href"), "="));
    querySetCell(qryEvents, "URL", link.attr("href"));

    // Title and Location
    title = event.select(".ai1ec-event-title");
    location = title.select(".ai1ec-event-location");
    titleText = Trim(title.text());
    locationText = Trim(location.text());
    querySetCell(qryEvents, "Name", titleText);
    if (Len(locationText) > 2) {
        querySetCell(qryEvents, "Location", right(locationText, Len(locationText)-2));
    } else {
        querySetCell(qryEvents, "Location", locationText);
    }   

    // Description
    description = event.select(".ai1ec-event-description");
    querySetCell(qryEvents, "Description", Trim(description.text()));

    // Date
    datetime = event.select(".ai1ec-event-time");
    datetimeText = trim(listFirst(datetime.text(), chr(8211)));
    currentMonth = month(now());
    currentYear = year(now());
    eventMonth = getMonthNumber(listFirst(datetimeText, " "));
    eventYear = currentYear;
    if (val(eventMonth) lt val(currentMonth)) {
        eventYear++;
    }
    querySetCell(qryEvents, "Date", parseDateTime(replaceNoCase(datetimeText, " @", ", " & eventYear)));

    // Category
    querySetCell(qryEvents, "IsPrivate", 1);
    category = event.select(".ai1ec-category");
    if (findNoCase("Public", category.text())) {
        querySetCell(qryEvents, "IsPrivate", 0);
    }
}

function getMonthNumber(abbreviation) { 
    switch(lCase(abbreviation)) {
        case "jan":
             return 1;
        case "feb":
             return 2;
        case "mar":
             return 3;
        case "apr":
             return 4;
        case "may":
             return 5;
        case "jun":
             return 6;
        case "jul":
             return 7;
        case "aug":
             return 8;
        case "sep":
             return 9;
        case "oct":
             return 10;
        case "nov":
             return 11;
        case "dec":
             return 12;
        default: 
             return 0;
    } 
}

</cfscript>
</cfsilent> 