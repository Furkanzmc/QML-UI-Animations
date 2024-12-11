import QtQuick
import QtQuick.Controls
import Templates.Todo.Dashboard as T
import Styles.Todo

T.DashboardItemClocks {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    padding: 6
    rightInset: -4
    background: Item {
        implicitWidth: 30
        implicitHeight: 60

        Rectangle {
            width: 2
            height: parent.height * 0.5
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            visible: root.showDivider
            color: Theme.dashboardDivider
        }
    }
    contentItem: Flickable {
        implicitWidth: contentWidth
        implicitHeight: contentHeight
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
        contentWidth: cl.implicitWidth
        contentHeight: cl.implicitHeight
        clip: true

        Column {
            id: cl
            spacing: root.spacing

            Repeater {
                model: root.contentModel
            }
        }
    }
}
