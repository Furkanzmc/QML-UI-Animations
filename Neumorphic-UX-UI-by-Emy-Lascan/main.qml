import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 800
    height: 600
    visible: true
    color: "white"

    PowerButton {
        width: 200
        height: 200
        anchors.centerIn: parent
    }
}
