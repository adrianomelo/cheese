import QtQuick 1.1
import Expresso 1.0

SpriteScene {
    width: sprite.width
    height: sprite.height
        
    Sprite {
        id: sprite
        width: 122
        height: 130
        anchors.centerIn: parent

        spriteStates: [
            SpriteState {
                id: walkingState
                frameCount: 6
                frameWidth: 122
                frameHeight: 130
                frameRate: 0.2
                source: Qt.resolvedUrl("resources/walking_sprite.png")
            }
        ]
    }
}
