import QtQuick 2.0

Item {
    signal clicked
    signal cancelled
    property color color: "white"

    id: root
    state: "menu"
    states: [
        State { name: "menu" },
        State {
            name: "close"
            PropertyChanges { target: firstBar; y: secondBar.y - secondBar.height * 1.4 + root.getCloseOffset(); rotation: 45 }
            PropertyChanges { target: secondBar; opacity: 0 }
            PropertyChanges { target: thirdBar; y: secondBar.y + secondBar.height * 1.4 - root.getCloseOffset(); rotation: -45 }
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
        color: root.color
        radius: 20
        transformOrigin: Item.Center
    }

    Rectangle {
        id: secondBar
        width: parent.width
        height: (parent.height / 3) * 0.7
        anchors.centerIn: parent
        radius: 20
        color: root.color
        transformOrigin: Item.Center
    }

    Rectangle {
        id: thirdBar
        width: parent.width
        height: (parent.height / 3) * 0.7
        x: secondBar.x
        y: secondBar.y + secondBar.height * 1.4
        color: root.color
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
