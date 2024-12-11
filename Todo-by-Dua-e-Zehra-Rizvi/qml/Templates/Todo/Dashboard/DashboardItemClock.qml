import QtQuick
import QtQuick.Templates as T

T.Control {
    id: root

    readonly property string time: privates.time
    property string text: ""

    property Item timeIndicator
    property Item nameIndicator

    Binding {
        target: root.timeIndicator
        property: "text"
        value: root.time
    }

    Binding {
        target: root.nameIndicator
        property: "text"
        value: root.text
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            privates.time = new Date().toLocaleTimeString({hour: "2-digit", minute: "2-digit"})
        }
    }

    QtObject {
        id: privates

        property string time: ""
    }
}
