import QtQuick 1.1

Rectangle {
    width: 80
    height: 80
    color: mouse.containsMouse ? "yellow" : "green"

    property Item cheese
    property int hp: 5
    property int strength: 1

    function tick() {
        if (!mouse.containsMouse)
            cheese.hp -= strength;
    }

    MouseArea {
        id: mouse
        hoverEnabled: false
        anchors.fill: parent

        onClicked: {
            hp -= cheese.player.strength;
        }
    }
}
