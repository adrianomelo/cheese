import QtQuick 1.1
import QtWebKit 1.0
import "quickshow"

Presentation {
    id: root

    enableMouse: false

    ImageSlide {
        source: "resources/cover.png"
        title: "Qt for Games"
        authors: "Daker F. Pinheiro\nThiago Figueredo\nAdriano Melo"
        date: "16 de Abril de 2012"
    }

    RegularSlide {
        title: "Agenda"

        content: [
            "Expresso",
            "Física",
            "QML Box2D",
            "Colisão",
            "Partículas",
            "Testando no Device"
        ]
    }

    DividerSlide {
        centeredText: "Expresso"
    }

    RegularSlide {
        title: "Expresso features"
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
            "source: caminho para a imagem",
            "loopCount: quantas vezes a lista de sprites vai ser exibida",
            "nextState: próximo estado"
        ]
    }

    RegularSlide {
        title: "API: elemento SpriteState"
        content: [
            "frameCount: define quantos sprites estão na imagem",
            "frameWidth: largura de um sprite",
            "frameHeight: altura de um sprite",
            "frameRate: velocidade",
        ]
    }

    DividerSlide {
        centeredText: "QML Box2D"
    }

    RegularSlide {
        title: "Elementos do Box2d"
        content: [
            "Mundo (World)",
            "Corpo (Body)",
            "Fixture",
            "Articulação (Joint)"
        ]
    }

    RegularSlide {
        title: "Mundo (World)"
        //content: ["A physics world is a collection of bodies, fixtures, and constraints that interact together"]
        content: ["Um mundo é uma coleção de corpos, fixtures e articulações que interagem entre si."]
    }

    RegularSlide {
        title: "Corpo (Body)"
        //content: ["A chunk of matter that  is so strong that the distance between any two bits of matter on the chunk is constant. They are hard like a diamond."]
        content: ["Uma porção de matéria que é tão forte que a distância entre dois bits de matéria é sempre constante. São duros como um diamante."]
    }

    RegularSlide {
        title: "Fixture"
        //content: ["A fixture binds a shape to a body and adds material properties  such as density, friction, and restitution."]
        content: ["Uma Fixture atribui uma forma (shape) ao corpo (Body) e propriedades materiais como densidade (density), atrito (friction) e restituição (restitution)."]
    }

    RegularSlide {
        title: "Propriedades do fixture"
        content: [
            //"density: used to compute the mass property of the parent body. The density can be zero or positive.",
            "density: usado para computar a massa do corpo (body) que é seu pai. A densidade pode ser zero ou positiva.",
            //"friction: used to make objects slide along each other realistically. Box2D supports static and dynamic friction, but uses the same parameter for both.", // Coulomb friction
            "friction: usado para fazer os objetos deslizarem uns sobre os outros de forma realística. Box2D suporta atrito estático e dinâmico, mas usa o mesmo parâmetro para os dois.",
            //"restitution: used to make objects bounce. A value of zero is an inelastic collision and a value of one is a perfectly elastic collision."
            "restitution: usado para fazer os objetos pularem. O valor de zero é uma colisão inelástica e o valor de um é uma colisão perfeitamente elástica."
        ]
    }

    RegularSlide {
        title: "Tipos de formas (shapes)"
        content: [
            //"circle: have a position and radius.",
            "circle: possuem uma posição e um raio.",
            //"polygon: are solid convex polygons.",
            "polygon: são polígonos.",
            //"edge: are line segments.",
            "edge: são segmentos de linha.",
            //"chain: provides an efficient way to connect may edges together to construct you static game worlds."
            "chain: maneira eficiente de conectar edges para construir os mundos do jogo."
        ]
    }

    RegularSlide {
        title: "joint"
        content: [
            //"This is a constraint used to hold two or more bodies together",
            "Constraint usada para unir corpos (bodies)",
            //"Box2D supports several joints types: revolute, prismatic, distance, and more.",
            "Box2d suporta os tipos revolute, prismatic e distance.",
            //"Some joints may have limits and motors."
            "Alguns dos joints podem ter limites e motores."
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
