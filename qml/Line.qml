import QtQuick 2.0
import QtQuick.Controls 2.1

Item
{
    id: root
    property real x1: 0
    property real y1: 0
    property real x2: 0
    property real y2: 0
    property real penWidth: 0


    Canvas {
        id: line
        anchors.fill: parent

        onPaint : {
            var ctx = getContext("2d")
            ctx.strokeStyle = "red"
            ctx.lineWidth = root.penWidth
            ctx.beginPath()
            ctx.lineCap = "round"
            ctx.moveTo(root.x1,root.y1)
            ctx.lineTo(root.x2,root.y2)
            ctx.closePath()
            ctx.stroke();
        }
    }




   /* MouseArea {
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
        }
    }*/
}
