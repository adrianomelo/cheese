import QtQuick 1.1
import Expresso 1.0

SpriteScene {
    id: root

    state: "menu"

    states: [
        State {
            name: "menu"
        },
        State {
            name: "gameplay"
            PropertyChanges { target: score; opacity: 1 }
            PropertyChanges { target: playPauseButton; opacity: 1 }
            PropertyChanges { target: game; running: true }
        },
        State {
            name: "pause"
            PropertyChanges { target: score; opacity: 1 }
            PropertyChanges { target: playPauseButton; opacity: 1 }
            PropertyChanges { target: game; paused: true }
        },
        State {
            name: "game-over"
            PropertyChanges { target: gameOverLabel; opacity: 1 }
        },
        State {
            name: "win"
            PropertyChanges { target: winLabel; opacity: 1 }
        }

    ]

    transitions: [
        Transition {
            from: "menu"
            NumberAnimation { target: start; property: "anchors.rightMargin"; to: -400 }
        },
        Transition {
            to: "menu"
            NumberAnimation { target: start; property: "anchors.rightMargin"; to: 32 }
        }
    ]
    
    Landscape {
        anchors.fill: parent
    }

    GameScene {
        id: game
        width: parent.width
        height: parent.height
        x: paused ? -width : 0
        opacity: paused ? 0.1 : 1
        running: false

        onGameOver: root.state = "game-over"
        onWin: {
            running = false;
            root.state = "win";
        }

        Behavior on opacity { NumberAnimation { duration: 500 } }
        Behavior on x { NumberAnimation { duration: 1000 } }
    }

    StartButton {
        id: start
        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 32
            bottomMargin: 12
        }

        onClicked: {
            root.state = "gameplay";
            game.init();
        }
    }

    PlayPauseButton {
        id: playPauseButton
        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 32
            bottomMargin: 12
        }
        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 500 } }

        onClicked: {
            if (root.state == "pause")
                root.state = "gameplay";
            else
                root.state = "pause";
        }
    }

    Score {
        id: score
        score: game.currentLevel - 1
        anchors {
            top: parent.top
            left: parent.left
            margins: 12
        }
        opacity: 0
    }

    GameOverLabel {
        id: gameOverLabel
        anchors.centerIn: parent
        opacity: 0
        onClicked: root.state = "menu"
    }

    GameOverLabel {
        id: winLabel
        anchors.centerIn: parent
        opacity: 0
        text: "You Win!!"
        onClicked: root.state = "menu"
    }
}
