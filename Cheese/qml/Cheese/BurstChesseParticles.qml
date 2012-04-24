import QtQuick 1.1
import Qt.labs.particles 1.0

Item {

    function burst() {
        timer.start();
    }

    Timer {
        id: timer
        interval: 700
        onTriggered: particles.burst(80);
    }

    Particles {
        id: particles

        anchors.fill: parent
        lifeSpan: 5000
        lifeSpanDeviation: 0
        source: "images/cheese-piece.png"
        count: 0
        angle: 270
        angleDeviation: 90
        velocity: 500
        velocityDeviation: 180
        emissionVariance: 100

        ParticleMotionGravity {
            yattractor: 1000
            xattractor: 0
            acceleration: 800
        }
    }
}
