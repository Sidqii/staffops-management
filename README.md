# StaffOps Management - Mobile App (Flutter)

A mobile application for task management built with Flutter and integrated with a Laravel-based RESTful API.

---

## 🚀 Tech Stack

* **Framework**: Flutter
* **Language**: Dart
* **State Management**: GetX
* **HTTP Client**: Dio
* **Architecture**: Feature-based layered architecture

---

## 📱 Features

### 🔐 Authentication

* Login
* Register

### 📝 Task Management

* View task list
* View task details
* Create task
* Update task
* Delete task

---

## 🔌 API Integration

The application communicates with a Laravel-based REST API.

### Base URL

```dart
class ApiConfig {
  static const String uri = 'https://10.0.2.2:8000';
}
```

> Note: The base URL can be configured depending on your environment (local, ngrok, or deployed API).

---

## 🏗️ Architecture

This project uses a **feature-based layered structure** inspired by Clean Architecture principles:

* `features/`

  * `data/` → datasource & models
  * `domain/` → entities & use cases
  * `presentation/` → UI & state (GetX)

* `shared/` → shared utilities

* `app/` → app configuration (routing, dependency injection)

---

## ⚙️ Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the App

```bash
flutter run
```

Make sure:

* Emulator or physical device is running
* Backend API server is active

---

## ⚠️ Configuration

### API Endpoint

Update the API base URL in:

```dart
static const String uri = 'YOUR_BACKEND_URL';
```

### ⚠️ Important

Make sure to update the API base URL inside `app/network/dio_client.dart` before running the app:

```dart
baseUrl: ApiConfig.url, // <-- change this based on your backend
```

For local development:

- Use `10.0.2.2` for Android emulator
- Use your local IP for physical devices

> ⚠️ Ensure your backend server is running.

### 📱 Localhost Access (Physical Android Device)

If you are using a **physical Android device**, you can access your local backend (`localhost:8000`) without ngrok using `adb reverse`.

### 1. Make sure your device is connected

```bash
adb devices
```

### 2. Run port reverse

If `adb` is already available in your PATH:

```bash
adb reverse tcp:8000 tcp:8000
```

Otherwise, navigate to your Android SDK `platform-tools` directory:

```bash
cd <your-android-sdk>/platform-tools
adb reverse tcp:8000 tcp:8000
```

After that, use the following base URL:

```dart
static const String uri = 'http://127.0.0.1:8000';
```

### 🔄 (Optional) Remove reverse

```bash
adb reverse --remove-all
```

### ⚠️ Notes

* Only works for Android (not supported on iOS)
* Make sure USB debugging is enabled
* Backend server must be running on port 8000
* No need to use local IP or ngrok

---

## 🔄 State Management

The app uses **GetX** for:

* State management
* Dependency injection
* Navigation

Implemented states:

* Loading state
* Error state
* Empty state

---

## 📦 Main Dependencies

* `get` → state management & navigation
* `dio` → HTTP client
* `intl` → data formatting

---

## 🔗 Related Repository

Backend API:

* [staffops-management-api](https://github.com/Sidqii/staffops-management-api)

---

## 🧠 Notes

* Task action endpoints (`start`, `complete`) are available in the backend but not yet integrated into the mobile app.
* API configuration currently uses a configurable base URL for development purposes.

---

## 📌 Requirements

* Flutter SDK (latest stable recommended)
* Android emulator or physical device
* Running backend API server
