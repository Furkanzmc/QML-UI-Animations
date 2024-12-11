import QtQuick
import Todo.Tasks

TaskCard {
    id: root

    required property string todo
    required property string start_date
    required property string end_date
    required property string dur

    text: todo
    startDate: start_date
    endDate: end_date
    duration: dur
}
