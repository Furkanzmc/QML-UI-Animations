/**
  * Code is taken from here -> https://gist.github.com/kovrov/1742405
 */
import QtQuick 2.5

MouseArea {
    property point origin
    property bool ready: false
    property var touchStartTime
    property int swipePositionOffset: 100

    property point previousPos: Qt.point(0, 0)

    signal deltaPosChanged(var originPos, var deltaPos, var direction)
    signal move(int x, int y)
    signal dragEnded()

    signal swipeUp()
    signal swipeDown()
    signal swipeLeft()
    signal swipeRight()

    propagateComposedEvents: true
    onClicked: {
        mouse.accepted = false;
    }
    onPressed: {
        drag.axis = Drag.XAndYAxis
        origin = Qt.point(mouse.x, mouse.y);
        touchStartTime = Date.now();
    }
    onPositionChanged: {
        if (touchStartTime === 0) {
            return;
        }

        switch (drag.axis) {
        case Drag.XAndYAxis:
            if (Math.abs(mouse.x - origin.x) > 16) {
                drag.axis = Drag.XAxis
            }
            else if (Math.abs(mouse.y - origin.y) > 16) {
                drag.axis = Drag.YAxis
            }
            break
        case Drag.XAxis:
            move(mouse.x - origin.x, 0);
            // Going left
            if (previousPos.x < mouse.x) {
                deltaPosChanged(origin, Qt.point(mouse.x - origin.x, mouse.y - origin.y), -1);
            }
            else {
                // Going right
                deltaPosChanged(origin, Qt.point(mouse.x - origin.x, mouse.y - origin.y), 1);
            }
            previousPos.x = mouse.x;
            break
        case Drag.YAxis:
            move(0, mouse.y - origin.y);
            if ((mouse.y < 0 && previousPos.y > mouse.y) || (mouse.y > 0 && previousPos.y < mouse.y)) {
                // Going up
                deltaPosChanged(origin, Qt.point(mouse.x - origin.x, mouse.y - origin.y), 1);
            }
            else {
                // Going down
                deltaPosChanged(origin, Qt.point(mouse.x - origin.x, mouse.y - origin.y), -1);
            }
            previousPos.y = mouse.y;
            break
        }
    }
    onReleased: {
        dragEnded();
        var touchEndTime = Date.now();
        var timeDiffInMiliSeconds = Math.abs(touchEndTime - touchStartTime);
        if (timeDiffInMiliSeconds > 600) {
            return;
        }

        touchStartTime = 0;
        switch (drag.axis) {
        case Drag.XAndYAxis:
            canceled(mouse)
            break
        case Drag.XAxis:
            if (mouse.x - origin.x < -swipePositionOffset) {
                swipeLeft();
            }
            else if (mouse.x - origin.x > swipePositionOffset) {
                swipeRight();
            }
            break
        case Drag.YAxis:
            if (mouse.y - origin.y < -swipePositionOffset) {
                swipeUp();
            }
            else if (mouse.y - origin.y > swipePositionOffset) {
                swipeDown();
            }
            break
        }
    }
}
