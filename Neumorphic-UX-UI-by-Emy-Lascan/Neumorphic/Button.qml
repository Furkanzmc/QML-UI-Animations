import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

T.Button {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    padding: 6
    horizontalPadding: padding + 2
    spacing: 6
    icon.width: 24
    icon.height: 24
    icon.color: control.checked || control.highlighted ? control.palette.brightText :
                control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked || control.highlighted ? control.palette.brightText :
               control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
    }
    background: Rectangle {
        implicitWidth: 160
        implicitHeight: 30
        radius: height * 0.5
        visible: !control.flat || control.down || control.checked || control.highlighted
        color: Color.blend(control.checked || control.highlighted ? control.palette.dark : control.palette.button,
                                                                    control.palette.mid, control.down ? 0.5 : 0.0)
        border.color: control.palette.highlight
        border.width: control.visualFocus ? 2 : 0
    }
}
