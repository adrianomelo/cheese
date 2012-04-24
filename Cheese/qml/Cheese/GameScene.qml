import QtQuick 1.1
import "engine.js" as Engine

Item {
    id: gameScene

    property alias running: timer.running
    property bool paused: false
    property Item focusedItem
    property int currentLevel: 0
    property Item currentCheese
    property Item topCheese

    signal gameOver()

    onGameOver: Engine.reset();

    onTopCheeseChanged: explosion.burst();

    function init() {
        Engine.nextLevel();
    }

    function focusOn(item) {
        focusedItem = item;
    }

    Timer {
        id: timer
        interval: 500
        running: false
        repeat: true
        onTriggered: Engine.tick();
    }

    Landscape {
        anchors.fill: parent
        xOffset: viewport.x
        yOffset: viewport.y
    }

    Item {
        id: world
        width: gameScene.width
        height: gameScene.height
        transform: Translate {
            id: viewport
            x: paused ? -gameScene.width : 0
            y: focusedItem ? (-focusedItem.y + 550) : 0
            Behavior on x { NumberAnimation { duration: 500 } }
            Behavior on y { NumberAnimation { duration: 500 } }
        }

        BurstChesseParticles {
            id: explosion
            anchors {
                left: topCheese ? topCheese.left : undefined
                right: topCheese ? topCheese.right : undefined
                bottom: topCheese ? topCheese.top : undefined
                margins: 30
                bottomMargin: -30
            }
            height: 40
            z: 2
        }
    }
}
