import QtQuick 1.1
import QtWebKit 1.0
import "quickshow"

Presentation {
    id: root

    enableMouse: false

    ImageSlide {
        source: "resources/cover.png"
        title: "Qt for Games"
        authors: "Daker F. Pinheiro\nThiago Figueredo"
        date: "16 de Abril de 2012"
    }

    RegularSlide {
        title: "Agenda"

        content: [
            "Partículas",
            "Colisão",
            "Física",
            "Box2D",
            "Utilizando Libs",
            "Testando no Device",
        ]
    }

    DividerSlide {
        centeredText: "Expresso"
    }

    RegularSlide {
        title: "expresso features"
        content: [
            "Sprites",
            "Som",
            "Pixmaptext (Substituição de texto por imagem)"
        ]
    }

    RegularSlide {
        title: "Sprite"
        CodeSection {
            anchors.left: parent.left
            width: parent.width / 2
            text: 'import QtQuick 1.1
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
'
        }

        WalkingSprite {
            anchors.right: parent.right
            anchors.rightMargin: 200
            anchors.verticalCenter: parent.verticalCenter
            scale: 3
        }
    }

    RegularSlide {
        title: "API: elemento Sprite"
        content: [
            "spriteStates: conjunto de estados possíveis para o sprite",
            "spriteState: estado atual do sprite",
            "flipHorizontaly: define se o sprite vai estar invertido horizontalmente"
        ]
    }

    RegularSlide {
        title: "API: elemento SpriteState"
        content: [
            "frameCount: define quantos sprites estão na imagem",
            "frameWidth: largura de um sprite",
            "frameHeight: altura de um sprite",
            "frameRate: velocidade",
            "source: caminho para a imagem",
            "loopCount: quantas vezes a lista de sprites vai ser exibida",
            "nextState: próximo estado"
        ]
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
