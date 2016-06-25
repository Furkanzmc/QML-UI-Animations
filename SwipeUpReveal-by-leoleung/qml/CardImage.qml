import QtQuick 2.5

RoundedImage {
    property int _movePosDuration: 500
    property bool _isOnTop: false
    property int placeOffset: 100

    property alias countryName: countryLabel.text
    property alias latInfo: latLabel.text
    property alias lngInfo: lngLabel.text

    id: root
    radius: 10

    Behavior on y { NumberAnimation { duration: _movePosDuration; easing.type: Easing.OutQuart } }

    Text {
        id: countryLabel
        font {
            pointSize: 40
        }
        color: "white"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: height / 2
        }
    }

    Text {
        id: latLabel
        font {
            pointSize: 12
        }
        color: "white"
        anchors {
            left: parent.left
            bottom: parent.bottom
            bottomMargin: locationIcon.height * 0.75 + height / 4
            leftMargin: anchors.bottomMargin
        }
    }

    Image {
        id: locationIcon
        source: "qrc:/images/location-icon.png"
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: height * 0.75
        }
    }

    Text {
        id: lngLabel
        font {
            pointSize: 12
        }
        color: "white"
        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: locationIcon.height * 0.75 + height / 4
            rightMargin: anchors.bottomMargin
        }
    }

    SwipeArea {
        anchors.fill: parent
        onDeltaPosChanged: {
            root._movePosDuration = 1;

            if (root.y > 0) {
                return;
            }

            if (_isOnTop) {
                if (root.y < -placeOffset) {
                    return;
                }

                root.y += map(deltaPos.y, -height, height, -placeOffset, placeOffset, true);
            }
            else {
                root.y = map(deltaPos.y, -height, height, -placeOffset, placeOffset, true);
            }

        }
        onDragEnded: {
            root._movePosDuration = 500;

            if (root.y < -placeOffset / 4) {
                root.y = -placeOffset;
                _isOnTop = true;
            }
            else {
                root.y = 0;
                _isOnTop = false;
            }
        }
    }

    function map(value, inputMin, inputMax, outputMin, outputMax, isClamp) {

        if (Math.abs(inputMin - inputMax) < 1.192092896) {
            return outputMin;
        }
        else {
            var outVal = ((value - inputMin) / (inputMax - inputMin) * (outputMax - outputMin) + outputMin);

            if (isClamp) {
                outVal = clamp(outVal, outputMin, outputMax);
            }
            return outVal;
        }
    }

    function clamp(value, outputMin, outputMax) {
        if (outputMax < outputMin) {
            if(value < outputMax) {
                value = outputMax;
            }
            else if (value > outputMin) {
                value = outputMin;
            }
        }
        else {
            if (value > outputMax ) {
                value = outputMax;
            }
            else if (value < outputMin) {
                value = outputMin;
            }
        }

        return value;
    }
}
