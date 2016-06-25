import QtQuick 2.5

Item {
    property alias source: sourceImage.source
    property alias fillMode: sourceImage.fillMode

    property bool hasBorder: false
    property int radius: 0
    property color borderColor: "#D27700"

    id: root

    //This Item is needed to keep the source image's fillMode
    Item {
        id: imageSource
        anchors.fill: parent
        visible: false
        layer.enabled: true

        Image {
            id: sourceImage
            anchors.fill: parent
            antialiasing: true
            fillMode: Image.PreserveAspectCrop
        }
    }

    Rectangle {
        id: maskLayer
        anchors.fill: parent
        radius: root.radius
        antialiasing: true

        layer {
            enabled: true
            samplerName: "maskSource"
            effect: ShaderEffect {

                property var colorSource: imageSource
                fragmentShader: "
                uniform lowp sampler2D colorSource;
                uniform lowp sampler2D maskSource;
                uniform lowp float qt_Opacity;
                varying highp vec2 qt_TexCoord0;
                void main() {
                    gl_FragColor = texture2D(colorSource, qt_TexCoord0) * texture2D(maskSource, qt_TexCoord0).a * qt_Opacity;
                }"
            }
        }
    }

    // only draw border line
    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: "transparent"
        border {
            color: borderColor
            width: 1
        }
        antialiasing: true
        visible: hasBorder
    }
}
