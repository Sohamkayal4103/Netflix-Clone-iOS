# 🎬 IMDB Clone (SwiftUI)

A SwiftUI-based iOS application for discovering movies, searching titles, viewing details, and watching trailers via YouTube integration. The app consumes real-world APIs and follows a clean MVVM-style structure.

---

## ✨ Features

- Browse trending, upcoming, and popular movies  
- Search movies by title  
- View detailed movie information (overview, metadata, trailers)  
- Embedded YouTube trailer playback  
- Clean, modular SwiftUI views  
- Lightweight networking layer for API consumption  

---

## 🏗 Architecture

- **SwiftUI** for UI and navigation  
- **MVVM** pattern:
  - Views (`HomeView`, `SearchView`, `TitleDetailView`, etc.)
  - ViewModels (`ViewModel`, `SearchViewModel`)
- **DataFetcher** handles API requests and decoding  
- Reusable list components (`HorizontalListView`, `VerticalListView`)  
- Centralized constants and error handling  

---

## 📁 Project Structure (Simplified)
```
MovieApp/
├── APIConfig.example # API key template (safe to commit)
├── Assets # App assets
├── Constants # Constants & endpoints
├── DataFetcher # Networking layer
├── ViewModel # Shared view models
├── HomeView # Home screen
├── SearchView # Search UI
├── TitleDetailView # Movie details & trailer
├── YoutubePlayer # Embedded YouTube player
├── Errors # Error models
└── MovieAppApp # App entry point
```

---

## 🔐 API Keys Setup

This project uses external APIs (e.g. **TMDB** and **YouTube**).

### 1. Create your local config file

```bash
cp APIConfig.example APIConfig
```

2. Add your API keys

Edit APIConfig and replace the placeholder values with your own API keys.

---

## ▶️ Running the App

- Clone the repository

- Open MovieApp.xcodeproj in Xcode

- Add your API keys as described above

- Select an iOS simulator or device

- Build & Run

---

## 🧪 Requirements

- Xcode 15+

- iOS 17+

- Swift 5.9+

---

🚧 Notes

This project is intended as a learning/demo application

API rate limits depend on your API provider
