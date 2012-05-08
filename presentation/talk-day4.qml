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
            "Shaders",
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
            width: parent.width / 1.3
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
                source: Qt.resolvedUrl(
                    "resources/walking_sprite.png")
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
        title: "Sprite"
        content: [
            "spriteStates: conjunto de estados possíveis para o sprite",
            "spriteState: estado atual do sprite",
            "flipHorizontaly: define se o sprite vai estar invertido horizontalmente"
        ]
    }

    RegularSlide {
        title: "SpriteState"
        content: [
            "source: caminho para a imagem",
            "loopCount: quantas vezes a lista de sprites vai ser exibida",
            "nextState: próximo estado"
        ]
    }

    RegularSlide {
        title: "SpriteState"
        content: [
            "frameCount: define quantos sprites estão na imagem",
            "frameWidth: largura de um sprite",
            "frameHeight: altura de um sprite",
            "frameRate: velocidade",
        ]
    }

    DividerSlide {
        centeredText: "Física"
    }

    RegularSlide {
        title: "Física"
        Loader {
            anchors.centerIn: parent
            source: visible ? "monera/monera.qml" : ""
        }
    }

    RegularSlide {
        title: "Física"
        Loader {
            anchors.centerIn: parent
            source: visible ? "demolition/demolition.qml" : ""
        }
    }

    RegularSlide {
        title: "Física"
        content: [
            "Mecânica",
            "Corpos",
            "Massa",
            "Forças",
            "Gravidade"
        ]
    }

    RegularSlide {
        title: "Física"
        content: [
            "Impulso",
            "Colisão",
            "Filtros",
            "Layers",
        ]
    }

    RegularSlide {
        title: "Física"
        content: [
            "Mainloop",
            "Design orientado a eventos",
            "Performance vs. Acurácia",
            "Manipula os objetos de acordo com as leis da física"
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
        title: "Joint"
        content: [
            //"This is a constraint used to hold two or more bodies together",
            "Constraint usada para unir corpos (bodies)",
            //"Box2D supports several joints types: revolute, prismatic, distance, and more.",
            "QML Box2d suporta os tipos revolute, prismatic e distance.",
            //"Some joints may have limits and motors."
            "Alguns dos joints podem ter limites e motores."
        ]
    }

    RegularSlide {
        title: "Prismatic Joint"
        content: [
            // "A prismatic joint allows for relative translation of two bodies along a specified axis."
            "O Joint Prismatic permite o translado relativo entre dois corpos a partir de um eixo."
        ]
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "resources/prismaticjoint.png"
        }
    }

    RegularSlide {
        title: "Revolute Joint"
        content: [
            "Força dois corpos a compartilhar um ponto âncora. "
        ]
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "resources/revolutejoint.png"
        }
    }

    RegularSlide {
        title: "Distance Joint"
        content: [
            "Força dois corpos a manter uma distância sempre constante."
        ]
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "resources/distancejoint.png"
        }
    }

    DividerSlide {
        centeredText: "QML Box2D API"
    }

    RegularSlide {
        title: "World API"
        content: [
            "running: se está rodando",
            "gravity: gravidade do mundo",
            "Outros: positionIterations, velocityIterations, frameTime, timeStep"
        ]
    }

    RegularSlide {
        title: "No cheese..."
        CodeSection {
            anchors.fill: parent
            text: '// GameScene.qml
import QtQuick 1.1
import Box2D 1.0
import "gamescene.js" as Game

Flickable {
    id: b2scene
    // ...
    World {
        id: world // Os queijos, inimigos e buracos são adicionados ao world posteriormente..

        width: parent.width
        height: parent.height
        running: b2scene.running

        Wall {
            width: parent.width
            height: 1
            y: parent.height - height
        }

        // ...
'
        }
    }

    RegularSlide {
        title: "Body API"
        content: [
            "bodyType: define se ele é to tipo Static, Kinematic ou Dynamic",
            "fixtures: fixture que o define",
            "Outros: linearDamping, angularDamping, bullet, sleepingAllowed, fixedRotation, active, linearVelocity"
        ]
    }

    RegularSlide {
        title: "No Cheese.."
        CodeSection {
            anchors.fill: parent
            text: 'import QtQuick 1.1
import Box2D 1.0

Body {
    rotation: Math.random() * 10 - 5
    bodyType: running ? Body.Dynamic : Body.Static

    Image {source: "images/cheese.png"; smooth: true}

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
}'
        }
    }

    RegularSlide {
        title: "Fixture API"
        content: [
            "density",
            "friction",
            "restitution",
            "Outros: sensor, categories, collidesWith, groupIndex"
        ]
    }

    DividerSlide {
        centeredText: "Partículas"
    }

    RegularSlide {
        title: "Partículas"
        Loader {
            anchors.centerIn: parent
            source: visible ? "particles/ParticlesExample.qml" : ""
        }
    }

    RegularSlide {
        title: "Partículas"
        Loader {
            anchors.centerIn: parent
            source: visible ? "particles/ParticlesExampleClick.qml" : ""
        }
    }

    RegularSlide {
        title: "Partículas"
        Grid {
            anchors.centerIn: parent
            columns: 3
            spacing: 30
            Image { source: "resources/snow-particle.png" }
            Image { source: "resources/fire-particle.jpg" }
            Image { source: "resources/smoke-particle.jpg" }
            Image { source: "resources/explosion-particle.jpg" }
            Image { source: "resources/water-particle.jpg"; width: implicitWidth / 2; height: implicitHeight / 2 }
        }
    }

    RegularSlide {
        title: "Partículas"
        content: [
            "Particles 1.0",
            "Particles 2.0"
        ]
    }

    RegularSlide {
        title: "Shaders"
        Loader {
            anchors.centerIn: parent
            source: visible ? "particles/Shader.qml" : ""
        }
    }

    DividerSlide {
        Image {
            anchors.centerIn: parent
            source: "resources/nokiapromo.jpg"
        }
    }

    RegularSlide {
        centeredText: "Obrigado =)"
    }
}
