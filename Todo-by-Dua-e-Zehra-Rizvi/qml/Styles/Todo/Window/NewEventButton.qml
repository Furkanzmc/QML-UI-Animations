import QtQuick
import Templates.Todo.Window as T
import Styles.Todo

T.NewEventButton {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding) + implicitIndicatorWidth
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight)
    background: Rectangle {
        implicitWidth: 30
        implicitHeight: 30
        radius: height / 2
        color: Theme.newEventButton.background
        scale: root.pressed ? 0.9 : 1
    }
    contentItem: Item {
        scale: root.pressed ? 1.1 : 1

        Rectangle {
            anchors.centerIn: parent
            width: 2
            height: parent.height * 0.5
            color: Theme.newEventButton.plus
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.5
            height: 2
            color: Theme.newEventButton.plus
        }
    }
}
