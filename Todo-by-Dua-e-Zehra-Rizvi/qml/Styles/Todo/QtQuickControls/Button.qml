import QtQuick
import QtQuick.Controls as QQC
import QtQuick.Templates as T
import Styles.Todo

T.Button {
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
    font.pointSize: 14
    contentItem: Label {
        text: root.text
        color: root.checkable && root.checked ? Theme.button.textChecked : Theme.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font: root.font
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
            visible: root.checkable && root.checked
            color: Theme.button.backgroundChecked
            radius: root.height / 2
        }
    }
}
