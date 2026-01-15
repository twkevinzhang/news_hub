# News Hub

> A unified multi-forum browser powered by dynamic extensions

Browse multiple online forums seamlessly in one modern Android app. Add new forums without app updates through the extension system.

## ✨ Features

### Core Capabilities

- 🌐 **Multi-Forum Support** - Browse different forums through dynamically installable extensions
- 📚 **Collections** - Organize forum boards into custom collections for easy access
- 🔍 **Advanced Search** - Search threads across boards with powerful filtering options
- 📌 **Bookmarks** - Save and organize your favorite threads
- 🎨 **Material Design 3** - Modern, adaptive UI with dark mode support

### Rich Media Experience

- 🖼️ **Image Galleries** - Swipe through images with full-screen preview
- 🎥 **Video Playback** - Inline video player with custom controls
- 📱 **Infinite Scroll** - Smooth pagination for thread lists and replies
- 🌲 **Thread Tree View** - Visualize reply relationships in a tree diagram

### Developer-Friendly

- 🔌 **Extension System** - Python-based scrapers for adding new forums
- 🔧 **Hot-Swappable Backend** - Connect to local or remote Sidecar server
- 📡 **gRPC Communication** - High-performance client-server architecture

## 📸 Screenshots

<!-- TODO: Add actual screenshots here -->

**Main Interface:**

```
[Screenshot: Home screen with navigation drawer showing collections and boards]
- Left: Navigation drawer with expandable collections
- Center: Thread list with image thumbnails and titles
- Top: Search bar and settings icon
- Bottom: Sidecar connection status indicator
```

**Thread Browsing:**

```
[Screenshot: Thread list view]
- Card-based layout with preview images
- Thread titles, author info, and reply counts
- Pull-to-refresh functionality
```

**Thread Detail:**

```
[Screenshot: Thread detail page]
- Original post with rich text and embedded media
- Paginated reply list
- Image gallery overlay for photos
- Video player for media content
```

**Extension Management:**

```
[Screenshot: Extension management screen with three tabs]
- Repositories tab: Manage extension sources
- Installed tab: View and uninstall extensions
- Browse tab: Discover and install new extensions
```

**Search Interface:**

```
[Screenshot: Search overlay]
- Advanced search form with multiple filters
- Search history and suggestions
- Real-time search results
```

## 🎯 What Makes News Hub Different?

**Extension-Based Architecture**

Unlike traditional forum apps that hard-code specific websites, News Hub uses a plugin-like extension system. Each forum is supported by a Python scraper that runs in an embedded sidecar service, making it trivial to add support for new forums without app updates.

**Clean Architecture**

Built with Domain-Driven Design (DDD) principles:

- **Flutter Frontend**: Clean Architecture with BLoC state management
- **Python Backend**: DDD-layered architecture with gRPC services
- **Offline-First**: Local SQLite database with Drift ORM

**Privacy-Focused**

- No user tracking or analytics
- No advertisements
- All data stored locally on your device

## 📥 Download

### Latest Release

Get the latest version from our **[GitHub Releases](https://github.com/twkevinzhang/news_hub/releases)** page.

### Two Build Variants

| Variant     | Description                         | Size  | Use Case           |
| ----------- | ----------------------------------- | ----- | ------------------ |
| **Sidecar** | Includes embedded Python runtime    | ~50MB | Standalone usage   |
| **Remote**  | Connects to external sidecar server | ~10MB | For advanced users |

Most users should download the **Sidecar** variant for a complete out-of-the-box experience.

### System Requirements

- **Platform**: Android 7.0+ (API level 24+)
- **Storage**: ~50MB free space
- **Permissions**: Internet access, storage (for downloading extensions)

## 🚀 Quick Start

1. **Download** the APK from the [releases page](https://github.com/twkevinzhang/news_hub/releases)
2. **Install** the app (enable "Install from unknown sources" if needed)
3. **Open** News Hub and wait for the sidecar service to initialize
4. **Manage Extensions**:
   - Tap Settings → Repo & Extensions
   - Add an extension repository (e.g., GitHub repo URL)
   - Browse and install extensions for your favorite forums
5. **Create a Collection**:
   - Open the navigation drawer
   - Tap "Create Collection"
   - Select boards from installed extensions
6. **Start Browsing!**

## 🛠️ For Developers

Want to contribute, build from source, or create your own extensions?

📖 **[Development Guide](./docs/DEVELOPMENT.md)** - Complete setup and development workflow
🏗️ **[Sidecar Architecture](./sidecar/ARCHITECTURE.md)** - Backend design principles
🤖 **[AI Development Guidelines](./docs/AGENTS.md)** - AI-assisted development rules

### Quick Dev Setup

```bash
git clone https://github.com/twkevinzhang/news_hub.git
cd news_hub
make install
make run-sidecar
```

## 🧩 Extension Development

Create custom forum scrapers in Python:

```python
# resolver_impl.py
from lxml import html

class ResolverImpl:
    def get_threads(self, board_id: str):
        # Implement scraping logic
        pass
```

See existing extensions at [news_hub_extensions](https://github.com/twkevinzhang/news_hub_extensions).

## 🗺️ Roadmap

- [ ] iOS support
- [ ] Reading history tracking
- [ ] Advanced bookmark organization
- [ ] Web login for authenticated forums
- [ ] CI/CD pipeline with automated testing

## 📝 License

MIT

## 🙏 Acknowledgments

Built with:

- [Flutter](https://flutter.dev/) - Cross-platform UI framework
- [serious_python](https://github.com/flet-dev/serious-python) - Python embedding for Flutter
- [gRPC](https://grpc.io/) - High-performance RPC framework

---

**Made with ❤️ by the News Hub community**
