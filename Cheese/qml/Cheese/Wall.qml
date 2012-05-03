import QtQuick 1.1
import Box2D 1.0

Body {
    bodyType: Body.Static

    fixtures: Box {
        anchors.fill: parent
        density: 1
        friction: 0.3
        restitution: 0
    }
}
