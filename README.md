# WallPix 📱

A Flutter wallpaper app that fetches high-quality images from Pexels API with an elegant dark theme interface.

## Features ✨

- Browse wallpapers across 10+ categories (Sports, Nature, Cars, Animals, etc.)
- High-quality images from Pexels API
- Smooth animations and infinite scroll
- Photo details with photographer credits
- Interactive zoom & pan functionality
- Dark theme with Material Design

## Architecture 🏗️

- **Pattern**: BLoC for state management
- **Structure**: Feature-based with Clean Architecture
- **API**: Pexels REST API integration

## Key Packages 📦

- `flutter_bloc` - State management
- `http` - API calls  
- `google_fonts` - Typography
- `flutter_dotenv` - Environment variables

## Project Structure

```
lib/
├── features/
│   ├── explore/          # Home screen with categories
│   │   ├── bloc/         # State management
│   │   ├── model/        # Data models
│   │   ├── service/      # API service
│   │   └── view/         # UI components
│   └── photo/            # Photo detail screen
└── application.dart      # App configuration
```
