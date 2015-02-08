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
    id: ueberPage

    PageHeader {
        id: header
        title: "Menü"
        height: 80
        width: ueberPage.width
        anchors.left: parent.left
        anchors.top: parent.top
    }

     ListModel {
         id: menuModel
         ListElement { name: "Inland"; icon: "images/inland.svg"; page: "InlandPage.qml" }
         ListElement { name: "Ausland"; icon: "images/ausland.svg"; page: "AuslandPage.qml" }
         ListElement { name: "Wirtschaft"; icon: "images/wirtschaft.svg"; page: "WirtschaftPage.qml" }
         ListElement { name: "Regional"; icon: "images/regional.svg"; page: "RegionalPage.qml" }
         ListElement { name: "Wetter"; icon: "images/wetter.svg"; page: "WetterPage.qml" }
         ListElement { name: "Kultur"; icon: "images/kultur.svg"; page: "KulturPage.qml" }
         ListElement { name: "Video"; icon: "images/video.svg"; page: "VideoPage.qml" }
         ListElement { name: "Audio"; icon: "images/audio.svg"; page: "AudioPage.qml" }
         ListElement { name: "Bilder"; icon: "images/bilder.svg"; page: "BilderPage.qml" }
         ListElement { name: "Impressum"; icon: "images/impressum.svg"; page: "ImpressumPage.qml" }
         ListElement { name: "Über"; icon: "images/ueber.svg"; page: "AboutPage.qml" }
         ListElement { name: "Kontakt"; icon: "images/kontakt.svg"; page: "KontaktPage.qml" }
     }

     Component {
         id: menuDelegate

         Item {
             width: 240; height: Theme.itemSizeSmall

             Image {
                 id: menuIcon
                 anchors.horizontalCenter: parent.horizontalCenter
                 source: icon
                 width: 70
                 height: 70
                 smooth: true
                 fillMode: Image.PreserveAspectFit
             }
             ColorOverlay {
                 anchors.fill: menuIcon
                 source: menuIcon
                 color: Theme.secondaryColor
             }

             Text {
                 anchors { top: menuIcon.bottom; horizontalCenter: parent.horizontalCenter }
                 text: name
                 color: Theme.highlightColor
             }
             MouseArea {
                 id: menuPage
                 anchors.fill: parent
                 onClicked: pageStack.push(Qt.resolvedUrl(page))
             }
         }
     }

     SilicaGridView {
         id: menuGrid
         cellWidth: 240; cellHeight: 140
         width: 480; height: 900
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.top: header.bottom
         anchors.topMargin: Theme.paddingLarge
         model: menuModel
         delegate: menuDelegate
     }
}
