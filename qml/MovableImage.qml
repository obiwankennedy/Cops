import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:root
    property alias source: img.source
    implicitHeight: img.implicitHeight
    implicitWidth:  img.implicitWidth
    Image
    {
        id: img
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
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
            root.x += (mouse.x-previousX)*root.scale
            root.y += (mouse.y-previousY)*root.scale
            previousX = mouse.x
            previousY = mouse.y
            console.log(root.text+" x:"+root.x+" y:"+root.y)
        }
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
