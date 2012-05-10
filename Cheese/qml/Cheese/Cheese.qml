import QtQuick 1.1
import Box2D 1.0
import "cheese.js" as Cheese

CheeseBody {
    id: cheese

    property alias holes: holes
    property alias enemies: enemies

    property bool running: false
    property int topBaseline: 0
    property int hp: 0
    property int level: 0
    property QtObject player: QtObject {
        property int strength: 1
    }

    signal timeUp()
    signal gameOver()
    signal win()
    
    function init(level) {
        Cheese.init(level);
    }

    function freeMemory()
    {
        for (var i=0; i < holes.children.length; i++)
            holes.children[i].destroy();
    }

    Item {
        id: holes
        anchors.fill: parent
    }

    Item {
        id: enemies
        anchors.fill: parent
    }

    Component {
        id: holeComponent
        Hole { smooth: true }
    }

    Timer {
        id: timerTick
        running: parent.running
        repeat: true
        interval: 500
        onTriggered: {
            Cheese.tick();
        }
    }

    onHpChanged: if (hp <= 0) gameOver();
}
