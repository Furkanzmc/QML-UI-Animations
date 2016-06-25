import QtQuick 2.6
import QtQuick.Window 2.2
// Local Import
import "qml"

Window {
    id: mainWindow
    visible: true
    width: 720
    height: 1000
    color: "#A0B1C0"

    Card {
        id: card
        anchors.centerIn: parent
        width: mainWindow.width * 0.5
        height: mainWindow.height * 0.5
        imageSource: "qrc:/images/canada.jpg"
        latInfo: "NORTH 56"
        countryName: "CANADA"
        lngInfo: "WEST 106"
        caption: "A beautiful place to visit next time we decide to hangout"
    }
}
