import QtQuick 1.1
import Expresso 1.0

Enemy {
    id: enemy

    hp: 1
    strength: 1
    yCenter: 90

    width: 89
    height: 133

    spriteStates: [
        SpriteState {
            id: normalState
            frameCount: 1
            frameWidth: 89
            frameHeight: 133
            source: Qt.resolvedUrl("../images/mouse1.png")
        },
        SpriteState {
            id: damagedState
            frameCount: 2
            frameWidth: 89
            frameHeight: 133
            loopCount: 2
            frameRate: 0.5
            nextState: deadState
            source: Qt.resolvedUrl("../images/mouse2.png")
        },
        SpriteState {
            id: deadState
            frameCount: 1
            frameWidth: 89
            frameHeight: 133
            loopCount: 1
            source: Qt.resolvedUrl("../images/mouse2.png")
        }

    ]

    onSpriteStateChanged: {
        if (spriteState == deadState)
            enemy.destroy();
    }

    onClicked: {
        if (spriteState == normalState)
            spriteState = damagedState;
    }
}
