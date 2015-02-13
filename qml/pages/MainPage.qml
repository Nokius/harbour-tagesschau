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
        //var url = "https://gist.githubusercontent.com/Nokius/ca6d9cba70ca94deb309/raw/0ef81123de32a0e4974a7cf2c4a48c99a6294c38/gistfile1.txt"
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

        // check size of the array
        if (ueberblick.breakingnews.length > 0) {
            breakingnewsHeader.text = ueberblick.breakingnews[0].topline;
            breakingnewsHeadline.text = ueberblick.breakingnews[0].headline;
            breakingnewsText.text = ueberblick.breakingnews[0].shorttext;
        }

        topstoriesheadlineText.text = ueberblick.topstories[0].shortheadline;
        topstoriesshorttextText.text = ueberblick.topstories[0].shorttext;
        topstoriesImage.source = ueberblick.topstories[0].images[0].variants[6].gross16x9;
        if (ueberblick.topstories[0].multimedia-buttons[0].type == audio) {
            topstoriesaudioLabel.text = ueberblick.topstories[0].headline;
        }

        // varialbe for the DetailsPage
        var  topstoriesdetails = ueberblick.topstories[0].details;

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
            //spacing: 20

            PageHeader {
                id: ueberblickPageHeader
                title: ("Nachrichtenüberblick")
            }

            // Eilmeldung
            Column {
                id: eilmeldungColumn
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                spacing: 10
                visible: breakingnewsHeader.text.length > 0

                 SectionHeader {
                    id: breakingnewsHeader
                    font.bold: true
                    text: ""
                    color: Theme.highlightColor
                }

                Text {
                    id: breakingnewsHeadline
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    wrapMode: Text.WordWrap
                    text: ""
                    font.pixelSize: Theme.fontSizeMedium
                    color: Theme.highlightColor
                }

                Text {
                   id: breakingnewsText
                   anchors.horizontalCenter: parent.horizontalCenter
                   width: parent.width
                   wrapMode: Text.WordWrap
                   text: ""
                   font.pixelSize: Theme.fontSizeMedium
                   color: Theme.highlightColor
                }
            }

            // Topstories
            Column  {
                id: topstoriesColum
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                spacing: 10

                Image {
                    id: topstoriesImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: ""
                    width: parent.width
                    smooth: true
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: topstoriesheadlineText
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.bold: true
                    text: ""
                    font.pixelSize: Theme.fontSizeMedium
                    color: Theme.highlightColor
                }

                Text {
                    id: topstoriesshorttextText
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    wrapMode: Text.WordWrap
                    text: ""
                    font.pixelSize: Theme.fontSizeMedium
                    color: Theme.highlightColor

                    MouseArea {
                        id: topstoriesPage
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("DetailsPage.qml"))
                    }
                }

                Rectangle {
                    id:topstoriesaudio
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: children.height
                    color: "transparent"
                    visible: topstoriesaudioLabel.text.length > 0

                    Image {
                        id: topstoriesaudioIcon
                        anchors.left: topstoriesaudioLabel.right
                        source: "images/audio.svg"
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: topstoriesaudioLabel
                        width: text.width
                        wrapMode: Text.WordWrap
                        text: ""
                        font.bold: true
                    }
                }
            }
        }
        VerticalScrollDecorator { flickable: ueberblickPageFlickable }
    }
}

