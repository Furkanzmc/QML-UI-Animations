import QtQuick
import QtQuick.Templates as T

T.TabBar {
    id: root

    property list<Item> actions
    property Item actionsContainer
    property alias model: rp.model
    property alias delegate: rp.delegate

    Binding {
        target: root.actionsContainer
        property: "children"
        value: root.actions
    }

    Repeater {
        id: rp
        parent: root.contentItem
        model: ListModel {
            ListElement {
                name: "Today"
            }

            ListElement {
                name: "Calendar"
            }
        }
    }
}
