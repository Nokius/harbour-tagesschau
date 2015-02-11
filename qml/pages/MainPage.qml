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
    id: mainPage

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
        var ueberblick = JSON.parse(responseText);

        topstory0Image.source = ueberblick.topstories[0].images[0].variants[6].gross16x9;
        debugLabel.text = ueberblick.topstories[0].images[0].variants[6].gross16x9;
        //debugLabel.text = ueberblick.topstories[0].details;

    }

    Component.onCompleted: {
        getData()
    }

    SilicaFlickable {
        id: ueberblickPageFlickable
        anchors.fill: parent
        contentHeight: mainColumn.height

        PullDownMenu {
            MenuItem {
                text: ("Menü")
                onClicked: pageStack.push(Qt.resolvedUrl("MenuePage.qml"))
            }
            MenuItem {
                text: ("Ak­tu­a­li­sie­ren")
                onClicked: getData()
            }
        }

        Column {
            id: mainColumn
            width: mainPage.width

            PageHeader {
                title: ("Nachrichtenüberblick")
            }

            /*Label {
                id: debugLabel
                text: ""
            }*/

            Image {
                id: topstory0Image
                anchors.horizontalCenter: parent.horizontalCenter
                source: ""
                width: 480
                smooth: true
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    VerticalScrollDecorator { flickable: ueberblickPageFlickable }
}


