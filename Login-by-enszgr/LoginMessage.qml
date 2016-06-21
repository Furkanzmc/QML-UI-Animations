import QtQuick 2.5
import QtGraphicalEffects 1.0

Item {
    property alias text: label.text
    property alias fontColor: label.color
    property alias font: label.font

    id: root

    DropShadow {
        anchors.fill: rect
        horizontalOffset: 0
        verticalOffset: 1
        radius: 16.0
        samples: 16
        color: "#424242"
        opacity: 0.2
        source: rect
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        antialiasing: true
        color: "white"

        Text {
            id: label
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            clip: true
            focus: root.focus
            font {
                pixelSize: height * 0.5
            }
            verticalAlignment: TextInput.AlignVCenter
            horizontalAlignment: TextInput.AlignHCenter
            color: "#34495e"
        }
    }
}
