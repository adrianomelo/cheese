import QtQuick 1.1
import Expresso 1.0

Sprite {
    property int hp: 2
    property int strength: 1
    property int playerStrength: 1

    property int xCenter: width/2
    property int yCenter: height/2

    signal clicked()

    MouseArea {
        hoverEnabled: false
        anchors.fill: parent

        onClicked: {
            hp -= playerStrength;
            parent.clicked();
        }
    }
}

