import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Templates.Todo.Tasks as T
import Styles.Todo

T.TaskCard {
    id: root
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    startDateLabel: lbStartDate
    endDateLabel: lbEndDate
    durationLabel: lbDuration
    padding: 16
    spacing: 30
    background: Rectangle {
        radius: 16
        color: privates.background
    }
    contentItem: Column {
        property string text

        spacing: root.spacing

        Label {
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Label.Wrap
            font.pointSize: 26
            text: parent.text
        }

        RowLayout {
            anchors {
                left: parent.left
                right: parent.right
            }

            Column {
                spacing: 2
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Label {
                    id: lbStartDate
                    font {
                        pointSize: 14
                        bold: true
                    }
                }

                Label {
                    text: qsTr("Start")
                    font.pointSize: 10
                }
            }

            Label {
                id: lbDuration
                topInset: -6
                leftInset: -6
                rightInset: -6
                bottomInset: -6
                font.pointSize: 10
                color: Qt.lighter(privates.background, 1.3)
                background: Rectangle {
                    radius: height / 2
                    color: Qt.darker(privates.background, 1.4)
                }
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            Column {
                spacing: 2
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                Label {
                    id: lbEndDate
                    font {
                        pointSize: 14
                        bold: true
                    }
                }

                Label {
                    text: qsTr("End")
                    font.pointSize: 10
                }
            }
        }
    }

    QtObject {
        id: privates

        readonly property var backgrounds: Theme.tasks.cardBackgrounds
        readonly property int index: Math.floor(Math.random() * backgrounds.length)
        readonly property color background: backgrounds[index]
    }
}
