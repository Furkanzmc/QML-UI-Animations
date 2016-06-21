import QtQuick 2.0

Item {
    id: root

    LoginTextBox {
        id: textBoxID
        width: parent.width / 3
        height: root.height
        z: 2
        anchors {
            left: parent.left
            top: parent.top
        }
        placeholder: qsTr("ID")
        Keys.onReturnPressed: {
            textBoxID.checked = true;
            textBoxPass.anchors.leftMargin = 1;
            textBoxPass.opacity = 1;
            focus = false;
            textBoxPass.forceActiveFocus(Qt.MouseFocusReason);
        }
    }

    LoginTextBox {
        id: textBoxPass
        width: textBoxID.width
        height: root.height
        z: 1
        anchors {
            left: textBoxID.right
            leftMargin: -width * 0.9
            top: parent.top
        }
        opacity: 0.3
        placeholder: qsTr("PASS")
        passwordMaskEnabled: true
        Keys.onReturnPressed: {
            textBoxPass.checked = true;
            loginMessage.anchors.leftMargin = 1;
            loginMessage.opacity = 1;
            loginMessage.text = "Welcome <b>Aristo</b>";
        }

        Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
        Behavior on anchors.leftMargin { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
    }

    LoginMessage {
        id: loginMessage
        width: textBoxID.width
        height: root.height
        z: 0
        anchors {
            left: textBoxPass.right
            leftMargin: -width * 0.9
            top: parent.top
        }
        opacity: 0.3
        fontColor: "#BA68C8"
        font.pixelSize: height * 0.4

        Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
        Behavior on anchors.leftMargin { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
    }
}
