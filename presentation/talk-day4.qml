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
        centeredText: "Perguntas?"
    }

    DividerSlide {
        centeredText: "Idéias?"
    }

    RegularSlide {
        centeredText: "Obrigado =)"
    }
}
