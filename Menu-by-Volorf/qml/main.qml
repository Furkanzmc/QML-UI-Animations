import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    id: mainWindow
    visible: true
    width: 320
    height: 480
    title: qsTr("Hello World")

    Menu {
        id: cl
        width: parent.width
        height: parent.height
        collapsedHeight: mainWindow.height * 0.1

        MenuItem {
            color: "#D77EFC"
            collapsed: cl.collapsed
            index: 0
            title: "SERVICES"
            icon: "qrc:/images/services@2x.png"
        }

        MenuItem {
            color: "#FC6F61"
            collapsed: cl.collapsed
            index: 1
            title: "JOBS"
            icon: "qrc:/images/work@2x.png"
        }

        MenuItem {
            color: "#18A0FA"
            collapsed: cl.collapsed
            index: 2
            title: "AUTO"
            icon: "qrc:/images/auto@2x.png"
        }

        MenuItem {
            color: "#94C325"
            collapsed: cl.collapsed
            index: 3
            title: "REALTY"
            icon: "qrc:/images/realty@2x.png"
        }
    }
}
