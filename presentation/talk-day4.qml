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
            "Utilizando Módulos",
            "Deploy no Device"
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
            "spriteStates: conjunto de estados possíveis",
            "spriteState: estado atual",
            "flipHorizontaly: invertido horizontalmente"
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
        content: [
            "corpos",
            "fixtures",
            "articulações"
        ]
    }

    RegularSlide {
        title: "Corpo (Body)"
        content: [
            "Uma porção de matéria que é tão forte que a distância entre dois bits de matéria é sempre constante."
        ]
    }

    RegularSlide {
        title: "Fixture"
        content: [
            "forma do Body",
            "propriedades: densidade (density), atrito (friction) e restituição (restitution)."
        ]
    }

    /*RegularSlide {
        title: "Propriedades do fixture"
        content: [
            "density: usado para computar a massa do corpo (body) que é seu pai.",
            "friction: usado para fazer os objetos deslizarem uns sobre os outros de forma realística.",
            "restitution: usado para fazer os objetos pularem. O valor de zero é uma colisão inelástica e o valor de um é uma colisão perfeitamente elástica."
        ]
    }*/

    RegularSlide {
        title: "Tipos de formas (shapes)"
        content: [
            "circle: centro e um raio",
            "polygon: polígonos convexos definidos no sentido horário",
            "edge: são segmentos de linha",
            "chain: maneira eficiente de conectar edges para construir os mundos do jogo"
        ]
    }

    RegularSlide {
        title: "Joint"
        content: [
            "Constraint usada para unir corpos",
            "QML Box2d suporta os tipos revolute, prismatic e distance."
        ]
    }

    RegularSlide {
        title: "Prismatic"
        content: [
            "permite o translado relativo entre dois corpos a partir de um eixo."
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
            "Outros: sensor, categories, collidesWith, groupIndex",
            "Sinais: beginContact, contactChanged, endContact"
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
        centeredText: "Utilizando Módulos com Plugins"
    }

    RegularSlide {
        title: "Utilizando Módulos com Plugins"
        content: [
            "Componentes definidos em C++",
            "Sintaxe: import ModuleName Version",
            "ModuleName é o nome do diretório no repositório",
            "Repositório padrão: [Qt dir]\\imports",
        ]
    }

    RegularSlide {
        title: "Estrutura do diretório ModuleName"
        content: [
            "Como qualquer módulo, pode ter código QML",
            "[plugin].[dll|so]: binário do plugin",
            "qmldir: mapeia os tipos nas implementações considerando versão",
            "plugins.qmltypes (Opcional): mapeamento dos tipos do plugin para o QtCreator"
        ]
    }

    RegularSlide {
        title: "Instalação do QML Box2D"
        content: [
            "Baixar e descompactar o pacote em http://wiki.qtlabs.org.br/_media/trainning/\ngames/qmlbox2dworkspace.zip",
            "Copiar o diretório Box2D em QMLBox2DWorkspace\\Dist\\Lib\\[Target] para o repositório de plugins do [Target]",
            "Desktop: C:\\QtSDK\\Desktop\\Qt\\4.8.1\\msvc2008\\imports",
            "Simulator: C:\\QtSDK\\Simulator\\Qt\\msvc2008\\imports",
            "Symbian: C:\\QtSDK\\Symbian\\SDKs\\SymbianSR1Qt474\\\nepoc32\\data\\z\\resources\\qt\\imports"
        ]
    }

    RegularSlide {
        title: "Instalação do QML Box2D"
        content: [
            "Os devices já estão com QML Box2D instalados",
            "Tutorial detalhado: http://wiki.qtlabs.org.br/trainning/games/qmlbox2d_setup"
        ]
    }

    RegularSlide {
        title: "Instalação do Expresso"
        content: [
            "Baixar e descompactar o pacote em http://wiki.qtlabs.org.br/_media/trainning/\ngames/expressoworkspace.zip",
            "Mesmo processo do QML Box2D"
        ]
    }

    RegularSlide {
        title: "Exemplo com QML Box2D"
        content: [
            "Abra o arquivo Demolition.pro em Examples\\Demolition",
            "Selecione os targets"
        ]

        Image {
            source: "resources/select-target.png"
            scale: 0.7
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }

    RegularSlide {
        title: "Exemplo com QML Box2D (Desktop)"
        content: [
            "Selecione o target Desktop (Debug)",

        ]

        Image {
            source: "resources/target-desktop.png"
            scale: 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }

    RegularSlide {
        title: "Exemplo com QML Box2D (Desktop)"
        content: [
            "Compile (Ctrl+B)",
            "Execute (Ctrl+R)",
        ]
    }

    RegularSlide {
        title: "Exemplo com QML Box2D (Desktop)"
        Image {
            source: "resources/demolition-desktop.png"
            anchors.centerIn: parent
        }
    }

    RegularSlide {
        title: "Exemplo com QML Box2D (Simulator)"
        content: [
            "Repita os mesmos passos para o Desktop",
        ]

        Image {
            source: "resources/demolition-simulator.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }

    RegularSlide {
        title: "Exemplo com QML Box2D (Simulator)"
        content: [
            "Alterando a orientação",
        ]

        Image {
            source: "resources/demolition-simulator-landscape.png"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    DividerSlide {
        centeredText: "Deploy no Device"
    }

    RegularSlide {
        title: "Exemplo com QML Box2D (Symbian)"
        content: [
            "Conecte o celular",
            "Repita os passos dos targets anteriores",
            "Execute no celular Rnd Tools -> CODA"
        ]

        Image {
            source: "resources/waiting-coda.png"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    DividerSlide {
        centeredText: "Perguntas?"
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
