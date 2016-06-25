import QtQuick 2.5

Row {
    property int starCount: 0

    id: root

    Repeater {
        model: 5
        delegate: starComponent

        Component {
            id: starComponent

            Image {
                source: root.starCount < (index + 1) ? "qrc:/images/star-empty.png" : "qrc:/images/star-filled.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: starCount = (index + 1)
                }
            }
        }
    }
}
