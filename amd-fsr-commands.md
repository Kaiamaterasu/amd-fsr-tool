# 📋 AMD FSR Tool - Complete Command Reference

## 🎮 Basic Commands

### Game Management
```bash
amd-fsr -g "Game Name" -enable              # Enable FSR for a game
amd-fsr -g "Game Name" -disable             # Disable FSR for a game
amd-fsr -g "Game Name" -status              # Check FSR status
amd-fsr -list                               # List available Steam games
amd-fsr -interactive                        # Guided interactive setup
```

### Help & Information
```bash
amd-fsr -help                               # Show help information
amd-fsr --help                              # Alternative help command
amd-fsr -version                            # Show tool version
amd-fsr -gpu-info                           # Show GPU information and compatibility
```

## ⚡ Advanced Commands

### Batch Operations
```bash
amd-fsr -auto-enable "Game1,Game2,Game3"    # Enable FSR for multiple games
amd-fsr -auto-disable "Game1,Game2,Game3"   # Disable FSR for multiple games
amd-fsr -auto-enable-all                    # Enable FSR for all games
amd-fsr -auto-detect                        # Auto-detect and analyze games
amd-fsr -auto-optimize-all                  # Apply optimal settings to all games
```

### System-Wide Features
```bash
amd-fsr -system-optimize                    # Optimize entire system for FSR
amd-fsr -create-env                         # Create persistent FSR environment
```

### Performance Analysis
```bash
amd-fsr -benchmark "Game" [duration]        # Run performance benchmark
amd-fsr -tune "Game" [target_fps]           # Auto-tune for target FPS
amd-fsr -monitor "Game" [duration]          # Monitor FSR performance
```

### Web Interface
```bash
amd-fsr -web [port]                         # Start web interface (default: 8080)
amd-fsr -web 8080                           # Start web interface on port 8080
amd-fsr -stop-web                           # Stop the web interface
```

### Gamescope Integration
```bash
amd-fsr -gamescope "Game" "1920x1080"       # Create gamescope launcher
amd-fsr -gamescope "Game" "2560x1440"       # Create 1440p gamescope launcher
```

### Backup & Restore
```bash
amd-fsr -backup                             # Backup all FSR configurations
amd-fsr -restore /path/to/backup            # Restore from backup
```

### Preset Management
```bash
amd-fsr -save-preset "name" -quality 1 -sharpening 2    # Save preset
amd-fsr -load-preset "name" -g "Game" -enable           # Load preset and apply
amd-fsr -list-presets                                   # List all saved presets
```

### Profile Management
```bash
amd-fsr -profile create "name"              # Create new profile
amd-fsr -profile load "name"                # Load existing profile
amd-fsr -profile list                       # List all profiles
amd-fsr -profile delete "name"              # Delete profile
```

### Steam Integration
```bash
amd-fsr -steam install-shortcuts            # Install Steam shortcuts
amd-fsr -steam launch-options               # Update Steam launch options
amd-fsr -steam deck-mode                    # Configure for Steam Deck
```

### Maintenance
```bash
amd-fsr -update                             # Check for tool updates
```

## 🔧 Options & Parameters

### FSR Quality Settings
```bash
-quality 0          # Quality mode (77% render, best visuals)
-quality 1          # Balanced mode (67% render, default)
-quality 2          # Performance mode (59% render)
-quality 3          # Ultra Performance (50% render, highest FPS)
```

### FSR Sharpening Levels
```bash
-sharpening 0       # No sharpening
-sharpening 1-2     # Light sharpening
-sharpening 3-4     # Moderate sharpening (recommended)
-sharpening 5       # Maximum sharpening
```

## 📝 Usage Examples

### Basic Examples
```bash
# Enable FSR for Cyberpunk 2077 with default settings
amd-fsr -g "Cyberpunk 2077" -enable

# Enable FSR with specific quality and sharpening
amd-fsr -g "Elden Ring" -enable -quality 2 -sharpening 4

# Check if FSR is enabled for a game
amd-fsr -g "Witcher 3" -status

# Use interactive mode for guided setup
amd-fsr -interactive
```

### Advanced Examples
```bash
# Enable FSR for multiple games with custom settings
amd-fsr -auto-enable "Cyberpunk 2077,Elden Ring,Witcher 3" -quality 1

# Optimize entire system and enable FSR for all games
amd-fsr -system-optimize
amd-fsr -auto-enable-all -quality 2 -sharpening 3

# Auto-detect games and apply optimal settings
amd-fsr -auto-detect
amd-fsr -auto-optimize-all

# Performance analysis workflow
amd-fsr -benchmark "Cyberpunk" 60          # 60-second benchmark
amd-fsr -tune "RDR2" 60                    # Auto-tune for 60fps
amd-fsr -monitor "Game" 120                # Monitor for 2 minutes

# Create gamescope launcher and start web interface
amd-fsr -gamescope "Elden Ring" "1920x1080"
amd-fsr -web 8080

# Preset workflow
amd-fsr -save-preset "gaming" -quality 1 -sharpening 2
amd-fsr -load-preset "gaming" -g "New Game" -enable

# Backup before major changes
amd-fsr -backup
```

### Steam Deck Examples
```bash
# Configure for Steam Deck
amd-fsr -steam deck-mode

# Create optimized launcher for Steam Deck
amd-fsr -gamescope "Game" "1280x800"
```

## 🎯 Quick Reference

| Category | Key Commands |
|----------|-------------|
| **Setup** | `-interactive`, `-system-optimize`, `-gpu-info` |
| **Basic FSR** | `-enable`, `-disable`, `-status`, `-list` |
| **Batch** | `-auto-enable-all`, `-auto-optimize-all`, `-auto-detect` |
| **Performance** | `-benchmark`, `-tune`, `-monitor` |
| **Web** | `-web 8080`, `-stop-web` |
| **Backup** | `-backup`, `-restore` |
| **Advanced** | `-gamescope`, `-presets`, `-profiles` |

## 🚀 Common Workflows

### New User Setup
```bash
# 1. Check system compatibility
amd-fsr -gpu-info

# 2. Optimize system for FSR
amd-fsr -system-optimize

# 3. Auto-detect games and apply settings
amd-fsr -auto-detect
amd-fsr -auto-optimize-all

# 4. Or use interactive mode for guided setup
amd-fsr -interactive
```

### Performance Optimization
```bash
# 1. Backup current settings
amd-fsr -backup

# 2. Benchmark current performance
amd-fsr -benchmark "Game" 60

# 3. Auto-tune for target FPS
amd-fsr -tune "Game" 75

# 4. Monitor real performance
amd-fsr -monitor "Game" 300
```

### Competitive Gaming Setup
```bash
# Create high-performance preset
amd-fsr -save-preset "competitive" -quality 3 -sharpening 1

# Apply to competitive games
amd-fsr -load-preset "competitive" -g "CS2" -enable
amd-fsr -load-preset "competitive" -g "Valorant" -enable
amd-fsr -load-preset "competitive" -g "Apex Legends" -enable
```

### Visual Quality Setup
```bash
# Create quality preset
amd-fsr -save-preset "visual" -quality 0 -sharpening 4

# Apply to single-player games
amd-fsr -load-preset "visual" -g "Cyberpunk 2077" -enable
amd-fsr -load-preset "visual" -g "Witcher 3" -enable
amd-fsr -load-preset "visual" -g "Elden Ring" -enable
```

## 📊 FSR Quality vs Performance Guide

| Quality Mode | Render Resolution | Performance Gain | Best For |
|--------------|-------------------|------------------|----------|
| **Quality (0)** | 77% of target | +5-10 FPS | Single-player, visuals priority |
| **Balanced (1)** | 67% of target | +10-15 FPS | Most games, default choice |
| **Performance (2)** | 59% of target | +15-25 FPS | Competitive gaming |
| **Ultra Performance (3)** | 50% of target | +25-40 FPS | High refresh rate gaming |

## 🔍 Troubleshooting Commands

### Check Installation
```bash
# Verify tool is installed
which amd-fsr

# Check version
amd-fsr -version

# Test all features
./verify-installation.sh   # (if in tool directory)
```

### Debug FSR Issues
```bash
# Check GPU compatibility
amd-fsr -gpu-info

# List detected games
amd-fsr -list

# Check game FSR status
amd-fsr -g "Game Name" -status

# Check configuration files
ls -la ~/.config/amd-fsr/
```

### Performance Issues
```bash
# Run system optimization
amd-fsr -system-optimize

# Create fresh environment
amd-fsr -create-env

# Benchmark to check performance
amd-fsr -benchmark "Game" 30
```

## 🌐 Web Interface Usage

### Starting Web Interface
```bash
# Start on default port (8080)
amd-fsr -web

# Start on custom port
amd-fsr -web 9000

# Access in browser
# http://localhost:8080
```

### Web Interface Features
- **Game Library Management** - View and configure all games
- **Real-time System Status** - GPU info, temperatures
- **Performance Analytics** - Benchmark results, charts
- **Quick Actions** - Enable/disable FSR with one click
- **Configuration Management** - Presets, profiles, settings

### Stopping Web Interface
```bash
amd-fsr -stop-web
```

## 📁 Configuration Files

### Locations
```bash
~/.config/amd-fsr/                          # Main configuration directory
~/.config/amd-fsr/preset_*.conf             # Saved presets
~/.config/amd-fsr/profiles/                 # User profiles
~/.config/amd-fsr/backups/                  # Configuration backups
~/.config/amd-fsr/fsr_environment.sh        # Persistent environment
~/.config/amd-fsr/*.log                     # Performance logs
```

### Game-Specific Files
```bash
/path/to/game/fsr_env.sh                    # Game FSR environment
/path/to/game/fsr_config.conf              # Game FSR configuration
/path/to/game/launch_with_fsr.sh           # Gamescope launcher
```

## 🔗 Related Information

- **GitHub Repository**: https://github.com/Kaiamaterasu/amd-fsr-tool
- **Installation**: `git clone https://github.com/Kaiamaterasu/amd-fsr-tool.git && cd amd-fsr-tool && ./install.sh`
- **Requirements**: AMD GPU, Linux, Steam/Proton
- **License**: MIT License

---

**📝 Note**: This command reference covers all available features of AMD FSR Tool v4.0.0. For the most up-to-date information, run `amd-fsr --help` or check the GitHub repository.

**🎮 Happy Gaming with FSR!** 🚀

