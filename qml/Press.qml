import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0


Item {
    id: root
    property int size: 1000
    property alias text: footer.text
    property alias font: footer.font
    property alias date: date.text
    property alias photo: photo.source
    property bool hasPhoto: false
    property alias article1: article.text
    property alias article2: article2.text

    FontLoader { id: gothi; source: "qrc:/font/newspaper.dump/fonts/CloisterBlack.ttf" }

    height: hasPhoto ? 480 : 220
    width: size

    Image
    {
        id:rect
        source: "qrc:/font/newspaper.dump/images/image_1.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            width: parent.width*0.9
            Text {
                id: newsPaper
                text: "Los Angeles Post"
                font {family: gothi.name; pixelSize: 60}
                Layout.alignment: Qt.AlignHCenter
            }
            Rectangle {
                color:"black"
                height: 2
                Layout.fillWidth: true
                Layout.margins: 5
            }

            Text {
                id: date
                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                color:"black"
                height: 2
                Layout.fillWidth: true
                Layout.margins: 5
            }

            TextArea {
                id: footer
                color: "black"
                readOnly: true
                font.pixelSize: 2*root.marge
                Layout.alignment: Qt.AlignHCenter
            }
            Item {
                visible: root.hasPhoto
                Layout.fillWidth: true
                height: root.height-220
                Image {
                    id: photo
                    anchors.top: parent.top
                    //anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    width: parent.width*0.33
                    fillMode: Image.PreserveAspectFit
                }
                Colorize {
                    anchors.fill: photo
                    source: photo
                    hue: 0.0
                    saturation: 0
                    lightness: 0
                }
                Text {
                    id: article
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: photo.right
                    anchors.leftMargin: 10
                    width: parent.width*0.33
                    elide: Text.ElideRight
                    wrapMode: Text.WordWrap
                    anchors.bottomMargin: 40
                }
                Text {
                    id: article2
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: article.right
                    anchors.right: parent.right
                    elide: Text.ElideRight
                    wrapMode: Text.WordWrap
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 40
                }

            }
        }

    }
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
            root.x += mouse.x-previousX
            root.y += mouse.y-previousY
            console.log("press "+text+" x:"+root.x+" y:"+root.y)
        }
        onWheel: {
            if(wheel.angleDelta.y>0)
            {
                parent.rotation -= 5
            }
            else
                parent.rotation += 5
        }
    }
    DropShadow {
        anchors.fill: rect
        horizontalOffset: 8
        verticalOffset: 8
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: rect
    }
}
