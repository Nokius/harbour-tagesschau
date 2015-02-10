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

//TODO http://www.tagesschau.de/api/datenschutzerklaerung100.json

Page {
    id: datenschutzPage

    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url =  "http://www.tagesschau.de/api/datenschutzerklaerung100.json";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                praseFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function praseFunction(responeText) {
        var datenschutzerklaerung = JSON.parse(responeText);

        datenschutzPageHeader.title = datenschutzerklaerung.topline;
        info0Header.text = datenschutzerklaerung.headline;
        info0aText.text = datenschutzerklaerung.copytext[0].text;
        info1Header.text = datenschutzerklaerung.copytext[1].text;
        info1aText.text = datenschutzerklaerung.copytext[2].text;
        info2Header.text = datenschutzerklaerung.copytext[3].text;
        info2aText.text = datenschutzerklaerung.copytext[4].text;
        info3Header.text = datenschutzerklaerung.copytext[5].text;
        info3aText.text = datenschutzerklaerung.copytext[6].text;
        info3bText.text = datenschutzerklaerung.copytext[7].text;
        info3cText.text = datenschutzerklaerung.copytext[8].text;
        info4Header.text = datenschutzerklaerung.copytext[9].text;
        info4aText.text = datenschutzerklaerung.copytext[10].text;
        info4bText.text = datenschutzerklaerung.copytext[11].text;
        info4cText.text = datenschutzerklaerung.copytext[12].text;
        info5Header.text = datenschutzerklaerung.copytext[13].text;
        info5aText.text = datenschutzerklaerung.copytext[14].text;
        info5bText.text = datenschutzerklaerung.copytext[15].text;
        info5cText.text = datenschutzerklaerung.copytext[16].text;
        info6Header.text = datenschutzerklaerung.copytext[17].text;
        info6aText.text = datenschutzerklaerung.copytext[18].text;
        info7Header.text = datenschutzerklaerung.copytext[19].text;
        info7aText.text = datenschutzerklaerung.copytext[20].text;
        info8Header.text = datenschutzerklaerung.copytext[21].text;
        info8aText.text = datenschutzerklaerung.copytext[22].text;
        info9Header.text = datenschutzerklaerung.copytext[23].text;
        info9aText.text = datenschutzerklaerung.copytext[24].text;
        info9bText.text = datenschutzerklaerung.copytext[25].text;
        info9cText.text = datenschutzerklaerung.copytext[26].text;
        info10Header.text = datenschutzerklaerung.copytext[27].text;
        info10aText.text = datenschutzerklaerung.copytext[28].text;
        info10bText.text = datenschutzerklaerung.copytext[29].text;
        info10cText.text = datenschutzerklaerung.copytext[30].text;
    }

    Component.onCompleted: {
        getData()
    }

   SilicaFlickable {
       id: datenschutzPageFlickable
       anchors.fill: parent
       contentHeight: datenschutzColumn.height

       Column {
           id: datenschutzColumn
           width: datenschutzPage.width
           spacing: 15

           PageHeader {
               id: datenschutzPageHeader
               title: ""
           }

           Text {
               id: info0Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               font.bold: true
               text: ""
               color: Theme.secondaryColor
           }

           Text {
               id: info0aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info1Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info1aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info2Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info2aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info3Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info3aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info3bText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info3cText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info4Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info4aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info4bText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info4cText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info5Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info5aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info5bText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info5cText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info6Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info6aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info7Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info7aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }


           Text {
               id: info8Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }


           Text {
               id: info8aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }


           Text {
               id: info9Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info9aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info9bText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info9cText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info10Header
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
               font.bold: true
           }

           Text {
               id: info10aText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }


           Text {
               id: info10bText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }

           Text {
               id: info10cText
               anchors.horizontalCenter: parent.horizontalCenter
               width: 480
               wrapMode: Text.WordWrap
               text: ""
               color: Theme.highlightColor
           }
       }
   }
   VerticalScrollDecorator { flickable: datenschutzPageFlickable }
}
