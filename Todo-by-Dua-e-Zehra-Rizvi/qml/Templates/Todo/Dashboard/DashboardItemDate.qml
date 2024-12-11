import QtQuick
import Todo.Dashboard as T

T.DashboardItemBase {
    id: root

    property Item dayIndicator

    Binding {
        target: root.dayIndicator
        property: "text"
        value: privates.today
    }

    Binding {
        target: root.contentItem
        property: "text"
        value: privates.dateString
    }

    QtObject {
        id: privates

        readonly property var dayStrings: [
            qsTr("Sunday"),
            qsTr("Monday"),
            qsTr("Tuesday"),
            qsTr("Wednesday"),
            qsTr("Thursday"),
            qsTr("Friday"),
            qsTr("Saturday")
        ];
        readonly property var monthStrings: [
            qsTr("January"),
            qsTr("February"),
            qsTr("March"),
            qsTr("April"),
            qsTr("May"),
            qsTr("June"),
            qsTr("July"),
            qsTr("August"),
            qsTr("September"),
            qsTr("October"),
            qsTr("November"),
            qsTr("December")
        ]
        property string today: ""
        property string dateString: ""

        Component.onCompleted: {
            const date = new Date()
            today = dayStrings[date.getDay()];
            dateString = monthStrings[date.getMonth()] + " " + date.getDate() + "\n" + date.getFullYear();
        }
    }
}
