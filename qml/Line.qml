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
            var heightOfArrow = app.height/20
            var lineW = 4
            var ctx = getContext("2d")
            ctx.beginPath()
            ctx.moveTo(x1,y1)
            ctx.lineTo(x2,y2)
            ctx.fillStyle = gradient
            ctx.fill();

            ctx.fillStyle = "red"
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
        }
    }
}
