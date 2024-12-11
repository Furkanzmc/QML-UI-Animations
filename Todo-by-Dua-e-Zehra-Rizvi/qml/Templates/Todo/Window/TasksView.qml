import QtQuick
import QtQuick.Templates as QT
import Templates.Todo.Tasks as TT
import Templates.Todo.Window as TW
import Templates.Todo.Dashboard as TD

QT.Control {
    id: root

    property TD.Dashboard dashboard
    property TT.TaskList taskList

    onTaskListChanged: {
        Qt.callLater(() => {
            if (taskList) {
                taskList.model = taskModel
            }
        })
    }

    ListModel {
        id: taskModel

        ListElement {
            todo: "Call Zoie"
            start_date: "03:00 PM"
            end_date: "03:30 PM"
            dur: "30 Min"
        }

        ListElement {
            todo: "Take the trash out"
            start_date: "02:00 PM"
            end_date: "02:15 PM"
            dur: "15 Min"
        }

        ListElement {
            todo: "Call Quinn for an update on the new design"
            start_date: "02:00 PM"
            end_date: "02:15 PM"
            dur: "15 Min"
        }

        ListElement {
            todo: "Prepare the presentation for Qt Toronto meetup"
            start_date: "01:00 PM"
            end_date: "04:00 PM"
            dur: "3 Hours"
        }
    }
}
