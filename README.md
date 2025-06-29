# 🚀 AMD FSR Tool

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Linux](https://img.shields.io/badge/Platform-Linux-blue.svg)](https://www.linux.org/)
[![AMD](https://img.shields.io/badge/GPU-AMD-red.svg)](https://www.amd.com/)

## 🎯 Overview

The **AMD FSR Tool** is a comprehensive, production-ready utility for managing FidelityFX Super Resolution (FSR) settings on Linux systems with AMD GPUs. This tool provides enterprise-grade FSR management with advanced features like automated optimization, performance monitoring, and multi-launcher support.

### ✨ What makes this tool special?
- **🎮 Universal Game Support**: Works with Steam, Lutris, Heroic, and standalone games
- **🤖 AI-like Optimization**: Automatically detects games and applies optimal FSR settings
- **📊 Performance Analytics**: Real-time monitoring, benchmarking, and auto-tuning
- **🌐 Web Interface**: Modern browser-based management interface
- **⚡ System Integration**: Deep system optimizations for maximum performance
- **🔧 Professional Features**: Backup/restore, profiles, presets, and batch operations

## 🎬 Demo Output

### Basic Game Configuration
```bash
$ amd-fsr -g "Cyberpunk 2077" -enable -quality 1 -sharpening 3

ℹ 🔍 Searching for game: Cyberpunk 2077
ℹ Searching Steam games...
✓ Found Steam game: /home/user/.steam/steam/steamapps/common/Cyberpunk 2077
ℹ 🚀 Enabling FSR for game in: /home/user/.steam/steam/steamapps/common/Cyberpunk 2077
ℹ 📋 Detected launcher: steam
✓ FSR environment file created: /home/user/.steam/steam/steamapps/common/Cyberpunk 2077/fsr_env.sh
ℹ 🍷 Configuring Wine registry for FSR...
✓ ✅ FSR enabled for steam game!
ℹ 📁 Configuration saved to: /home/user/.steam/steam/steamapps/common/Cyberpunk 2077/fsr_config.conf

ℹ 🎮 Launch Instructions:
  Add to Steam launch options: source /home/user/.steam/steam/steamapps/common/Cyberpunk 2077/fsr_env.sh && %command%
  Or use gamescope: gamescope -W 1920 -H 1080 -w 1280 -h 720 -F fsr -f -- %command%
```

### System Optimization
```bash
$ amd-fsr -system-optimize

ℹ 🚀 Setting up Ultimate AMD FSR System Environment...

⚡ Setting performance environment variables...
⚡ Setting CPU governor to performance...
Setting cpu: 0
Setting cpu: 1
[...]
🧠 Optimizing memory settings...
✅ FSR System optimizations applied!

✓ System FSR optimizations complete!

ℹ Usage examples after system optimization:
  Steam games: Add to launch options: gamescope -W 1920 -H 1080 -w 1280 -h 720 -F fsr -f -- %command%
  Native games: gamescope -W 1920 -H 1080 -w 1280 -h 720 -F fsr -f -- ./your_game
  Wine/Lutris: Environment variables are now set for FSR support
```

### Auto-Detection and Analysis
```bash
$ amd-fsr -auto-detect

ℹ 🔍 Auto-detecting games and analyzing performance needs...

📊 Game Analysis Report:
========================

🎮 Cyberpunk 2077
   Status: ✅ Enabled
   Recommended: Quality=1, Sharpening=3
   Path: /home/user/.steam/steam/steamapps/common/Cyberpunk 2077

🎮 Elden Ring
   Status: ❌ Disabled
   Recommended: Quality=2, Sharpening=2
   Path: /home/user/.steam/steam/steamapps/common/ELDEN RING

💡 To apply recommended settings for all games:
   amd-fsr -auto-optimize-all
```

### Performance Benchmarking
```bash
$ amd-fsr -benchmark "Witcher 3" 30

ℹ 🏁 Starting FSR benchmark mode for Witcher 3

ℹ 🔧 Running benchmarks for all FSR quality settings...

ℹ Testing Quality mode (Q:0)...
✓   ✅ Quality: 65fps (+5fps)
ℹ Testing Balanced mode (Q:1)...
✓   ✅ Balanced: 72fps (+12fps)
ℹ Testing Performance mode (Q:2)...
✓   ✅ Performance: 80fps (+20fps)
ℹ Testing Ultra Performance mode (Q:3)...
✓   ✅ Ultra Performance: 95fps (+35fps)

ℹ 📊 Benchmark Results Summary:
┌─────────────────┬──────┬──────────┐
│ Quality Mode    │ FPS  │ Gain     │
├─────────────────┼──────┼──────────┤
│ Quality         │ 65fps │ +5fps    │
│ Balanced        │ 72fps │ +12fps   │
│ Performance     │ 80fps │ +20fps   │
│ Ultra Perf      │ 95fps │ +35fps   │
└─────────────────┴──────┴──────────┘
✓ ✅ Benchmark completed!
```

### GPU Information
```bash
$ amd-fsr -gpu-info

ℹ 🖥️  GPU Information and FSR Compatibility

🔧 Hardware Information:
   03:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 24 [Radeon RX 6400/6500 XT/6500M]
   07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series]

🚀 Driver Information:
   OpenGL renderer string: AMD Radeon Graphics (radeonsi, renoir, ACO, DRM 3.63, 6.15.2-arch1-1)
   OpenGL version string: 4.6 (Compatibility Profile) Mesa 25.1.4-arch1.1

🎮 Vulkan Support:
   apiVersion         = 1.4.311
   driverVersion      = 25.1.4
   deviceName         = AMD Radeon RX 6500 (RADV NAVI24)

✨ FSR Support Indicators:
   Gamescope: ✅ Available (enhanced FSR support)
```

## 🚀 Installation

### Quick Install
```bash
# Clone the repository
git clone https://github.com/Kaiamaterasu/amd-fsr-tool.git

# Navigate to the directory
cd amd-fsr-tool

# Run the installer
bash install.sh
```

### Installation Output
```bash
🚀 AMD FSR Tool Installer v4.0.0
======================================

ℹ 🔍 Checking system requirements...
✓ AMD GPU detected
✓ glxinfo available
✓ vulkaninfo available
✓ cpupower available
✓ gamescope available
✓ python3 available
✓ curl available
✓ System requirements check passed

📥 Proceed with installation? (y/N): y
ℹ 🚀 Installing AMD FSR Tool v4.0.0...
✓ Created config directory: /home/user/.config/amd-fsr
✓ Tool installed to /usr/local/bin/amd-fsr
✓ Tool made executable
✓ Desktop entry created
✓ ✅ Installation completed successfully!

ℹ 🎮 You can now use the tool with: amd-fsr
ℹ 📖 Run 'amd-fsr --help' for usage information
ℹ 🚀 Quick start: 'amd-fsr -interactive'
```

## 📖 Usage Guide

### 🎮 Basic Commands

| Command | Description | Example |
|---------|-------------|---------|
| `-interactive` | Guided setup mode | `amd-fsr -interactive` |
| `-g "Game" -enable` | Enable FSR for a game | `amd-fsr -g "Cyberpunk 2077" -enable` |
| `-g "Game" -disable` | Disable FSR for a game | `amd-fsr -g "Elden Ring" -disable` |
| `-g "Game" -status` | Check FSR status | `amd-fsr -g "Witcher 3" -status` |
| `-list` | List available games | `amd-fsr -list` |

### ⚡ System-Wide Features

| Command | Description | Example |
|---------|-------------|---------|
| `-system-optimize` | Optimize entire system | `amd-fsr -system-optimize` |
| `-create-env` | Create persistent environment | `amd-fsr -create-env` |
| `-gpu-info` | Show GPU information | `amd-fsr -gpu-info` |

### 🤖 Automated Features

| Command | Description | Example |
|---------|-------------|---------|
| `-auto-detect` | Analyze all games | `amd-fsr -auto-detect` |
| `-auto-optimize-all` | Apply optimal settings to all games | `amd-fsr -auto-optimize-all` |
| `-tune "Game" 60` | Auto-tune for target FPS | `amd-fsr -tune "RDR2" 60` |
| `-benchmark "Game"` | Run performance benchmark | `amd-fsr -benchmark "Cyberpunk" 60` |

### 🌐 Advanced Features

| Command | Description | Example |
|---------|-------------|---------|
| `-web 8080` | Start web interface | `amd-fsr -web 8080` |
| `-monitor "Game" 120` | Monitor performance | `amd-fsr -monitor "Game" 120` |
| `-gamescope "Game" "1920x1080"` | Create gamescope launcher | `amd-fsr -gamescope "Elden Ring" "1920x1080"` |
| `-backup` | Backup configurations | `amd-fsr -backup` |
| `-restore /path` | Restore configurations | `amd-fsr -restore /path/to/backup` |

### 📋 Preset & Profile Management

| Command | Description | Example |
|---------|-------------|---------|
| `-save-preset "name" -quality 1 -sharpening 3` | Save preset | `amd-fsr -save-preset "gaming" -quality 1 -sharpening 3` |
| `-load-preset "name" -g "Game" -enable` | Load preset | `amd-fsr -load-preset "gaming" -g "New Game" -enable` |
| `-list-presets` | List all presets | `amd-fsr -list-presets` |
| `-profile create name` | Create profile | `amd-fsr -profile create performance` |

## 🔧 FSR Quality Settings

| Quality Level | Render Resolution | Performance Gain | Visual Quality |
|---------------|-------------------|------------------|----------------|
| **0 - Quality** | 77% of target | +5-10 FPS | Excellent |
| **1 - Balanced** | 67% of target | +10-15 FPS | Very Good |
| **2 - Performance** | 59% of target | +15-25 FPS | Good |
| **3 - Ultra Performance** | 50% of target | +25-40 FPS | Acceptable |

### 🔪 Sharpening Levels

| Level | Description | Best For |
|-------|-------------|----------|
| **0** | No sharpening | High-resolution displays |
| **1-2** | Light sharpening | Most games |
| **3-4** | Moderate sharpening | Competitive gaming |
| **5** | Maximum sharpening | Older games, low resolution |

## 🎯 Supported Games & Launchers

### 🎮 Game Launchers
- **Steam/Proton**: Full support with automatic detection
- **Lutris**: Wine prefix detection and optimization
- **Heroic Games Launcher**: Epic Games Store integration
- **Standalone Games**: Manual Wine prefix support

### 🎪 Game Categories
- **AAA Games**: Cyberpunk 2077, Elden Ring, Witcher 3, RDR2
- **Competitive Games**: CS2, Valorant, Apex Legends, Dota 2
- **Indie Games**: Most Unity/Unreal Engine games
- **Emulated Games**: Through Wine/Proton compatibility layer

## 🛠️ System Requirements

### ✅ Required
- **GPU**: AMD RDNA 1/2/3 (RX 5000/6000/7000 series) or newer
- **OS**: Linux (tested on Arch, Ubuntu, Fedora, openSUSE)
- **Tools**: bash, find, grep, sed, awk (usually pre-installed)
- **Gaming**: Steam with Proton support

### 📦 Recommended
- **mesa-utils**: For detailed GPU information (`glxinfo`)
- **vulkan-tools**: For Vulkan support verification (`vulkaninfo`)
- **cpupower**: For CPU optimization features
- **gamescope**: For enhanced FSR support and Steam Deck compatibility
- **python3**: For web interface functionality
- **curl**: For automatic updates

### 📦 Installation Commands (Arch Linux)
```bash
# Essential packages
sudo pacman -S mesa-utils vulkan-tools cpupower

# Gaming-specific packages
sudo pacman -S gamescope python3 curl

# Optional monitoring tools
sudo pacman -S htop radeontop
```

## 🔍 Troubleshooting

### ❓ Common Issues

**Q: Tool says "No AMD GPU detected"**
```bash
# Check GPU detection
lspci | grep -i "amd\|radeon"

# If nothing appears, check if drivers are installed
glxinfo | grep -i "amd\|radeon"
```

**Q: Game not found during detection**
```bash
# Use full path instead
amd-fsr -g "/full/path/to/game/directory" -enable

# Or check game directories
amd-fsr -list
```

**Q: FSR not working in-game**
```bash
# Verify FSR is enabled
amd-fsr -g "Game Name" -status

# Check environment file
cat ~/.local/share/Steam/steamapps/common/GameName/fsr_env.sh

# Apply system optimizations
amd-fsr -system-optimize
```

### 🐛 Debug Mode
```bash
# Enable verbose output
export DEBUG=1
amd-fsr -g "Game" -enable

# Check configuration files
ls -la ~/.config/amd-fsr/
```

## 🌟 Advanced Usage Examples

### 🎯 Competitive Gaming Setup
```bash
# Optimize for high FPS competitive gaming
amd-fsr -save-preset "competitive" -quality 3 -sharpening 1
amd-fsr -load-preset "competitive" -g "CS2" -enable
amd-fsr -load-preset "competitive" -g "Valorant" -enable
amd-fsr -system-optimize
```

### 🎨 Visual Quality Setup
```bash
# Optimize for visual quality
amd-fsr -save-preset "visual" -quality 0 -sharpening 4
amd-fsr -load-preset "visual" -g "Cyberpunk 2077" -enable
amd-fsr -load-preset "visual" -g "Witcher 3" -enable
```

### 🔄 Batch Management
```bash
# Enable FSR for multiple games at once
amd-fsr -auto-enable "Cyberpunk 2077,Elden Ring,Witcher 3" -quality 1 -sharpening 2

# Disable FSR for multiple games
amd-fsr -auto-disable "Game1,Game2,Game3"

# Enable for all detected games
amd-fsr -auto-enable-all -quality 1 -sharpening 2
```

### 📊 Performance Analysis Workflow
```bash
# Complete performance analysis
amd-fsr -gpu-info                    # Check hardware capabilities
amd-fsr -auto-detect                 # Analyze all games
amd-fsr -benchmark "Game" 60          # Benchmark specific game
amd-fsr -tune "Game" 75              # Auto-tune for target FPS
amd-fsr -monitor "Game" 300          # Monitor real performance
```

## 🔄 Updates & Maintenance

### 🔄 Automatic Updates
```bash
# Check for updates
amd-fsr -update

# Update will prompt for automatic download
# Or manually download from GitHub releases
```

### 💾 Backup & Restore
```bash
# Create backup before major changes
amd-fsr -backup

# Restore from backup if needed
amd-fsr -restore /home/user/.config/amd-fsr/backups/20240629_120000
```

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### 🐛 Bug Reports
- Use the [Issues](https://github.com/Kaiamaterasu/amd-fsr-tool/issues) tab
- Include system information (`amd-fsr -gpu-info`)
- Provide steps to reproduce

### ✨ Feature Requests
- Check existing issues first
- Describe the use case and benefit
- Consider contributing code if possible

### 💻 Code Contributions
1. Fork the repository
2. Create a feature branch
3. Test your changes thoroughly
4. Submit a pull request with detailed description

### 🧪 Testing
Help test on different distributions:
- Ubuntu/Debian derivatives
- Fedora/Red Hat derivatives
- openSUSE
- Other AMD GPU configurations

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- AMD for FidelityFX Super Resolution technology
- Valve for Proton and Steam compatibility layer
- Mesa developers for open-source AMD drivers
- The Linux gaming community for testing and feedback

## 📞 Support

- **Documentation**: This README and `amd-fsr --help`
- **Issues**: [GitHub Issues](https://github.com/Kaiamaterasu/amd-fsr-tool/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Kaiamaterasu/amd-fsr-tool/discussions)
- **Community**: Linux gaming forums and subreddits

---

**⭐ If this tool helps improve your gaming experience, please star the repository!**

