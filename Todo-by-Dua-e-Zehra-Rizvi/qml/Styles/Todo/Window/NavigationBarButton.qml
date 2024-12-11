import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import Styles.Todo

T.TabButton {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding) + implicitIndicatorWidth
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight)
    topPadding: 10
    leftPadding: 10
    rightPadding: 10
    bottomPadding: 10
    spacing: 4
    font {
        pointSize: 16
        bold: root.checkable && root.checked
    }
    contentItem: Label {
        text: root.text
        color: root.checkable && root.checked ? Theme.button.textChecked : Theme.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font: root.font

        Behavior on color {
            ColorAnimation {
                duration: 250
            }
        }
    }
    background: Item {
        implicitWidth: 30
        implicitHeight: 26

        Rectangle {
            anchors.fill: parent
            border {
                color: Theme.button.backgroundChecked
                width: 2
            }
            color: "transparent"
            radius: root.height / 2
        }

        Rectangle {
            anchors.fill: parent
            visible: opacity > 0
            opacity: root.checkable && root.checked ? 1 : 0
            color: Theme.button.backgroundChecked
            radius: root.height / 2

            Behavior on opacity {
                NumberAnimation {
                    duration: 250
                }
            }
        }
    }
}

