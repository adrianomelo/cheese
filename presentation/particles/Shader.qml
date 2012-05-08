import QtQuick 1.0
import Qt.labs.shaders 1.0

Rectangle {
    width: 300
    height: 300
    color: "black"

    Text {
        id: textLabel
        text: "Hello World"
        anchors.centerIn: parent
        font.pixelSize: 32
        color: "white"
        smooth: true
    }

    ShaderEffectItem {
        id: shader
        property variant source: ShaderEffectSource { sourceItem: textLabel; hideSource: true }
        property real wiggleAmount: 0.0
        anchors.fill: textLabel

        smooth: true

        Behavior on wiggleAmount { NumberAnimation { duration: 1000; easing.type: Easing.OutBounce } }

        fragmentShader: "
        varying highp vec2 qt_TexCoord0;
        uniform sampler2D source;
        uniform highp float wiggleAmount;
        void main(void)
        {
            highp vec2 wiggledTexCoord = qt_TexCoord0;
            wiggledTexCoord.s += sin(4.0 * 3.141592653589 * wiggledTexCoord.t) * wiggleAmount;
            gl_FragColor = texture2D(source, wiggledTexCoord.st);
        }
        "
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (shader.wiggleAmount == 0.0)
                shader.wiggleAmount = 0.05;
            else
                shader.wiggleAmount = 0.0;
        }
    }
}