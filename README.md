# GTA V Chaos Mod: Custom Lua Effects

A collection of custom scripts designed to hook into the **GTA V Chaos Mod** framework. This project serves as both a playground for chaotic gameplay ideas and a practical way to explore game scripting.

## 📌 Project Overview

The goal of this repository is to expand the existing pool of effects in the GTA V Chaos Mod. These scripts introduce new world events, player debuffs, and unpredictable environmental changes using the Lua scripting language.

## 🧠 What I Am Learning

This project is a hands-on exercise in game modding and logic design. Through this repo, I am developing skills in:

* **Lua Scripting:** Understanding syntax, tables, and functional programming within a sandboxed environment.
* **Game State Manipulation:** Learning how to interface with the GTA V engine to modify entities, weather, physics, and player variables in real-time.
* **Event-Driven Programming:** Managing how effects trigger, duration timers, and cleanup processes to ensure the game doesn't crash.
* **Problem Solving:** Debugging complex interactions where multiple scripts might attempt to modify the same game value simultaneously.

## 🛠️ Current Focus

* Creating unique "Twitch-integrated" style effects.
* Optimizing scripts to maintain high frame rates during high-chaos events.
* Learning the native GTA V "Natives" (API functions) to unlock deeper control over the game world.

---

### How to Use

1. Ensure you have the [GTA V Chaos Mod](https://github.com/gta-chaos-mod/ChaosModV) installed.
2. Download the `.lua` files from this repository.
3. Place them in your `ChaosMod/Effects` directory.

---

### Effect Template
* An effect template can be found at [this repo](https://gitea.nathan-falvey.synology.me/Templates/gta5-chaos-luascript-template).
* [Raw Template Code](https://gitea.nathan-falvey.synology.me/Templates/gta5-chaos-luascript-template/raw/branch/main/effect_template.lua), if needed.
---