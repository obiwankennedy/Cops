import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:root
    property alias source: img.source
    implicitHeight: img.implicitHeight
    implicitWidth:  img.implicitWidth
    onXChanged: console.log("x: "+x+" y: "+y)
    onYChanged: console.log("x: "+x+" y: "+y)

    Image
    {
        id: img
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }
    Drag.active: mouse.drag.active

    MouseArea {
        id: mouse
        anchors.fill: parent
        property int previousX : 0
        property int previousY : 0

        drag.target: parent
        onWheel: {
            if(wheel.angleDelta.y>0)
            {
                parent.scale -= 0.1
            }
            else
                parent.scale += 0.1

            console.log(" rotation:"+parent.scale)
        }
    }

    DropShadow {
        anchors.fill: img
        horizontalOffset: 8
        verticalOffset: 8
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: img

    }
}
