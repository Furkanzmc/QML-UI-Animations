import QtQuick
import Templates.Todo.Window as T

T.NavigationBar {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    spacing: 6
    topPadding: 0
    leftPadding: 4
    rightPadding: actionsContent.implicitWidth + spacing * 5 + leftPadding
    bottomPadding: 0
    actionsContainer: actionsContent
    actions: [
        NewEventButton { }
    ]
    background: Item {
        implicitWidth: 100
        implicitHeight: 30

        Row {
            id: actionsContent
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: root.leftPadding
            }
            spacing: root.spacing
        }
    }
    contentItem: ListView {
        implicitWidth: contentWidth
        implicitHeight: contentHeight
        model: root.contentModel
        currentIndex: root.currentIndex
        spacing: root.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
    }
    delegate: NavigationBarButton {
        required property string name

        text: name
    }
}
