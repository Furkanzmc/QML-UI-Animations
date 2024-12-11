import QtQuick
import QtQuick.Templates
import Templates.Todo.Dashboard as T

T.DashboardItemClock {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    timeIndicator: timeInd
    nameIndicator: nameInd
    spacing: 4
    padding: 6
    contentItem: Item {
        implicitWidth: Math.max(timeInd.implicitWidth, nameInd.implicitWidth)
        implicitHeight: timeInd.implicitHeight + nameInd.implicitHeight + root.spacing

        Label {
            id: timeInd
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            horizontalAlignment: Label.AlignLeft
            font.pointSize: 12
            elide: Label.ElideNone
            wrapMode: Label.Wrap
        }

        Label {
            id: nameInd
            anchors {
                top: timeInd.bottom
                topMargin: root.spacing
                left: parent.left
                right: parent.right
            }
            font {
                pointSize: 10
                bold: true
            }
            horizontalAlignment: Label.AlignLeft
            elide: Label.ElideNone
            wrapMode: Label.Wrap
        }
    }
}
