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
    id: impressumPage

    property var impressum

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://www.tagesschau.de/api/impressum/mobileappimpressum100.json";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                parseFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function parseFunction(responseText) {
        impressum = JSON.parse(responseText);
    }

    Component.onCompleted: {
        getData()
    }

    Component {
        id: impressumListComponent

        Label {
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }

            wrapMode: Text.WordWrap
            horizontalAlignment: modelData.paragraphStyle === "absatz" ? Text.AlignLeft : Text.AlignHCenter
            font.bold: modelData.paragraphStyle !== "absatz"
            text: modelData.text
            color: modelData.paragraphStyle === "absatz" ? Theme.secondaryColor : Theme.highlightColor
        }
    }

    SilicaListView{
        id: impressumListView
        anchors.fill: impressumPage
        model: impressum.copytext
        delegate: impressumListComponent
        header: Column {
            id: impressumColumn
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width

            PageHeader {
                id: impressumPageHeader
                title: impressum.topline
            }
        }
        footer: Button {
            id: datenshutzButton
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            text: "Datenschutzerklärung"
            onClicked: pageStack.push(Qt.resolvedUrl("DatenschutzPage.qml"))
            color: Theme.highlightColor
            visible: impressumPageHeader.text.length > 0
        }
    }
    VerticalScrollDecorator { flickable: impressumListView }
}
