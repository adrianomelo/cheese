// Cheese

var enemySet = {
    "Rat": Qt.createComponent("enemies/Rat.qml")
};

var holes = [];
var enemies = [];
var tickCount = 0;
var timeline = [];
var timelineIndex = 0;

function readLevelData(level, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "levels/level" + level + ".json");
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState != 4 && xhr.responseText == "")
            return;

        callback(JSON.parse(xhr.responseText));
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
    for (var i in enemies)
        enemies[i].destroy();

    for (var i in holes)
        holes[i].destroy();

    enemies = [];
    holes = [];
}

function addHole(x, y, type) {
    var hole = {
        'x': x,
        'y': y,
        'rotation': Math.random() * 20 - 10,
        'type': type ? type : (Math.floor(Math.random() * 4) + 1)
    };
    holes.push(holeComponent.createObject(cheese, hole));
}

function tick() {
    tickCount++;

    if (timelineIndex >= timeline.length && !enemies.length) {
        cheese.timeUp();
        return;
    }

    while (timelineIndex < timeline.length &&
           timeline[timelineIndex].time <= tickCount) {
        onEvent(timeline[timelineIndex]);
        timelineIndex++;
    }

    for (var i in enemies) {
        var enemy = enemies[i];
        if (enemy.hp > 0) {
            enemy.tick();
        } else {
            enemies.splice(i, 1); // Remove
            enemy.destroy();
        }
    }
}

function onEvent(event) {
    if ('enemy' in event) {
        var enemy = enemySet[event.enemy].createObject(holes[event.hole]);
        enemies.push(enemy);
        enemy.cheese = cheese;
    }
}

