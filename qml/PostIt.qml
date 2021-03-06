import QtQuick 2.0
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0


Item {
    id: root
    property int size: 920
    property alias text: footer.text
    property alias font: footer.font
    property alias color: rect.color
    property alias hAlign: footer.horizontalAlignment
    property alias vAlign: footer.verticalAlignment

    onXChanged: console.log("x: "+x+" y: "+y)
    onYChanged: console.log("x: "+x+" y: "+y)
    Rectangle
    {
        id:rect
        anchors.fill: parent
        TextArea {
            id: footer
            /*anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right*/
            anchors.fill:parent

            color: "black"
          //  font.pixelSize: 2*root.marge
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            //font.bold: true

        }


    }
    Drag.active: mouse.drag.active

    MouseArea {
        id: mouse
        anchors.fill: parent
        drag.target: parent
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
        anchors.fill: rect
        horizontalOffset: 8
        verticalOffset: 8
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: rect
    }
}
