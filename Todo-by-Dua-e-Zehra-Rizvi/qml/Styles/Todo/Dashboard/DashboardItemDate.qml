import QtQuick
import QtQuick.Controls
import Templates.Todo.Dashboard as T
import Styles.Todo

T.DashboardItemDate {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    dayIndicator: dyInd
    rightInset: -4
    background: Item {
        implicitWidth: 30
        implicitHeight: 24

        Rectangle {
            width: 2
            height: parent.height * 0.5
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            color: Theme.dashboardDivider
        }
    }
    contentItem: Column {
        property string text

        Label {
            id: dyInd
            horizontalAlignment: Label.AlignLeft
            font.pointSize: 22
            elide: Label.ElideNone
            wrapMode: Label.Wrap
        }

        Label {
            text: parent.text
            font {
                pointSize: 60
            }
            horizontalAlignment: Label.AlignLeft
            elide: Label.ElideNone
            wrapMode: Label.Wrap
        }
    }
}
