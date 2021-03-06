/*
                  Copyright (C) 2015 Nokius

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See below for more details.

        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: detailsPage

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://www.tagesschau.de/api/index.json";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                praseFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function praseFunction(responseText) {
        var details = JSON.parse(responseText);

        //debugLabel.text = details.topstories[0].details;

    }

    Component.onCompleted: {
        getData()
    }

    SilicaFlickable {
        id: detailsPageFlickable
        anchors.fill: parent
        contentHeight: detailsColumn.height

        }

        Column {
            id: detailsColumn
            width: detailsPage.width

            PageHeader {
                title: ("")
            }

            /*Label {
                id: debugLabel
                text: ""
            }*/

        }
    VerticalScrollDecorator { flickable: detailsPageFlickable }
}
