import QtQuick 1.1

Sprite {
    width: 80
    height: 80
    spriteState: 'normal'
    spriteStates: {'normal': ["red", "tomato"]}

    property Item cheese
    property int hp: 5
    property int strength: 1

    onTicked: {
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
