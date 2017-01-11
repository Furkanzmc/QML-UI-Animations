import QtQuick 2.7

Column {

    // ----- Public Properties ----- //

    property bool collapsed: false
    property int collapsedHeight: 150

    // ----- Private Properties ----- //

    property int _normalHeight: 0

    id: root
    onCollapsedChanged: {
        if (root.collapsed) {
            if (root._normalHeight === 0) {
                root._normalHeight = root.height;
            }

            root.height = root.collapsedHeight;
        }
        else {
            root.height = root._normalHeight;
        }
    }

    function toggle() {
        root.collapsed = !root.collapsed;
    }
}
