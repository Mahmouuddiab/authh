📸 Screenshots
<p align="center">
  <img src="screenshots/Screenshot_20250729_025510.png" width="200"/>
  <img src="screenshots/Screenshot_20250729_025543.png" width="200"/>
  <img src="screenshots/Screenshot_20250729_025556.png" width="200"/>
  <img src="screenshots/Screenshot_20250729_044155.png" width="200"/>
  <img src="screenshots/Screenshot_20250729_045130.png" width="200"/>
</p>


## 🌟 Overview

Weather applications are software tools designed to provide users with up-to-date and accurate information about current and future weather conditions,
often leveraging data from meteorological sources, satellites, and weather stations to deliver forecasts,
real-time updates, and additional features like radar maps, widgets, and alerts for severe weather.

## 🚀 Features

- 📜 **Weather Details:** Fetch and display all details using a RESTful API.
- 📱 **Responsive UI:** Optimized for both phones and tablets.
- 🌙 **Weather Design Touch:** Minimal and calm user interface aligned with the purpose of the app.
- ⚡ **Smooth Performance:** Built with best practices to ensure fast loading and responsiveness.

---


## 📂 Folder Structure

```plaintext
lib/
├── core/             # API services and utilities
│   └── api_service.dart
├── models/           # Surah models
│   └── surah_model.dart
├── screens/          # UI screens
│   ├── home_screen.dart
│   ├── surah_detail_screen.dart
│   └── audio_player_screen.dart
├── widgets/          # Reusable UI components
│   └── surah_tile.dart
├── bloc/             # Bloc state management files
│   ├── surah_bloc.dart
│   ├── surah_event.dart
│   └── surah_state.dart
└── main.dart         # App entry point

To run the app locally, follow these steps:
# 1. Make sure Flutter SDK is installed
flutter --version

# 2. Clone the repository
git clone https://github.com/tokaahmed345/Al-Quran-app.git
cd Al-Quran-app

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run