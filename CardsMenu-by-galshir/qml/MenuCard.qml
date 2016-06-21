import QtQuick 2.6

Rectangle {
    property int index: 0
    property size menuButtonSize
    property int menuButtonLeftMargin

    property bool current
    property color oppositeColor
    property string title

    id: root
    state: "closed"
    states: [
        State { name: "closed" },
        State {
            name: "menu"
            PropertyChanges { target: root; x: getMenuPos().x; y: getMenuPos().y }
            PropertyChanges { target: mouseArea; visible: true }
            PropertyChanges { target: cardTitle; anchors.leftMargin: root.menuButtonSize.width * 0.5; anchors.topMargin: root.menuButtonSize.height * 0.3 }
            PropertyChanges { target: root; radius: 10 }
        },
        State {
            name: "hidden"
            PropertyChanges { target: root; x: root.width; y: (index + 1) * root.height * 0.05 }
            PropertyChanges { target: mouseArea; visible: false }
        }
    ]
    transitions: [
        Transition {
            from: "*"
            to: "*"

            NumberAnimation { target: root; properties: "x, y, radius"; duration: 500; easing.type: Easing.OutQuint }
            NumberAnimation { target: cardTitle; properties: "anchors.leftMargin, anchors.topMargin"; duration: 500; easing.type: Easing.OutQuint }
        }
    ]

    Text {
        id: cardTitle
        text: root.title.toUpperCase()
        anchors {
            top: parent.top
            left: parent.left
            topMargin: root.menuButtonSize.height * 0.5
            leftMargin: root.menuButtonSize.width * 1.25 + root.menuButtonLeftMargin
        }
        font {
            pointSize: 18
            bold: true
        }
        color: root.oppositeColor
    }

    MouseArea {
        id: mouseArea
        visible: false
        anchors.fill: parent
        onClicked: {
            root.parent.cardSelected(root);
        }
    }

    Connections {
        target: root.parent
        onCardSelected: {
            if (card.index === root.index) {
                root.state = "closed";
                root.current = true;
            }

            root.state = root.state === "menu" ? "hidden" : "closed";
            root.current = root.state === "closed";
        }
        onMenuOpened: {
            root.state = "menu";
        }
        onMenuCancelled: {
            root.state = root.current ? "closed" : "hidden";
        }
    }

    function getMenuPos() {
        return Qt.point((index + 1) * root.width * 0.05, (index + 1) * root.height * 0.05 + root.menuButtonSize.height / 2 + cardTitle.height * 0.25)
    }
}
