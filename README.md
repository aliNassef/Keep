# Keep Notes App 📝

A clean and elegant note-taking application built with Flutter that supports both light and dark themes. Create, edit, and manage your notes with image support.

## ✨ Key Features

- ✏️ Create, edit and delete notes
- 🌙 Light/Dark theme support 
- 🖼️ Add images to notes
- 🔍 Search functionality
- 💫 Smooth transitions and animations
- 🔔 Scheduled local notifications
- 📱 Clean and intuitive UI

## 🛠️ Technical Features

- **State Management**: 
  - Flutter Bloc for predictable state management
  - Organized business logic with Cubits

- **Local Storage**:
  - Hive database for efficient local storage
  - Type adapters for custom objects

- **Navigation**:
  - Go Router for declarative routing
  - Custom page transitions

- **Notifications**:
  - Local notifications support
  - Background task scheduling with Workmanager
  - Daily reminders

- **UI Components**:
  - Responsive design with ScreenUtil
  - Staggered grid layout
  - Custom animations
  - Form validation

## 🏗️ Architecture

The project follows a clean architecture pattern with:
- Feature-first directory structure
- Separation of UI, business logic, and data layers
- Reusable core components
- Dependency injection

## 📦 Dependencies

- `flutter_bloc`: State management
- `go_router`: Navigation
- `hive_flutter`: Local storage
- `flutter_local_notifications`: Notifications
- `workmanager`: Background tasks
- `flutter_staggered_grid_view`: Grid layouts
- `flutter_screenutil`: Responsive UI
- `equatable`: Value equality
- `image_picker`: Image selection

## 🎥 Demo

Check out the app demo on YouTube:
[Watch the video](https://youtu.be/Dd3VoTYjDIo)

## 🚀 Getting Started

1. Clone the repository
bash
git clone https://github.com/yourusername/keep-notes.git

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```
 
## 👤 Author

Created by [Ali Nassef]
