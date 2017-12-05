import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0


ApplicationWindow {
    id: window
    visible: true
    width: 1800
    height: 1020
    color: "grey"
    title: qsTr("Hello World")


    Item {
        id: plate
        width: parent.width*8
        height: parent.height*8



        Image {
            source: "qrc:/img/cork_fin.png"
            fillMode: Image.Tile
            x:0
            y:0
            width: plate.width//+Math.abs(plate.x)
            height: plate.height//+Math.abs(plate.y)

            MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    plate.x += mouse.x-previousX
                    plate.y += mouse.y-previousY
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        parent.rotation -= 1
                    }
                    else
                        parent.rotation += 1
                }
            }
        }


        PolaroidImage {
            id: headshot
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/Lynn.jpg"
            text: " Lynn Gray-Rike  - "
            text2: "HeadShot "
            rotation: -30
        }
        PolaroidImage {
            id: captainPoubelle
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/Guillermo_Gonzalvez.jpg"
            text: " Guillermo Gonzalvez - "
            text2: "Captain Poubelle "
            rotation: -30
        }
        PolaroidImage {
            id: columbo
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/max_ohara_bis4.jpg"
            text: " Max O'Hara  - "
            text2: "Columbo "
            rotation: -30
        }
        PolaroidImage {
            id: luckytarget
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/Denis_Aquillian.jpg"
            text: " Denis Aquillian  - "
            text2: "Lucky Target "
            rotation: -30
        }
        PolaroidImage {
            id: rick
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/Rick_Darcy.jpg"
            text: " Rick Darcy "
            text2: " "
            rotation: -30
        }
        PolaroidImage {
            id: kim
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/Khu_Ying_Kim_square.jpg"
            text: " Khu Ying Kim "
            text2: " "
            rotation: -30
        }
        PolaroidImage {
            id: atm
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/Christopher_Atkins.jpg"
            text: " Christopher Atkins  - "
            text2: "ATM "
            rotation: -30
        }
        PolaroidImage {
            id: image
            x: window.width*0.3
            y: window.height*0.3
            size: 200
            source: "qrc:/img/Anpaytoo_Yepa_square.jpg"
            text: " Anpaytoo Yepa  "
            text2: " "
            rotation: -30
        }

        PostIt {
            id: post1
            x: window.width*0.6
            y: window.height*0.6
            width: 200
            height: 150
        }
        DropShadow {
            anchors.fill: post1
            horizontalOffset: 8
            verticalOffset: 8
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: post1
        }

        Line {
            anchors.fill: parent
            x1: window.width*0.3
            y1: window.height*0.3
            x2: window.width*0.6
            y2: window.width*0.6
            penWidth: 8
        }

    }

}
