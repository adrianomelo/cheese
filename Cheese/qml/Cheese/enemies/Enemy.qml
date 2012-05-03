import QtQuick 1.1
import Expresso 1.0

Sprite {
    property Item cheese: null

    property int hp: 2
    property int strength: 1
    property int playerStrength: 1

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


