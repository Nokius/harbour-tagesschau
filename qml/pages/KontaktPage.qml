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
    id: kontaktPage

    Column {
        id: column
        width: kontaktPage.width

        PageHeader {
            title: "Kontakt"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 500
            wrapMode: Text.WordWrap
            text: "Hier können Sie Kontakt mit der Tagesschau aufnehmen, um zu bereichten, was Sie gesehen oder erlebt haben. An die E-Mail können Sie zudem auch ein eigenes Foto oder Video anhängen:"
            color: Theme.highlightColor
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            text: "Email"
            onClicked: Qt.openUrlExternally("mailto:redaktion@tagesschau.de?subject=Bericht")
        }
    }
}
