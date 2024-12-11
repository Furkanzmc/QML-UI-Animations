import QtQuick
import Templates.Todo.Dashboard as T

T.Dashboard {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    spacing: 20
    background: Item {
        implicitWidth: 100
        implicitHeight: 30
    }
    contentItem: Flickable {
        implicitWidth: contentWidth
        implicitHeight: rw.implicitHeight
        flickableDirection: Flickable.AutoFlickIfNeeded
        contentWidth: rw.implicitWidth
        contentHeight: rw.implicitHeight

        Row {
            id: rw
            spacing: root.spacing

            Repeater {
                model: root.contentModel

            }
        }
    }
}
