# 🎬 Netflix Clone (SwiftUI)

A SwiftUI-based iOS application for discovering movies, searching titles, viewing details, and watching trailers via YouTube integration. The app consumes real-world APIs and follows a clean MVVM-style structure.

---

---

## 📸 Screenshots

<table>
  <tr>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/a27163ec-412e-4963-923c-74f004a765f1" alt="HomeView" width="260" />
      <br/><sub><b>HomeView</b></sub>
    </td>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/fc0f2f89-0d27-4791-ae47-89de3c595296" alt="HomeView2" width="260" />
      <br/><sub><b>HomeView (More)</b></sub>
    </td>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/af06c5e1-7e38-46f7-a225-5f6d694a8551" alt="SearchView" width="260" />
      <br/><sub><b>SearchView</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/17d8f3e0-e616-474c-b59c-fb487fbc7a0c" alt="TitleDetailView" width="260" />
      <br/><sub><b>TitleDetailView</b></sub>
    </td>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/213043c2-dd82-4db1-b3df-90d8ceb721c0" alt="UpcomingView" width="260" />
      <br/><sub><b>UpcomingView</b></sub>
    </td>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/968fc77a-cf52-4f79-a08f-57248b41121d" alt="DownloadView" width="260" />
      <br/><sub><b>DownloadView</b></sub>
    </td>
  </tr>
</table>

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
