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
    property var topstories
    property var teasers

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
        topstories = ueberblick.topstories
        teasers = ueberblick.teasers
    }

    Component.onCompleted: {
        getData()
    }

    Component {
        id: ueberblickListComponent


        Column {
            width: parent.width
            spacing: 3

            Image {
                id: ueberblickteasersImage
                anchors.horizontalCenter: parent.horizontalCenter
                source: modelData.images[0].variants[1].modPremiumHalb
                width: 480
                smooth: true
                fillMode: Image.PreserveAspectFit
            }

            Label {
                id: ueberblickteaserstoplineLabel
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: modelData.topline
                font.bold: true
                color: Theme.highlightColor
            }

            Label {
                id: ueberblickteaserstopsshorttextLabel
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: modelData.shorttext
                color: Theme.secondaryColor
            }
        }
    }

    Component {
        id: headerDelegate

        Column {
            width: parent.width
            spacing: 3

            Image {
                id: ueberblickTopstoriesImage
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                source: modelData.images[0].variants[6].gross16x9
                smooth: true
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: ueberblickTopstoriesHeadline
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.bold: true
                text: modelData.shortheadline
                color: Theme.highlightColor
            }

            Text {
                id: ueberblickTopstoriesText
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                wrapMode: Text.WordWrap
                text: modelData.shorttext
                color: Theme.secondaryColor

                MouseArea {
                    id: ueberblickTopstoriesMouseArea
                    anchors.fill: parent
                    onClicked: pageStack.push(Qt.resolvedUrl("DetailsPage.qml"))
                }
            }

            Item {
                id: topstoriesmedia
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: visible ? Math.max(topstoriesmediaIcon.height, topstoriesmediaLabel.height) :0
                visible: topstoriesmediaLabel.text.length > 0

                Image {
                    id: topstoriesmediaIcon
                    anchors.left: parent.left
                    source: modelData["multimedia-buttons"][0].type === "audio" ? "images/audio.svg" : "images/video.svg"
                    width: 40
                    height: 40
                    smooth: true
                    fillMode: Image.PreserveAspectFit
                    visible: false
                }

                ColorOverlay {
                    anchors.fill: topstoriesmediaIcon
                    source: topstoriesmediaIcon
                    color: Theme.secondaryColor
                }

                Label {
                    id: topstoriesmediaLabel
                    anchors.right: parent.right
                    width: 430
                    wrapMode: Text.WordWrap
                    text: modelData["multimedia-buttons"][0].headline
                    color: Theme.highlightColor
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: pageStack.push(Qt.resolvedUrl("DetailsPage.qml"))
                }
            }
        }
    }

    SilicaListView {
        id: ueberblickListView
        anchors.fill: ueberblickPage
        model: teasers
        delegate: ueberblickListComponent
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
        header: Component {
            Column {
                id: ueberblickColumn
                width: parent.width

                PageHeader {
                    id: ueberblickPageHeader
                    title: "Nachrichtenüberblick"
                }

                Repeater {
                    width: parent.width
                    delegate: headerDelegate
                    model: topstories
                }
            }
        }
        VerticalScrollDecorator {}
    }
}

