<div align="center">

# 🐌 Snail Engine

### *Friday Night Funkin' Engine*

![Version](https://img.shields.io/badge/version-1.0.0-blue?style=flat-square)
![Haxe](https://img.shields.io/badge/haxe-4.3.6-orange?style=flat-square)
![License](https://img.shields.io/badge/license-Apache%202.0-green?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20Mac-lightgrey?style=flat-square)
![Psych Engine](https://img.shields.io/badge/based_on-Psych%20Engine%200.5.2h-purple?style=flat-square)

<br>

**A powerful, mod-friendly FNF engine built on Psych Engine with advanced modcharts, 13+ shaders, and 8 built-in editors.**

<img src="assets/game/images/branding/icon/icon64.png" width="120" alt="Snail Engine Logo">

</div>

---

## ✨ Features

### 🎵 Advanced Modchart System
18+ modifiers for insane chart customization:

| Modifier | Effect |
|----------|--------|
| `Reverse` | Notes scroll backwards |
| `Confusion` | Disorienting effects |
| `Perspective` | 3D perspective shifts |
| `Drunk` | Wobbly note movement |
| `Invert` | Invert note positions |
| `Scale` | Resize notes dynamically |
| `Rotate` | Spin notes & receptors |
| `Path` | Custom note trajectories |
| `Infinite` | Never-ending scroll paths |
| `Beat` | Beat-synced visual effects |
| `Alpha` | Note transparency control |
| `Flip` | Mirror notes/receptors |
| `Accel` | Speed ramp effects |
| `Transform` | Full 3D transforms |
| ... | and more! |

> All modifiers support **timeline-based events** with easing functions for smooth transitions.

---

### 🎨 Shader Library
13+ built-in GLSL shaders with **crash-safe fallbacks**:

```
VCR Distortion    Chromatic Aberration    Scanlines
Bloom             Glitch                  Invert
Pulse             TV Static               NTSC Filter
Grain             Color Swap              Tilt Shift
3D Ray Tracing    Drop Shadow             Green Screen
```

> Every shader is wrapped in `FunkinRuntimeShader` — compilation errors are caught gracefully instead of crashing the game.

---

### 🛠️ Built-in Editors

| Editor | Description |
|--------|-------------|
| 📊 **Chart Editor** | Full chart editor with quantization, events & dancing mascot |
| 🧑 **Character Editor** | Animation preview & hitbox editing |
| 🎨 **Note Skin Editor** | Create & preview custom note skins |
| 🔄 **Chart Converter** | Convert between chart formats |
| 📝 **Metadata Editor** | Edit song metadata |
| 📅 **Week Editor** | Create & edit weeks |
| 🎭 **Menu Character Editor** | Customize menu characters |
| 📦 **Mods Manager** | Install, configure & manage mods |

---

### 🔥 Additional Features

- **🔥 Hot Reload** — Press `F5` to reload state, `F6` to clear memory + reload
- **💬 Discord Rich Presence** — Show what song you're playing
- **🎬 Video Support** — Cutscene & video playback via hxvlc
- **📝 HScript Runtime** — Write custom scripts without recompiling
- **🎵 Waveform Visualization** — See audio waveforms in real-time
- **🛡️ Crash Handler** — Graceful error recovery with detailed crash reports
- **🎨 Note Skins** — Default + Pixel skins included, create your own
- **📷 Camera Rotation** — Rotating camera support (from Codename Engine)

---

## 🚀 Getting Started

### Prerequisites
- [Haxe 4.3.6+](https://haxe.org/download/)
- [Visual Studio 2022](https://visualstudio.microsoft.com/) (C++ Desktop Development)
- [Git](https://git-scm.com/)

### Installation

```bash
# Clone the repository
git clone https://github.com/anilmisayten-cmyk/Snail-Engine.git
cd Snail-Engine

# Install dependencies
haxelib install lime 8.3.1
haxelib git openfl https://github.com/FunkinCrew/openfl
haxelib git flixel https://github.com/FunkinCrew/flixel
haxelib run lime setup

# Build for your platform
haxelib run lime build windows -release
# or
haxelib run lime build linux -release
# or
haxelib run lime build mac -release
```

### Project Structure

```
Snail-Engine/
├── source/
│   └── funkin/
│       ├── backend/          # Core engine systems
│       ├── game/
│       │   ├── modchart/     # 18+ modifiers
│       │   └── shaders/      # 13+ GLSL shaders
│       ├── states/           # Game states & editors
│       ├── objects/          # Game objects
│       └── scripting/        # Plugin system
├── assets/
│   └── game/                 # Game assets
├── Project.xml               # Build configuration
└── content/                  # Base game content (submodule)
```

---

## 🎮 Controls

| Key | Action |
|-----|--------|
| `Enter` | Confirm / Start |
| `Escape` | Back |
| `Arrow Keys` | Navigate |
| `Space` | Play |
| `F5` | Hot Reload State |
| `F6` | Hot Reload + Clear Memory |

---

## 🛠️ Modding

Snail Engine supports extensive modding via **HScript** and the **plugin system**:

```
 mods/your_mod/
 ├── characters/       # Custom characters
 ├── songs/            # Custom songs & charts
 ├── stages/           # Custom stages
 ├── weeks/            # Custom weeks
 ├── scripts/          # HScript scripts
 │   ├── modifiers/    # Custom modifiers
 │   └── plugins/      # Global plugins
 ├── shaders/          # Custom GLSL shaders
 ├── images/           # Custom graphics
 ├── music/            # Custom music
 ├── sounds/           # Custom sounds
 ├── noteskins/        # Custom note skins
 └── meta.json         # Mod configuration
```

### mod.json Example
```json
{
  "name": "My Cool Mod",
  "description": "An amazing FNF mod",
  "discordId": "123456789",
  "icon": "my-icon.png",
  "color": "#FF0000"
}
```

---

## 🙏 Credits

| | Name | Contribution |
|---|------|-------------|
| 🐌 | **nmvTeam** | Engine Development |
| 🧠 | **Psych Engine** | Base Engine |
| 🌟 | **Nebula_Zorua** | Modchart System & Fork |
| 🎵 | **FunkinCrew** | Lime & OpenFL Forks |
| 🎨 | **Codename Engine** | Camera Rotation |
| 📊 | **FPS Plus** | Chart Editor Ideas |
| 🎭 | **Schmovin' / Andromeda** | Modifier System |

---

## 📄 License

This project is licensed under the **Apache License 2.0** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Made with ❤️ by [nmvTeam](https://github.com/anilmisayten-cmyk)**

*Star ⭐ if you like this project!*

</div>
