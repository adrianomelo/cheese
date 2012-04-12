import QtQuick 1.1
import "cheese.js" as Cheese

Image {
    id: cheese

    property int topBaseline: 0
    property int hp: 0
    property int level: 0
    property QtObject player: QtObject {
        property int strength: 1
    }

    rotation: Math.random() * 20 - 10
    smooth: true

    signal timeUp()
    signal gameOver()

    source: "images/cheese.png"

    onHpChanged: if (hp <= 0) gameOver();

    function init(level) {
        Cheese.init(level);
    }

    function tick() {
        Cheese.tick();
    }

    function fall () {
        fallingAnimation.start();
    }

    Component {
        id: holeComponent
        Hole { smooth: true }
    }

    NumberAnimation {
        id: fallingAnimation
        easing.type: Easing.OutBounce
        duration: 2000
        target: cheese
        property: "y"
        from: topBaseline - height
        to: topBaseline
    }
}
