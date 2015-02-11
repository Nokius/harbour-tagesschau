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


/*TODO:
  Button Datenschuterklaerung vertecken
  Aktualisieren testen!
  die ID los werden in der mail
  */

Page {
    id: impressumPage

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://www.tagesschau.de/api/impressum/mobileappimpressum100.json";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                praseFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function praseFunction(responseText) {
        var impressum = JSON.parse(responseText);

        ueberschriftText.text = impressum.copytext[0].text;
        adresseText.text = impressum.copytext[1].text;
        idnummerText.text = impressum.copytext[2].text;
        infoText.text = impressum.copytext[3].text;
        chefredaktionText.text = impressum.copytext[4].text;
        kontaktText.text = impressum.copytext[5].text;
        haftungshinweisText.text = impressum.copytext[6].text;
        datenschutzText.text = impressum.copytext[7].text;
    }

    Component.onCompleted: {
        getData()
    }

    SilicaFlickable {
        id: impressumPageFlickable
        anchors.fill: parent
        contentHeight: impressumColumn.height

        PullDownMenu {
            MenuItem {
                text: "Aktualisieren"
                onClicked: getData()
            }
        }

        Column {
            id: impressumColumn
            width: impressumPage.width
            spacing: 15

            PageHeader {
                title: "Impressum"
            }

            Text {
                id: ueberschriftText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                font.bold: true
                text: ""
                color: Theme.secondaryColor
            }

            Text {
                id: adresseText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }

            Text {
                id: idnummerText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }

            Text {
                id: infoText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }

            Text {
                id: chefredaktionText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }

            Text {
                id: kontaktText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }

            Text {
                id: haftungshinweisText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }
            Text {
                id: datenschutzText
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }
            Button {
                id: datenshutzButton
                anchors.horizontalCenter: parent.horizontalCenter
                width: 300
                text: "Datenschutzerklärung"
                onClicked: pageStack.push(Qt.resolvedUrl("DatenschutzPage.qml"))
                color: Theme.highlightColor
                visible: ueberschriftText.text.length > 0
            }
        }
    }
    VerticalScrollDecorator { flickable: impressumPageFlickable }
}
