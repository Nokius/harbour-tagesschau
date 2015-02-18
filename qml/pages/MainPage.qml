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

    // not working
    /*SilicaFlickable {
        id: ueberblickPageFlickable
        anchors.fill: parent
        contentHeight: ueberblickListView.height

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
    }*/

    Component {
        id: ueberblickListComponent

        Rectangle {
            id: ueberblickRectangle
            width: parent.width; height: ueberblickteasersImage.height + ueberblickteaserstoplineLabel.height + ueberblickteaserstopsshorttextLabel.height
            color: "transparent"

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
                anchors { top: ueberblickteasersImage.bottom; horizontalCenter: parent.horizontalCenter }
                width: 480
                wrapMode: Text.WordWrap
                text: modelData.topline
                font.bold: true
                color: Theme.highlightColor
            }

            Label {
                id: ueberblickteaserstopsshorttextLabel
                anchors { top: ueberblickteaserstoplineLabel.bottom; horizontalCenter: parent.horizontalCenter }
                width: 480
                wrapMode: Text.WordWrap
                text: modelData.shorttext
                color: Theme.secondaryColor
            }
        }
    }

    SilicaListView {
        id: ueberblickListView
        anchors.fill: ueberblickPage
        model: ueberblick.teasers
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

                    MouseArea {
                        id: ueberblicktopstoriesMouseArea
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("DetailsPage.qml"))
                    }
                }

                Rectangle {
                    id:topstoriesaudio
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: topstoriesaudioIcon.height && topstoriesaudioLabel.height
                    color: "transparent"
                    visible: topstoriesaudioLabel.text.length > 0

                    Image {
                        id: topstoriesaudioIcon
                        anchors.left: parent.left
                        source: "images/audio.svg"
                        width: 40
                        height: 40
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        visible: false
                    }

                    ColorOverlay {
                        anchors.fill: topstoriesaudioIcon
                        source: topstoriesaudioIcon
                        color: Theme.secondaryColor
                    }

                    Label {
                        id: topstoriesaudioLabel
                        anchors.right: parent.right
                        width: 430
                        wrapMode: Text.WordWrap
                        text: {
                            if (ueberblick.topstories[0]["multimedia-buttons"].length === 1) {
                                if (ueberblick.topstories[0]["multimedia-buttons"][0].type === "audio") {
                                    return topstoriesaudioLabel.text = ueberblick.topstories[0]["multimedia-buttons"][0].headline;
                                }
                                return ""
                            }
                        }
                        color: Theme.highlightColor
                        font.bold: true
                    }

                    MouseArea {
                        id: topstoriesaudioMouseArea
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("DetailsPage.qml"))
                    }
                }
                Rectangle {
                    id:topstoriesvideo
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: topstoriesvideoIcon.height && topstoriesvideoLabel.height
                    color: "transparent"
                    visible: topstoriesvideoLabel.text.length > 0

                    Image {
                        id: topstoriesvideoIcon
                        anchors.left: parent.left
                        source: "images/video.svg"
                        width: 40
                        height: 40
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        visible: false
                    }

                    ColorOverlay {
                        anchors.fill: topstoriesvideoIcon
                        source: topstoriesvideoIcon
                        color: Theme.secondaryColor
                    }

                    Label {
                        id: topstoriesvideoLabel
                        anchors.right: parent.right
                        width: 430
                        wrapMode: Text.WordWrap
                        text: {
                            if (ueberblick.topstories[0]["multimedia-buttons"][0].type === "video") {
                                    return topstoriesvideoLabel.text = ueberblick.topstories[0]["multimedia-buttons"][0].headline;
                                }
                            return ""
                        }
                        color: Theme.highlightColor
                        font.bold: true
                    }

                    MouseArea {
                        id: topstoriesvideoMouseArea
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("DetailsPage.qml"))
                    }
                }
            }
        }
    }
    VerticalScrollDecorator { flickable: ueberblickListView }
}

