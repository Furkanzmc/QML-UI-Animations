pragma Singleton

import QtQuick
import Templates.Todo  as T

T.Theme {
    property color background: "#B2BEBF"
    property QtObject button: QtObject {
        property color backgroundChecked: "#000000"
        property color textChecked: "#c6c6c6"
    }
    property QtObject newEventButton: QtObject {
        property color background: "#848b8c"
        property color plus: "#181a1a"
    }
    property QtObject tasks: QtObject {
        property color background: "#d1d8d9"
        property var cardBackgrounds: ["#b89752", "#728a8c", "#8d729f"]
    }
    property color text: "#424242"
    property color dashboardDivider: "#5a6060"
    property color accent: "#688781"
    readonly property real disabledOpacity: 0.7
}
