import QtQuick 1.1
import Qt.labs.particles 1.0

Rectangle {
    width: 400
    height: 400
    color: "gray"

    Particles {
        id: particles

        width: 1
        height: 1
        source: "star.png"
        lifeSpan: 5000
        count: 0
        angle: 270
        angleDeviation: 180
        velocity: 50
        velocityDeviation: 30
        emissionVariance: 1
        ParticleMotionGravity {
            yattractor: 1000
            xattractor: 0
            acceleration: 25
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            particles.x = mouse.x;
            particles.y = mouse.y;
            particles.burst(200, 150);
        }
    }
}
