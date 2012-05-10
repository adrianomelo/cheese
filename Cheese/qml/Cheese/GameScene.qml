import QtQuick 1.1
import Box2D 1.0
import "gamescene.js" as Game

Flickable {
    id: b2scene

    property int cheeseCount: 0
    property int currentLevel: 0
    property bool running: true
    property bool paused: !running
    
    signal gameOver()
    signal win()
    
    function init()
    {
        Game.restart(b2scene, world);
        Game.nextLevel(b2scene, world);
    }

    contentHeight: 10000
    interactive: false
    height: 700
    width: 480
 
    World {
        id: world

        width: parent.width
        height: parent.height
        running: b2scene.running

        Wall {
            width: parent.width
            height: 1
            y: parent.height - height
        }

        Wall {
            width: 1
            height: parent.height
        }

        Wall {
            width: 1
            height: parent.height
            x: parent.width - 1
        }

        DebugDraw {
            world: world
            anchors.fill: world
            visible: false
        }
    }

    Component {
        id: cheeseUnit

        Cheese {
            id: cc
            width: 480
            height: 469
            scale: 1
            
            onTimeUp: {
                Game.nextLevel(b2scene, world);
            }

            onGameOver: b2scene.gameOver();
            onWin: b2scene.win();

            onEmitParticles: {
                particles.y = y + height;
                particles.x = x + width/2;
                particles.burst();
            }

            Connections {
                target: b2scene
                onCheeseCountChanged: {
                    if (cc.y > (b2scene.contentY + b2scene.height)) // is not visible
                        cc.freeMemory()
                }
            }
        }
    }

    BurstChesseParticles {
        id: particles
    }

    Behavior on contentY {
        PropertyAnimation {
            duration: 1000
        }
    }
    
    onCheeseCountChanged: {
        if (cheeseCount >= 2)
            contentY = Game.lastCheese.y - height + Game.lastCheese.height / 2
        else
            contentY = contentHeight - height;
    }

    onRunningChanged: {
        if (Game.currentCheese)
            Game.currentCheese.running = running;
    }

    onGameOver: {
        Game.restart(b2scene, world);
    }

    Component.onCompleted: {
        contentY = contentHeight - height;
    }
}

