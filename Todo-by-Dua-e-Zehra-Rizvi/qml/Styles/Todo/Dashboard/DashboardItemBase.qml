import QtQuick
import Templates.Todo.Dashboard as T
import Styles.Todo

T.DashboardItemBase {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    rightPadding: 20
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
            color: Theme.dashboardDivider
            visible: root.showDivider
        }
    }
}
