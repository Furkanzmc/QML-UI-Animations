import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    id: mainWindow
    visible: true
    width: 350
    height: 550
    title: qsTr("Menu Drop by galshir")
    color: "#833B6B"

    GridLayout {
        id: grid
        columns: mainWindow.width > 300 ? 2 : 1
        anchors.centerIn: parent
        visible: false

        Text { text: "Three"; font.bold: true; }
        Text { text: "words"; color: "red" }
        Text { text: "in"; font.underline: true }
        Text { text: "a"; font.pixelSize: 20 }
        Text { text: "row"; font.strikeout: true }
    }

    GridLayout {
        anchors.fill: parent
        columns: mainWindow.width > 450 ? 2: 1
        visible: true
        flow: columns === 2 ? GridLayout.LeftToRight : GridLayout.TopToBottom

        Column {
            id: topColumn
            width: 130
            spacing: 30
            Layout.alignment: Qt.AlignCenter

            Rectangle {
                width: 130
                height: 130
                anchors.horizontalCenter: parent.horizontalCenter
                radius: height / 2
                color: "#4E2356"
                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                width: 200
                height: 20
                anchors.horizontalCenter: parent.horizontalCenter
                radius: height / 2
                color: "#4E2356"
            }
        }

        Column {
            id: bottomColumn
            width: 270
            spacing: 15
            Layout.alignment: Qt.AlignCenter

            Repeater {
                model: 3
                delegate: Rectangle {
                    width: 180 * (index % 2 ? 1.5 : 1.0)
                    height: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: height / 2
                    color: "#4E2356"
                }
            }
        }
    }
}
