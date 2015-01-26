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

CoverBackground {
    Image {
        id: coverImage
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/cover.png"
        opacity: 0.6
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: coverImage.bottom
        //anchors.centerIn: parent
        text: "Tagesschau"
    }

    /*CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-cover-refresh"
            action TODO
        }
    }*/
}


