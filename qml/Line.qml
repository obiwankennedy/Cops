import QtQuick 2.0
import QtQuick.Controls 2.1

Item
{
    id: root
    property real x1: 0
    property real y1: 0

    property var xlist: []
    property var ylist: []
    property real penWidth: 0
    property string color: "red"


    Canvas {
        id: line
        anchors.fill: parent

        onPaint : {
            var ctx = getContext("2d")
            ctx.strokeStyle = root.color
            ctx.lineWidth = root.penWidth
            ctx.beginPath()
            ctx.lineCap = "round"
            ctx.moveTo(root.x1,root.y1)
            for(var i = 0; i<xlist.length;++i)
            {
                ctx.lineTo(xlist[i],ylist[i])
            }
            ctx.stroke();
        }
    }
}
