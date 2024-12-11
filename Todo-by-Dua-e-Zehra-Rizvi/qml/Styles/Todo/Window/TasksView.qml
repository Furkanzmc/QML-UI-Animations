import QtQuick
import QtQuick.Layouts
import Todo.Dashboard
import Todo.Tasks
import Todo.Delegates
import Templates.Todo.Window as T

T.TasksView {
    id: root
    dashboard: db
    taskList: tl
    contentItem: ColumnLayout {
        spacing: 60

        Dashboard {
            id: db
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.height * 0.4

            DashboardItemDate { }

            DashboardItemClocksDelegate {
                height: parent.height * 0.8
                anchors.verticalCenter: parent.verticalCenter
                showDivider: false
                delegate: DashboardItemClockDelegate { }
            }
        }

        TaskList {
            id: tl
            delegate: TaskCardDelegate {
                width: parent.width
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
