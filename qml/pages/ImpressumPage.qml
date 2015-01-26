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


//"TODO get http://www.tagesschau.de/api/impressum/mobileappimpressum100.json"


Page {
    id: impressumPage

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Ak­tu­a­li­sie­ren"
                onClicked: {
                    request('http://www.tagesschau.de/api/impressum/mobileappimpressum100.json', function (o) {

                        //log hte json
                        console.log(o.responseText);

                        //transalte response into object
                        var d = eval('new Object(' + o.responseText + ')');

                        // access elements inside json object with dor notation
                        impressumLabel.text = d.date
                    });
                }
            }
        }

        contentHeight: column.height

        Column {
            id: column
            width: impressumPage.width

            PageHeader {
                title: "Impressum"
            }
            Text {
                id: impressumLabel
                anchors.horizontalCenter: parent.horizontalCenter
                width: 480
                wrapMode: Text.WordWrap
                text: ""
                color: Theme.highlightColor
            }
        }
        function request(url, callback) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = (function(myxhr) {
                return function() {
                    callback(myxhr);
                }
            })(xhr);
            xhr.open('GET', url, true);
            xhr.send('');
        }
    }
}
