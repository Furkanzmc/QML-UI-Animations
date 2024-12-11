import QtQuick
import QtQuick.Templates as T

T.Container {
    id: root

    property alias delegate: rp.delegate
    property alias model: rp.model

    Repeater {
        id: rp
        parent: root.contentItem
    }
}
