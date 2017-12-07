import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:root
    property alias source: img.source

    height: size+7*marge
    width: size*ratio+2*marge

    Image
    {
        id: img
        anchors.fill: parent
        clip: true
        fillMode: Image.PreserveAspectCrop
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
        anchors.fill: img
        horizontalOffset: 8
        verticalOffset: 8
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: img
        //rotation: -30
    }
}
