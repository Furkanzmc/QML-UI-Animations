import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import Todo.Window
import Todo.Dashboard
import Todo.Tasks

Window {
    id: root
    width: 420
    height: 800
    visible: true

    ColumnLayout {
        id: header
        anchors {
            fill: parent
            topMargin: 50
        }
        spacing: 30

        NavigationBar {
            id: nb
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            Layout.maximumWidth: parent.width * 0.7
        }

        TasksView {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
