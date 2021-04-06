import QtQuick
import QtQuick.Controls
import "./ExpandableBottomBar"

Window {
    id: root
    width: 480
    height: 600
    visible: true
    color: "#F9D8E6"

    NavigationBar {
        anchors {
            left: parent.left
            leftMargin: 50
            right: parent.right
            rightMargin: 50
            bottom: parent.bottom
            bottomMargin: 50
        }

        NavigationBarButton {
            text: "Home"
            icon.source: "../assets/home.png"
            palette {
                buttonText: "#969696"
                highlight: "#FBE5EE"
                highlightedText: "#EE7CA4"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }

        NavigationBarButton {
            text: "Today"
            icon.source: "../assets/sun.png"
            palette {
                buttonText: "#969696"
                highlight: "#dfdfdf"
                highlightedText: "#888888"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }

        NavigationBarButton {
            text: "Done"
            icon.source: "../assets/check.png"
            palette {
                buttonText: "#969696"
                highlight: "#fbe8e7"
                highlightedText: "#f08e8b"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }

        NavigationBarButton {
            text: "Settings"
            icon.source: "../assets/settings.png"
            palette {
                buttonText: "#969696"
                highlight: "#dcebfb"
                highlightedText: "#56a2ec"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }
    }
}
