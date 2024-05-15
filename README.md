# Game MVP 001

The first MVP in series of games that will be developed in the Godot engine in short timeframes.

- 7 Days of development
- Development start date: 2024-05-15
- MVP planned release date: 2024-05-23

## Gameplay overview

- Main goal of the game is to survive the waves of enemies that are trying to reach the base of the player in the center of the map.
- Player can place turrets to help him defend the base.
- Player can also move around the map to help turrets and attack enemies.
- Player can damage enemies by being close to them.

## Gameplay details

- A tile map with a web of roads (passable and impassable tiles).
- The player controls the hero using WASD on the keyboard or the joystick on a gamepad.
- The hero can place turrets.
- The hero's house is in the center of the map.
- Enemies approach the center of the map randomly from the edges.
- Enemies decrease the health of turrets and the hero if they are nearby.
- Enemies collide with the hero's house, decrease its health, and die (this is to avoid overcrowding).
- The presence of the hero near the turrets enhances the turrets.
- The hero deals damage to enemies when close to them.
- Defeat condition: enemies reach the house.
- Victory condition: survive for a certain amount of time.

## Guidelines

### Godot editor guidelines

- Use push_error and push_warning for errors and warnings.
- Edotor Settings -> General -> Debug -> Auto Switch to Remote Scene Tree - ENABLE.
- Project Settings -> Display -> Window -> Always on Top - ENABLE.
- Use `Scene -> Save Branch As Scene` to simplify the scene and reuse it.

### File structure

The project is structured in a way that allows to easily reuse common scenes and tilesets across multiple projects. This approach will teach you to create convenient components for future games.

The structure is as follows:

```
- GodotProjectFoler
  - common (reusable scenes, tilesets)
    - tileset_[sqr|iso|hex]_<name> (reusable tileset)
      - *.tres
      - *.png
    - scene_<name> (reusable scene)
      - *.tres
      - *.gd
      - *.tscn
      - art/
        - *.png
  - this (game specific scenes, scripts and art)
    - main.tscn
    - main.gd
    - <name>.tscn
    - <name>.gd
    - art
      - *.png
      - *.mp3
      - *.wav
```

**sqr** - square tileset.
**iso** - isometric tileset.
**hex** - hexagonal tileset.

## Devlog

- Reuse hexagonal tileset, map, navigation and player scene. Player controllable by mouse : 2024-05-15
- Add enemy scene. Enemy moves towards the center of the map : 2024-05-15
- Add keyboard and gamepad controls for player : 2024-05-15
- Spaceship may shoot : 2024-05-15
- Spaceship creates turrets : 2024-05-16
- Turrets attacks enemies : 2024-05-16

## Assets

- https://kenney.nl/assets/space-shooter-extension
- https://www.kenney.nl/assets/top-down-tanks-redux
