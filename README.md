# README

## 🎮 Sadako Game
This is a fun and spooky little game inspired by Sadako! The game detects motion in a video feed and challenges you to survive while Sadako moves around the screen. If a motion is detected in the red square area, it means... you're dead! Your score keeps track of how many times you "die."

## 📂 File Overview
- **`prototype3.pde`**  
  The main Processing script that powers the game. It handles:
  - Motion detection.
  - Drawing Sadako's image as she "haunts" you.
  - Game logic, including scoring and red square movement.

- **`sadako.png`**  
  The Sadako image that moves around the screen, making the game both scary and exciting!

## 🚀 How to Play
1. **Setup**:  
   Make sure you have [Processing](https://processing.org/download/) installed on your computer.

2. **Run the Game**:  
   Open `prototype3.pde` in Processing and hit the ▶️ play button.

3. **Controls**:  
   Use the following keys to interact with the game:
   - **1/2**: Adjust the motion detection threshold.
   - **b**: Reset the background and score.
   - **3**: Increase the speed of Sadako.
   - **4**: Decrease the speed of Sadako.

4. **Objective**:  
   Avoid motion in the red square area, or your death count (`score`) will go up! How long can you survive?

## 🛠 Features
- **Motion Detection**: Detects brightness changes in the video feed to determine motion.
- **Dynamic Speed**: Sadako randomly changes speed every 60 frames to keep you on your toes.
- **Visual Feedback**: When motion is detected, the screen flashes red, and your death count increases.
- **Customizable Settings**: Adjust thresholds and reset the background to make the game easier or harder.

## 🌟 Future Improvements
- Add sound effects for a more immersive experience.
- Include different levels of difficulty.
- Introduce new characters or environments.

## 🖼 Sadako Image
The game uses the image of Sadako, which you can customize by replacing `sadako.png` with your preferred scary image. Just make sure the image is 100x100 pixels for the best results!

---

Have fun, and try not to let Sadako get you! 👻
