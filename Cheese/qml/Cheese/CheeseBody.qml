import QtQuick 1.1
import Box2D 1.0

Body {
    rotation: Math.random() * 10 - 5
    bodyType: running ? Body.Dynamic : Body.Static

    property bool particlesEmitted: false
    signal emitParticles()

    Image {
        source: "images/cheese.png"
        smooth: true
    }

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

        onBeginContact: {
            if (other.vertices && !particlesEmitted) {
                emitParticles();
                particlesEmitted = true;
            }
        }
    }
}
