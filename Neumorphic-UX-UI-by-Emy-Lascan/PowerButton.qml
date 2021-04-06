import QtQuick 2.15
import QtQuick.Controls.impl 2.12
import QtGraphicalEffects 1.15

Item {
    id: root

    Rectangle {
        id: background
        anchors.fill: parent
        radius: height / 2
        color: "#D1D3D9"
        visible: false
    }

    RadialGradient {
        anchors.fill: background
        source: background
        // verticalRadius: 270
        verticalOffset: height * -0.025
        horizontalOffset: width * -0.035
        gradient: Gradient {
            GradientStop {
                position: 0.2
                color: "#4DE1E2E3"
            }
            GradientStop {
                position: 0.3
                color: "#4DE1E2E3"
            }
            GradientStop {
                position: 0.4
                color: "#4DE1E2E3"
            }
            GradientStop {
                position: 0.5
                color: "#80D1D3D9"
            }
            GradientStop {
                position: 0.55
                color: "#80D1D3D9"
            }
            GradientStop {
                position: 0.58
                color: "#66D1D3D9"
            }
            GradientStop {
                position: 0.6
                color: "#66D1D3D9"
            }
            GradientStop {
                position: 0.7
                color: "#4DD1D3D9"
            }
            GradientStop {
                position: 1.0
                color: "#33D1D3D9"
            }
        }
    }

    Rectangle {
        id: powerBackground
        width: parent.width * 0.24
        height: parent.height * 0.24
        anchors.centerIn: parent
        radius: height / 2
        color: "transparent"
        border {
            width: 4
            color: "#7D7E83"
        }
    }

    Rectangle {
        id: powerTopBackground
        width: powerBackground.width * 0.36
        height: powerBackground.height * 0.4
        anchors {
            verticalCenter: powerBackground.top
            verticalCenterOffset: 4
            horizontalCenter: powerBackground.horizontalCenter
        }
        color: "#4DD1D3D9"
        transform: Rotation {
            angle: 45
            origin {
                x: powerTopBackground.width / 2
                y: powerTopBackground.height / 2
            }
        }

        Rectangle {
            id: powerTop
            width: powerBackground.border.width
            height: parent.height
            anchors.centerIn: parent
            radius: 20
            color: "#7D7E83"
            transform: Rotation {
                angle: -45
                origin {
                    x: powerTop.width / 2
                    y: powerTop.height / 2
                }
            }
        }
    }
}
