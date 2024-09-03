# 🚗 Custom Camera Angles for Race Driving

**Version:** 1.0.0  
**Author:** _Save5Bucks_  
**Game:** Grand Theft Auto V (FiveM)

---

## 📜 Overview

This resource allows you to set up **6 custom camera angles** for race driving in FiveM. These cameras are positioned off the rear of the vehicle and are fully synchronized with the vehicle's pitch, roll, and yaw. Whether you're climbing steep hills or making sharp turns, the camera follows your vehicle's every move—keeping you in the action!

---

## 🚀 Installation

1. **Download** or **clone** this repository into your `resources` folder.

2. **Ensure the resource** is included in your `server.cfg`:

   ```plaintext
   ensure race-cam
   ```

3. **Configure** your custom camera settings in `config.lua`. Adjust positions, rotations, and fields of view (FOV) to your preference.

4. **Start your server** and enjoy your new custom camera angles!

---

## 🛠️ Configuration

### `config.lua`

This file is where the magic happens. Each camera angle is fully customizable with the following options:

```lua
Config.CameraSettings = {
    [1] = {coords = {x = 0.0, y = 0.0, z = 1.0}, rotation = {pitch = -10.0, yaw = 0.0}, fov = 45.0},
    [2] = {coords = {x = 0.0, y = -0.5, z = 1.0}, rotation = {pitch = -10.0, yaw = 0.0}, fov = 45.0},
    [3] = {coords = {x = 0.0, y = -1.0, z = 1.0}, rotation = {pitch = -10.0, yaw = 0.0}, fov = 45.0},
    [4] = {coords = {x = 0.0, y = -3.5, z = 1.0}, rotation = {pitch = -10.0, yaw = 0.0}, fov = 45.0},
    [5] = {coords = {x = 0.0, y = -4.5, z = 1.0}, rotation = {pitch = -10.0, yaw = 0.0}, fov = 45.0},
    [6] = {coords = {x = 0.0, y = -7.0, z = 1.5}, rotation = {pitch = -15.0, yaw = 0.0}, fov = 45.0}
}

Config.CommandName = "racecam"
```

- **`coords`**: Position of the camera relative to the vehicle.
- **`rotation`**: Initial pitch and yaw of the camera.
- **`fov`**: Field of view for each camera.

---

## 🎮 Usage

Once your server is running, you can easily switch between the custom camera angles using the following command:

```plaintext
/racecam [1-6]
```

- **Example**: `/racecam 1` activates the first custom camera angle.

Each camera is carefully designed to give you a thrilling and immersive driving experience, following your vehicle as it moves across all planes.

---

## 🔧 Features

- **Dynamic Camera Follow**: The camera dynamically follows the vehicle's pitch, roll, and yaw, ensuring the view is always in sync with the vehicle's orientation.
- **6 Customizable Angles**: Pre-configured with 6 different camera angles, fully customizable in the `config.lua` file.
- **Real-Time Adjustments**: Camera updates in real-time, reflecting all vehicle movements instantly.
- **Automatic Camera Deletion**: The camera will automatically delete if the vehicle flips over or if the player exits the vehicle.

---

## 🌟 Future Enhancements

- Additional camera angles for even more perspectives.
- Improved UI to select camera angles dynamically.
- Integration with specific vehicle types for specialized camera setups.

---

## 📝 Notes

- Ensure that your server is properly configured to run this resource.
- Customizing camera angles may require some testing to get the perfect setup for your server's needs.

---

## 📧 Support

For support or questions, feel free to contact me at [your.email@example.com](mailto:your.email@example.com) or visit our community forums.

---

### 🚀 Enjoy your new race driving experience with these dynamic custom camera angles!

---

_Drive safe, drive fast!_
