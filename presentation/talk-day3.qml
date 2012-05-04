import QtQuick 1.1
import QtWebKit 1.0
import "quickshow"
//import "resources/qtminivan"

Presentation {
    id: root

    enableMouse: false

    ImageSlide {
        source: "resources/cover.png"
        title: "Qt for Games"
        authors: "Daker F. Pinheiro"
        date: "16 de Abril de 2012"
    }

    RegularSlide {
        title: "Agenda"

        content: [
            "Javascript++",
            "Main loop",
            "Sprites",
            "Eventos",
            "Win/Lose"
        ]
    }

    DividerSlide {
        centeredText: "Cheese!"
    }

    RegularSlide {
        id: gameSlide
        title: "Cheese!"
        MouseArea {
            anchors.fill: game
        }
        Loader {
            id: game
            anchors.centerIn: parent
            source: visible ? "../Cheese/qml/Cheese/main.qml" : ""
        }
    }

    RegularSlide {
        title: "Javascript"
        content: [
            "Delegando responsabilidades para o Javascript"
        ]
    }

    RegularSlide {
        title: "Javascript"
        CodeSection {
            anchors.left: parent.left
            width: parent.width / 2.2
            text: 'import QtQuick 1.1
import "engine.js" as Engine

Item {
    id: gameScene

    Component.onComplete: Engine.init();
}'
        }
        CodeSection {
            anchors.right: parent.right
            width: parent.width / 2.2
            text: '
var enemies;

function init() {
    enemies = [];
    console.log("Initialize game scene");
}
'
        }
    }

    RegularSlide {
        title: "Javascript"
        CodeSection {
            anchors.left: parent.left
            width: 1000
            text: '
var enemies = [];
var enemyComponent = Qt.createComponent("Enemy.qml");

function initLevel() {
    var enemy = enemyComponent.createObject(item);
    enemy.x = Math.random() *
        (item.width - enemy.width);
    enemy.y = Math.random() *
        (item.height - enemy.height);
    enemies.push(enemy);
}
'
        }
    }

    RegularSlide {
        title: "Main loop"
        content: [
            "Padrão para tratamento de eventos",
            "Qt mainloop vs. Game mainloop",
            ""
        ]
    }

    RegularSlide {
        title: "Main loop"
        CodeSection {
            anchors {
                left: parent.left
                right: enginejscode.left
                rightMargin: 40
            }
            text: '
import QtQuick 1.1
import "engine.js" as Engine

Timer {
    running: gameScene.state == "play"
    onTriggered: Engine.tick();
}
'
        }

        CodeSection {
            id: enginejscode
            anchors.right: parent.right
            text: '
function tick() {
    for (var i in enemies) {
        var enemy = enemies[i];
        if (enemy.hp > 0) {
            enemy.tick();
        } else {
            enemies.splice(i, 1); // Remove
            enemy.destroy();
        }
    }
}
'
        }
   }

    RegularSlide {
        title: "Sprites"
        CodeSection {
            anchors.left: parent.left
            text: '
// Rat.qml
import QtQuick 1.1

Sprite {
    width: 80
    height: 80
    spriteState: "normal"
    spriteStates: {"normal": ["red", "tomato"]}

    property Item cheese
    property int hp: 5
    property int strength: 1

    onTicked: {
        if (!mouse.containsMouse)
            cheese.hp -= strength;
    }

    MouseArea {
        // Interaction here
    }
}
'
        }
    }


    RegularSlide {
        title: "Sprites"
        CodeSection {
            anchors.left: parent.left
            text: '
// Sprite.qml
import QtQuick 1.1

Rectangle {
    property int index: 0
    property string spriteState: ""
    property variant spriteStates: {"":[]}

    color: spriteStates[spriteState][index]

    signal ticked()

    function tick() {
        index = (index + 1) %
            spriteStates[spriteState].length;
        ticked();
    }
}
'
        }
    }


    RegularSlide {
        title: "Eventos - Lendo de arquivo"
        CodeSection {
            anchors.left: parent.left
            width: parent.width / 1.5
            text: '
function readLevelData(level, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "levels/level" + level + ".json");
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState != 4 && xhr.responseText == "")
            return;

        callback(JSON.parse(xhr.responseText));
    }
}
'
        }
    }

    RegularSlide {
        title: "Eventos - Lendo de arquivo"
        CodeSection {
            anchors.left: parent.left
            width: parent.width / 1.5
            text:'
{
    "holes": [
        {"x": 45, "y": 70, "type": 1},
        {"x": 245, "y": 170, "type": 2}
    ],
    "minScore": 2,
    "hp": 100,
    "timeline": [
        {"time": 5, "enemy": "Rat", "hole": 0},
        {"time": 10, "enemy": "Rat", "hole": 0},
        {"time": 10, "enemy": "Rat", "hole": 1},
        {"time": 20, "enemy": "Rat", "hole": 1}
    ]
}'
        }
    }

    RegularSlide {
        title: "Eventos" // - Inicializando Level"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width / 1.5
            text: '
var enemySet = {
    "Rat": Qt.createComponent("enemies/Rat.qml")
};

var holes = [];
var enemies = [];
var tickCount = 0;
var timeline = [];
var timelineIndex = 0;

function init(level) {
    cheese.level = level;
    tickCount = 0;

    readLevelData(level, function (levelData) {
        for (var i in levelData.holes) {
            var hole = levelData.holes[i];
            addHole(hole.x, hole.y, hole.type);
        }

        timeline = levelData.timeline;
        timelineIndex = 0;
        cheese.hp = levelData.hp;
    });
}'
        }
    }

    RegularSlide {
        title: "Eventos - Executando eventos"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width
            text: '
function tick() {
    tickCount++;

    if (timelineIndex >= timeline.length && !enemies.length) {
        cheese.timeUp();
        return;
    }

    while (timelineIndex < timeline.length &&
           timeline[timelineIndex].time <= tickCount) {
        onEvent(timeline[timelineIndex]);
        timelineIndex++;
    }

    for (var i in enemies) {
        var enemy = enemies[i];
        if (enemy.hp > 0) {
            enemy.tick();
        } else {
            enemies.splice(i, 1); // Remove
            enemy.destroy();
        }
    }
}
'
        }
    }

    RegularSlide {
        title: "Eventos - Executando eventos"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width
            text: '
function onEvent(event) {
    if ("enemy" in event) {
        var enemy = enemySet[event.enemy].createObject(holes[event.hole]);
        enemies.push(enemy);
        enemy.cheese = cheese;
    }
}
'
        }
    }

    RegularSlide {
        title: "Win/Lose"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width
            text: '
import QtQuick 1.1
import "cheese.js" as Cheese

Image {
    id: cheese

    property int hp: 0
    property int level: 0
    property QtObject player: QtObject {
        property int strength: 1
    }

    signal timeUp()
    signal gameOver()

    function init(level) { Cheese.init(level); }
    function tick() { Cheese.tick(); }

    rotation: Math.random() * 20 - 10
    smooth: true
    source: "images/cheese.png"

    onHpChanged: if (hp <= 0) gameOver();
}
'
        }
    }

    RegularSlide {
        title: "Win/Lose"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width
            text: '
function tick() {
    tickCount++;

    if (timelineIndex >= timeline.length && !enemies.length) {
        cheese.timeUp();
        return;
    }

    ...
'
        }
    }

    RegularSlide {
        title: "Win/Lose"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width
            text: '
// GameScene.qml
import QtQuick 1.1
import "engine.js" as Engine

Item {
    id: gameScene

    property alias running: timer.running
    property bool paused: false
    property int currentLevel: 0

    signal gameOver()

    onGameOver: Engine.reset();

    function init() { Engine.nextLevel(); }

    Timer {
        id: timer
        interval: 500
        running: false
        repeat: true
        onTriggered: Engine.tick();
    }
}'
        }
    }

    RegularSlide {
        title: "Win/Lose"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width
            text: '
var cheeseComponent = Qt.createComponent("Cheese.qml");
var holeComponent = Qt.createComponent("Hole.qml");

function nextLevel() {
    gameScene.currentLevel += 1;

    var cheese = cheeseComponent.createObject(world);
    if (cheeseStack.length >= 1) {
        var topCheese = cheeseStack[cheeseStack.length - 1];
        gameScene.focusOn(topCheese);
    } else {
        cheese.topBaseline = 60;
    }

    cheese.fall();
    cheeseStack.push(cheese);
    cheese.init(gameScene.currentLevel);
    currentCheese = cheese;
    cheese.gameOver.connect(gameScene.gameOver);
    cheese.timeUp.connect(nextLevel);

    return cheese;
}
'
	}
    }
    
    RegularSlide {
        title: "Win/Lose"
        CodeSection {
            anchors.centerIn: parent
            width: parent.width
            text: '// MainWindow.qml
State {
    name: "gameplay"
    PropertyChanges { target: score; opacity: 1 }
    PropertyChanges { target: playPauseButton; opacity: 1 }
    PropertyChanges { target: game; running: true }
}
...

GameScene {
    id: game
    anchors.fill: parent
    running: false
    onGameOver: root.state = "game-over"
}
...

PlayPauseButton {
    id: playPauseButton
    onClicked: {
        if (root.state == "pause") root.state = "gameplay";
        else root.state = "pause";
    }
}
'
	}
    }

    DividerSlide {
        centeredText: "Perguntas?"
    }
    
    DividerSlide {
        centeredText: "Idéias?"
    }

    RegularSlide {
        centeredText: "Obrigado =)"
    }
}
