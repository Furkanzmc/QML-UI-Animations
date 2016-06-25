import QtQuick 2.5

Row {
    property var images: []
    property size imageSize

    id: root
    width: repeater.model * imageSize.height
    height: imageSize.height

    Repeater {
        id: repeater
        model: 5
        delegate: profileDelegate
    }

    Component {
        id: profileDelegate

        RoundedImage {
            radius: 360
            width: imageSize.width
            height: imageSize.height
            source: root.images[index]
        }
    }
}
