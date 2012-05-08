import QtQuick 1.1
import Qt.labs.particles 1.0

Rectangle {
    width: 400
    height: 400
    color: "black"

    Particles {
        x: parent.width/2
        y: parent.height * 0.8
        width: 1
        height: 1
        source: "star.png"
        lifeSpan: 5000
        count: 200
        angle: 270
        angleDeviation: 45
        emissionVariance: 30
        velocity: 50
        velocityDeviation: 15

        ParticleMotionGravity {
            yattractor: 1000
            xattractor: 0
            acceleration: 25
        }
    }
}
