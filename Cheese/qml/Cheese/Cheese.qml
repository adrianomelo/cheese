import QtQuick 1.1
import Box2D 1.0
import "cheese.js" as Cheese

Body {
    id: cheese

    property bool running: false
    property int topBaseline: 0
    property int hp: 0
    property int level: 0
    property QtObject player: QtObject {
        property int strength: 5
    }

    signal timeUp()
    signal gameOver()
    
    function init(level) {
        Cheese.init(level);
    }
    
    onHpChanged: if (hp <= 0) gameOver();

    rotation: Math.random() * 10 - 5
    bodyType: running ? Body.Dynamic : Body.Static

    Image {
        source: "images/cheese.png"
        smooth: true
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

    fixtures: Polygon {
        density: 1
        friction: 0.3
        restitution: 0.3
        scale: parent.scale

        vertices: [
            Qt.point(13.0 * scale, 55.0 * scale + 40),
            Qt.point(7.0 * scale, 442.0 * scale),
            Qt.point(250.0 * scale, 465.0 * scale),
            Qt.point(466.0 * scale, 432.0 * scale),
            Qt.point(474.0 * scale, 50.0 * scale + 40),
            Qt.point(230.0 * scale, 4.0 * scale + 40)
        ]
    }
}
