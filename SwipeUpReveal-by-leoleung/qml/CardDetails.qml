import QtQuick 2.5

Rectangle {
    property alias caption: addressLabel.text

    id: root
    scale: 0.5
    opacity: 0
    radius: 10
    color: "#D1D4D5"

    Text {
        id: addressLabel
        anchors {
            bottom: profileImages.top
            bottomMargin: profileImages.height * 1.5 - height / 2
            left: profileImages.left
        }
        font {
            pointSize: 13
        }
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        width: parent.width - profileImages.anchors.leftMargin * 2
    }

    ProfileImages {
        id: profileImages
        imageSize: Qt.size(40, 40)
        anchors {
            bottom: parent.bottom
            bottomMargin: profileImages.imageSize.height / 2
            left: parent.left
            leftMargin: profileImages.imageSize.width
        }
        images: [
            "qrc:/images/captain-america.jpg",
            "qrc:/images/hawkeye.jpg",
            "qrc:/images/scarlet-witch.jpg",
            "qrc:/images/thor.jpg",
            "qrc:/images/tony-stark.png"
        ]
    }

    Rating {
        id: rating
        anchors {
            top: addressLabel.bottom
            right: parent.right
            rightMargin: profileImages.anchors.leftMargin
        }
    }
}
