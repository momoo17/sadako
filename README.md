# README

## Sadako Game

This project is a simple motion detection-based game created using the Processing framework. The game involves detecting changes in a live video feed and interacting with a "Sadako" image that moves around the screen.

---

## Project Structure

```
├── prototype3.pde  # Main Processing sketch file
└── sadako.png      # Image of "Sadako" used in the game
```

---

## Requirements

1. **Processing IDE**: Download and install the Processing IDE from [Processing.org](https://processing.org/).
2. **Processing Video Library**: Install the video library via the Processing Library Manager.

---

## How to Run

1. **Setup**:
   - Clone or download the repository.
   - Open `prototype3.pde` in the Processing IDE.

2. **Ensure File Placement**:
   - Place `sadako.png` in the same directory as `prototype3.pde`.

3. **Run the Sketch**:
   - Click the "Play" button in the Processing IDE to start the game.

---

## Game Instructions

1. **Gameplay**:
   - A "Sadako" image moves across the screen. Its position changes based on random speed adjustments.
   - The game detects brightness changes in the live video feed. When significant changes are detected within the "Sadako" image's bounding box, the game considers it as "you died."

2. **Controls**:
   - Press `1`: Increase the brightness detection threshold.
   - Press `2`: Decrease the brightness detection threshold.
   - Press `b`: Reset the background brightness and the score.
   - Press `3`: Increase the movement speed of "Sadako."
   - Press `4`: Decrease the movement speed of "Sadako."

---

## Features

1. **Motion Detection**:
   - The game continuously monitors brightness changes in the live video feed.
   - Changes above a set threshold trigger a game event.

2. **Interactive Graphics**:
   - "Sadako" moves dynamically and bounces back when hitting the screen edges.
   - Brightness differences in the video are visualized with red highlights.

3. **Dynamic Speed**:
   - The speed of "Sadako" changes randomly at regular intervals, making the gameplay unpredictable.

---

## File Details

### `prototype3.pde`
This file contains the main logic for the game, including:
- Video capture setup.
- Motion detection logic.
- Score tracking.
- Speed and movement management.

### `sadako.png`
An image file used to represent "Sadako." Download it from [this link](https://raw.githubusercontent.com/momoo17/sadako/594d9b06daf2071622d728c0c6f5b04d2fd7f6a1/sadako.png).

---

## Notes

- Ensure your webcam is functional and accessible by the Processing IDE.
- Modify the game parameters, such as `thresh_`, to adjust sensitivity and improve gameplay.

---

Enjoy the game! If you have any questions or suggestions, feel free to reach out.
