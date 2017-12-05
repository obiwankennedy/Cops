import QtQuick 2.0
import QtQuick.Controls 2.1

Rectangle
{
    id: root
    property int size: 920
    property alias text: footer.text

    TextArea {
        id: footer
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "black"
        font.pixelSize: 2*root.marge
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.bold: true
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
