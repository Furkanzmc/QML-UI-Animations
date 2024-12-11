import QtQuick
import QtQuick.Controls
import Templates.Todo.Tasks as T
import Styles.Todo

T.TaskList {
    id: root
    spacing: 6
    background: Rectangle {
        color: Theme.tasks.background
        radius: 16
    }
    contentItem: Item {
        implicitWidth: lv.contentWidth
        implicitHeight: lv.contentHeight

        Label {
            id: tasksLabel
            anchors {
                top: parent.top
                topMargin: 24
                left: parent.left
                leftMargin: 20
            }
            font {
                pointSize: 14
                bold: true
            }
            text: "Today's Tasks"
        }

        Label {
            anchors {
                top: parent.top
                topMargin: 24
                right: parent.right
                rightMargin: 20
            }
            font {
                pointSize: 12
                bold: true
            }
            text: "Reminders"
        }

        ListView {
            id: lv
            anchors {
                top: tasksLabel.bottom
                topMargin: 20
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            implicitWidth: contentWidth
            implicitHeight: contentHeight
            leftMargin: 12
            rightMargin: 12
            bottomMargin: 12
            reuseItems: true
            model: root.contentModel
            currentIndex: root.currentIndex
            spacing: root.spacing
            orientation: ListView.Vertical
            flickableDirection: Flickable.AutoFlickIfNeeded
            clip: true
        }
    }
}
