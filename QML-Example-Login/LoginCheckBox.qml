import QtQuick 2.0

Item {
    property int shortLineWidth: 10
    property int longLineWidth: 25
    property int lineThickness: 5
    property bool checked: false
    property color color: "#BA68C8"

    id: root
    width: Math.sqrt(Math.pow(shortLineWidth, 2) / 2) + Math.sqrt(Math.pow(longLineWidth, 2) / 2)
    height: Math.sqrt(Math.pow(longLineWidth, 2) / 2)
    state: "unchcked"

    Rectangle {
        id: partOne
        width: 0
        height: lineThickness
        color: root.color
        y: Math.sqrt(Math.pow(shortLineWidth, 2) / 2)
        transform: Rotation {
            origin.x: 0
            origin.y: partOne.height / 2
            angle: 45
        }

        Behavior on width { NumberAnimation { duration: 500; easing.type: Easing.InExpo } }
    }

    Rectangle {
        id: partTwo
        width: 0
        height: lineThickness
        color: root.color
        x: Math.sqrt(Math.pow(partOne.width, 2) / 2) - height / 2
        y: partOne.y + Math.sqrt(Math.pow(partOne.width, 2) / 2)
        transform: Rotation {
            origin.x: 0
            origin.y: partOne.height / 2
            angle: -45
        }

        Behavior on width { NumberAnimation { duration: 500; easing.type: Easing.OutBack } }
    }

    states: [
        State {
            name: "checked"
            when: checked

            PropertyChanges { target: partOne; width: shortLineWidth }
            PropertyChanges { target: partTwo; width: longLineWidth }
        },
        State {
            name: "unchecked"
            when: !checked

            PropertyChanges { target: partOne; width: 0 }
            PropertyChanges { target: partTwo; width: 0 }
        }
    ]

    transitions: [
        Transition {
            from: "unchecked"
            to: "checked"

            SequentialAnimation {
                NumberAnimation { target: partOne; property: "width"; duration: 250; easing.type: Easing.InOutQuad; from: 0; to: shortLineWidth }
                PauseAnimation { duration: 100 }
                NumberAnimation { target: partTwo; property: "width"; duration: 250; easing.type: Easing.OutBack; from: 0; to: longLineWidth }
            }
        },
        Transition {
            from: "checked"
            to: "unchecked"

            SequentialAnimation {
                NumberAnimation { target: partTwo; property: "width"; duration: 250; easing.type: Easing.InOutQuad; from: longLineWidth; to: 0 }
                PauseAnimation { duration: 100 }
                NumberAnimation { target: partOne; property: "width"; duration: 250; easing.type: Easing.InOutQuad; from: shortLineWidth; to: 0 }
            }
        }
    ]
}
