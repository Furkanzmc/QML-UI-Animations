import QtQuick 2.5

Item {
    signal clicked
    signal cancelled
    property color color: "white"
    property color closeColor: "#516C8D"
    property color currentColor: color

    id: root
    state: "menu"
    states: [
        State {
            name: "menu"

            PropertyChanges { target: root; currentColor: color }
        },
        State {
            name: "close"
            PropertyChanges { target: firstBar; y: secondBar.y - secondBar.height * 1.4 + root.getCloseOffset(); rotation: 45 }
            PropertyChanges { target: secondBar; opacity: 0 }
            PropertyChanges { target: thirdBar; y: secondBar.y + secondBar.height * 1.4 - root.getCloseOffset(); rotation: -45 }
            PropertyChanges { target: root; currentColor: closeColor }
        }
    ]
    transitions: [
        Transition {
            from: "*"; to: "*";

            NumberAnimation { properties: "opacity, rotation, y"; duration: 250 }
        }
    ]

    Rectangle {
        id: firstBar
        width: parent.width
        height: (parent.height / 3) * 0.7
        x: secondBar.x
        y: secondBar.y - secondBar.height * 1.4
        color: root.currentColor
        radius: 20
        transformOrigin: Item.Center
    }

    Rectangle {
        id: secondBar
        width: parent.width
        height: (parent.height / 3) * 0.7
        anchors.centerIn: parent
        radius: 20
        color: root.currentColor
        transformOrigin: Item.Center
    }

    Rectangle {
        id: thirdBar
        width: parent.width
        height: (parent.height / 3) * 0.7
        x: secondBar.x
        y: secondBar.y + secondBar.height * 1.4
        color: root.currentColor
        radius: 20
        transformOrigin: Item.Center
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (root.state === "menu") {
                root.clicked();
                root.state = "close";
            }
            else {
                root.cancelled();
                root.state = "menu";
            }
        }
    }

    function getCloseOffset() {
        // Use the triangle formula
        var h = Math.sqrt(Math.pow(firstBar.width, 2) + Math.pow(firstBar.height, 2));
        return h / 4;
    }

    function switchToMenu(cardColor) {
        root.color = cardColor;
        root.state = "menu";
    }
}
