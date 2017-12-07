import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:root
    property alias source: img.source
    property int size: 920
    property int marge: size/18.4
    property real ratio : 92/73
    property alias text: footer.text
    property alias text2: footer2.text
    property int fontSize: 16
    property alias font: footer.font
    property alias font2: footer2.font

    height: size+7*marge
    width: size*ratio+2*marge
    Rectangle
    {
        id: pola

        anchors.fill: parent
        color: "white"

        Image
        {
            id: img
            x:marge
            y:marge
            width: root.size*ratio;// sourceSize.width;
            height: root.size;
            clip: true
            fillMode: Image.PreserveAspectCrop
        }
        Text {
            id: footer
            anchors.bottom: parent.bottom
            anchors.top: img.bottom
            anchors.left: parent.left
            color: "black"
            font.pixelSize: root.fontSize
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.bold: true
        }
        Text {
            id: footer3
            anchors.bottom: parent.bottom
            anchors.top: img.bottom
            anchors.left: footer.right
            anchors.right: footer2.left
            color: "black"
            text: "-"
            visible: root.text2.length > 0
            font.pixelSize: root.fontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
        }
        Text {
            id: footer2
            anchors.bottom: parent.bottom
            anchors.top: img.bottom
            anchors.right: parent.right
            color: "black"
            font.pixelSize: root.fontSize
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.bold: true
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
            console.log(root.text+" x:"+root.x+" y:"+root.y)
        }
        onWheel: {
            if(wheel.angleDelta.y>0)
            {
                parent.rotation -= 5
            }
            else
                parent.rotation += 5

            console.log(root.text+" rotation:"+parent.rotation)
        }
    }

    DropShadow {
        anchors.fill: pola
        horizontalOffset: 8
        verticalOffset: 8
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: pola
        //rotation: -30
    }
}
