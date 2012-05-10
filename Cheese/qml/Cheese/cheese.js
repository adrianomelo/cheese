// Cheese

var enemySet = {
    "Rat": Qt.createComponent("enemies/Rat.qml")
};

var tickCount = 0;
var timeline = [];
var timelineIndex = 0;

function readLevelData(level, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "levels/level" + level + ".json");
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == xhr.DONE) {
            if (xhr.responseText != "") {
                callback(JSON.parse(xhr.responseText));
            } else {
                cheese.running = false;
                cheese.visible = false;
                cheese.win();
            }
        }
    }
}

function init(level) {
    cheese.level = level;
    tickCount = 0;

    readLevelData(level, function (levelData) {
        for (var i in levelData.holes) {
            var hole = levelData.holes[i];
            addHole(hole.x, hole.y, hole.type);
        }

        timeline = levelData.timeline;
        timelineIndex = 0;
        cheese.hp = levelData.hp;
    });

}

function reset() {
    for (var i=0; i < cheese.enemies.children.length; i++)
        cheese.enemies.children[i].destroy();

    for (var i=0; i < cheese.holes.children.length; i++)
        cheese.holes.children[i].destroy();
}

function addHole(x, y, type) {
    var holeProperties = {
        'x': x,
        'y': y,
        'rotation': Math.random() * 20 - 10,
        'type': type ? type : (Math.floor(Math.random() * 4) + 1)
    };
    
    holeComponent.createObject(cheese.holes, holeProperties);
}

function tick() {
    tickCount++;
    
    var enemiesList = cheese.enemies.children;
    if (timelineIndex >= timeline.length && !enemiesList.length) {
        cheese.timeUp();
        return;
    }

    while (timelineIndex < timeline.length &&
           timeline[timelineIndex].time <= tickCount) {
        onEvent(timeline[timelineIndex]);
        timelineIndex++;
    }

    for (var i=0; i < enemiesList.length; i++) {
        var enemy = enemiesList[i];

        if (enemy.hp > 0)
            cheese.hp -= enemy.strength;
    }
}

function onEvent(event) {
    if ('enemy' in event) {
        var hole = cheese.holes.children[event.hole];
        var enemy = enemySet[event.enemy].createObject(cheese.enemies);
        
        enemy.playerStrength = cheese.player.strength;
        enemy.x = hole.x - (enemy.xCenter - hole.width/2);
        enemy.y = hole.y - (enemy.yCenter - hole.height/2);
    }
}

