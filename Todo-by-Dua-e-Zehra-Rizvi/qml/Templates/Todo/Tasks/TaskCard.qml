import QtQuick
import QtQuick.Templates as T

T.Control {
    id: root

    property string text
    property string startDate
    property string endDate
    property string duration

    property Item startDateLabel
    property Item endDateLabel
    property Item durationLabel

    Binding {
        target: root.startDateLabel
        property: "text"
        value: root.startDate
    }

    Binding {
        target: root.endDateLabel
        property: "text"
        value: root.endDate
    }

    Binding {
        target: root.durationLabel
        property: "text"
        value: root.duration
    }

    Binding {
        target: root.contentItem
        property: "text"
        value: root.text
    }
}
