# FiveM vSync Weather System

## Overview
This project provides a customizable weather synchronization system for a FiveM server. It includes both client-side and server-side scripts to manage dynamic weather changes and administrative controls.

## Features
- **Dynamic Weather Changes**: Automatically updates the weather every 10 minutes (configurable).
- **Manual Weather Control**: Admins can override automatic settings and set specific weather conditions.
- **Blackout Mode**: Toggle blackouts for dramatic gameplay effects.
- **Time Manipulation**: Adjust in-game time and freeze/unfreeze time dynamically.

## Installation
1. **Download the Files**:
   - `vSync.rar`

2. **Add to Server Resources**:
   Place the files in your FiveM `resources` directory.

3. **Update `server.cfg`**:
Add the following line to your server configuration file: 
    - `ensure vSync`

4. **Edit Configuration**:
Modify the `admins` table in `server.lua` to include the appropriate identifiers for your server admins. Use `license`, `steam`, or `fivem` identifiers.

## Configuration Options
### erver.lua
- **Admin List**:
Edit the `admins` array to include identifiers of users who can control weather and time.
```lua
admins = {
   'license:YOUR_LICENSE_HERE',
   'steam:YOUR_STEAM_HERE',
   'fivem:YOUR_FIVEM_HERE',
}
