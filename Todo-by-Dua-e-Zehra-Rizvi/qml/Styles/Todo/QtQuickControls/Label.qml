import QtQuick
import QtQuick.Templates as T
import Styles.Todo

T.Label {
    id: root
    color: Theme.text
    linkColor: Theme.accent
    elide: Text.ElideRight
    opacity: enabled ? 1 : Theme.disabledOpacity
    font.family: "Tahoma"
}
