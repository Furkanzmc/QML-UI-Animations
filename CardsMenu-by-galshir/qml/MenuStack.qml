import QtQuick 2.6

Item {
    signal cardSelected(var card)
    signal menuCancelled
    signal menuOpened

    id: root
    onCardSelected: menuButton.switchToMenu(card.oppositeColor);

    MenuCard {
        id: card1
        index: 0
        color: "#563761"
        oppositeColor: "#A7425C"
        width: parent.width
        height: parent.height
        title: "Contact"
        menuButtonSize: Qt.size(menuButton.width, menuButton.height)
        menuButtonLeftMargin: menuButton.anchors.leftMargin
    }

    MenuCard {
        id: card2
        index: 1
        color: "#A7425C"
        oppositeColor: "#FFE26F"
        width: parent.width
        height: parent.height
        title: "About"
        menuButtonSize: Qt.size(menuButton.width, menuButton.height)
        menuButtonLeftMargin: menuButton.anchors.leftMargin
    }

    MenuCard {
        id: card3
        index: 2
        color: "#F3825F"
        oppositeColor: "#563761"
        width: parent.width
        height: parent.height
        title: "Team"
        menuButtonSize: Qt.size(menuButton.width, menuButton.height)
        menuButtonLeftMargin: menuButton.anchors.leftMargin
    }

    MenuCard {
        id: card4
        index: 3
        color: "#FFE26F"
        oppositeColor: "#A7425C"
        width: parent.width
        height: parent.height
        title: "Projects"
        menuButtonSize: Qt.size(menuButton.width, menuButton.height)
        menuButtonLeftMargin: menuButton.anchors.leftMargin
        current: true
    }

    MenuButton {
        id: menuButton
        width: 60
        height: 45
        anchors {
            top: parent.top
            left: parent.left
            topMargin: height * 0.3
            leftMargin: width * 0.3
        }
        onClicked: root.menuOpened()
        onCancelled: root.menuCancelled()
    }
}
