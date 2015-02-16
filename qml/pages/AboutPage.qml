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
    id: aboutPage

    SilicaFlickable {
        id: aboutPageFlickable
        anchors.fill: parent
        contentHeight: aboutColumn.height

        Column {
            id: aboutColumn
            width: aboutPage.width

            PageHeader {
                title: "Über"
            }
            Text {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: "Tagesschau für Sailfish OS\n alpha1"
                color: Theme.highlightColor
            }
            GlassItem {
                height: Theme.paddingLarge
                width: parent.width
                color: Theme.highlightColor
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: "Diese Version der Tagesschau App wurde durch Reverse Engineering der Tagesschau API entwickelt. Die Applikation wurde mit QML erzeugt."
                color: Theme.highlightColor
            }
            SectionHeader {
                text: "Dank"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: "An dieser Stelle besten Dank an Coderus, ejjoman, faniel, M4rtinK und SK_works für Ihre Hilfe."
                color: Theme.highlightColor
            }

            SectionHeader {
                text: "Lizenz"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: "Dieses Program wurde unter der WTFPL veröffentlicht."
                color: Theme.highlightColor
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 300
                text: "Mehr über die WTFPL Lizenz"
                color: Theme.highlightColor
                onClicked: { Qt.openUrlExternally("http://www.wtfpl.net/")
                }
            }
            SectionHeader {
                text: "Quelltext"
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                text: "Den Quellcode finden Sie auf Github"
                color: Theme.highlightColor
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 300
                text: "Mehr auf Github"
                color: Theme.highlightColor
                onClicked: { Qt.openUrlExternally("https://github.com/Nokius/harbour-tagesschau")
                }
            }
            SectionHeader {
                text: "Icons"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: "Die verwendeten Icons stammen aus dem The Noun Project."
                color: Theme.highlightColor
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 300
                text: "Mehr über das The Noun Project"
                color: Theme.highlightColor
                onClicked: { Qt.openUrlExternally("http://thenounproject.com/about/")
                }
            }
        }
    }
    VerticalScrollDecorator { flickable: aboutPageFlickable }
}
