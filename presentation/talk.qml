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
            "Mainloop, Eventos, Schedule",
            "Sprites",
            "Viewport",
            "Landscape",
            "Gerenciando Recursos"
        ]
    }

    DividerSlide {
        centeredText: "Games!"
    }

    RegularSlide {
        id: gameSlide
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
            anchors.left: parent.left
            text: '
import QtQuick 1.1
import "engine.js" as Engine

Timer {
    running: gameScene.state == ""
    onTriggered: Engine.tick();
}
'
        }
    }


    RegularSlide {
        title: "Main loop"
        CodeSection {
            anchors.left: parent.left
            text: '
import QtQuick 1.1
import "engine.js" as Engine

Timer {
    running: gameScene.state == ""
    onTriggered: Engine.tick();
}
'
        }
        CodeSection {
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
        title: "Viewport"
        content: ["Mostrar", "Flickable"]
    }

    RegularSlide {
        CodeSection {
            id: code
            anchors.left: parent.left
            text: 'import QtQuick 1.1

Rectangle {
    width:100
    height: 100
    color: "green"
}'
            Component.onCompleted: Qt.createQmlObject(text, loadArea)
        }
        Item {
            id: loadArea
            anchors {
                right: parent.right
                margins: 100
            }
        }
    }

    RegularSlide {
        
    }

    DividerSlide {
        centeredText: "Idéia!"
    }

    RegularSlide {
        centeredText: "Perguntas?"
    }

    RegularSlide {
        centeredText: "Obrigado =)"
    }

    DividerSlide {
        centeredText: "[Off topic]"
    }

    RegularSlide {
        WebView {
            anchors {
                fill: parent
                margins: 80
            }
            url: "http://qt-project.org/doc/"
        }
    }
}
