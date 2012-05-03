import QtQuick 1.1
import Expresso 1.0

Enemy {
    hp: 5
    strength: 1

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
            loopCount: 3
            frameRate: 0.5
            nextState: normalState
            source: Qt.resolvedUrl("../images/mouse2.png")
        }
    ]

    onClicked: {
        if (spriteState == normalState)
            spriteState = damagedState;
    }
}
