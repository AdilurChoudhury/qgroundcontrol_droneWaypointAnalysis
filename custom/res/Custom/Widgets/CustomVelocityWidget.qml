import QtQuick 2.11

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.FlightMap     1.0

Item {
    id: root

    property real size
    property var  vehicle: null
    property var velocity: vehicle ? _activeVehicle.airSpeed.value : 0
    property bool showVelocity: false

    width: size
    height: size

    Item {
        id: odometer
        anchors.fill: parent
        visible: false

        Image {
            id: velocitySubImage
            height: size * 0.3
            width: height
            source: "/custom/img/velocity.svg"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            visible: root.showVelocity
        }

        QGCSlider {
            id: velocitySlider
            height: size * 0.4
            anchors.top: parent.top
            anchors.topMargin: ScreenTools.defaultFontPixelWidth * 1.5
            visible: root.showVelocity
        }
        QGCLabel {
            id: velocityLabel
            color: "white"
            anchors.topMargin:  Math.round(ScreenTools.defaultFontPixelHeight * 0.5)
            anchors.bottom: velocitySlider.bottom
            text: "Max Air Speed " + velocitySlider.value
            font.pointSize: ScreenTools.smallPointSize
            visible: root.showVelocity
        }
    }
}
