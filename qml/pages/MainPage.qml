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
import QtGraphicalEffects 1.0

Page {
    id: ueberblickPage

    property var ueberblick

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://www.tagesschau.de/api/index.json";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                parseFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function parseFunction(responseText) {
        ueberblick = JSON.parse(responseText);
    }

    Component.onCompleted: {
        getData()
    }

    Component {
        id: ueberblickListComponent

        Label {
            anchors {
                left:  parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }

            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignCenter
            text: modelData.shorttext
            color: Theme.secondaryColor
        }
    }

    SilicaListView {
        id: ueberblickListView
        anchors.fill: ueberblickPage
        model: ueberblick.teaser
        delegate: ueberblickListComponent
        header: Column {
            id: ueberblickColumn
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width

            PageHeader {
                id: ueberblickPageHeader
                title: "Nachrichtenüberblick"
            }

            Column {
                id: ueberblickTopstoriesColumn
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                spacing: 10

                Image {
                    id: ueberblickTopstoriesImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    source: ueberblick.topstories[0].images[0].variants[6].gross16x9
                    smooth: true
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: ueberblickTopstoriesHeadline
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.bold: true
                    text: ueberblick.topstories[0].shortheadline
                    color: Theme.highlightColor
                }

                Text {
                    id: uberblickTopstoriesHeadline
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    wrapMode: Text.WordWrap
                    text: ueberblick.topstories[0].shorttext
                    color: Theme.secondaryColor
                    /* MouseArea {
                  id: ueberblicktopstoriesMouseArea
                  anchors.fill: parent
                  onClicked: pageStacke.push(Qt.resolvedUrl("DetailsPage.qml)
                  }*/
                }
            }
        }
    }
    VerticalScrollDecorator { flickable: ueberblickListView }
}

