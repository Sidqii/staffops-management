# StaffOps Management - Mobile App (Flutter)

A simple task management mobile application built with Flutter, connected to a Laravel-based REST API.

---

## 🚀 Tech Stack

* **Framework**: Flutter
* **Language**: Dart
* **State Management**: GetX
* **HTTP Client**: Dio

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

This app consumes a Laravel REST API.

### Base URL Configuration

```dart
class ApiConfig {
  static const String uri = 'http://10.0.2.2:8000';
}
```

> The base URL should be adjusted depending on your environment (emulator, physical device, or deployed API).

---

## 🏗️ Project Structure

This project uses a **feature-based layered structure** to organize code:

```
features/
  ├── data/           # API calls & models
  ├── domain/         # entities & basic business logic
  └── presentation/   # UI & GetX state

shared/               # shared utilities
app/                  # app-level config (routing, DI)
```

> Note: The structure is inspired by layered architecture, but not a strict Clean Architecture implementation.

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

* Emulator or device is running
* Backend API server is active

---

## ⚠️ Configuration

### Update API Endpoint

Edit the base URL:

```dart
static const String uri = 'YOUR_BACKEND_URL';
```

Also ensure it's used in:

```dart
baseUrl: ApiConfig.uri,
```

---

## 📱 Local Development (Android)

### Emulator

Use:

```
http://10.0.2.2:8000
```

### Physical Device (ADB Reverse)

1. Connect device:

```bash
adb devices
```

2. Run:

```bash
adb reverse tcp:8000 tcp:8000
```

3. Use:

```dart
http://127.0.0.1:8000
```

---

## 🔄 State Management

The app uses **GetX** for:

* State management
* Dependency injection
* Navigation

Basic states implemented:

* Loading
* Error
* Empty

---

## 📦 Dependencies

* `get` → state management & navigation
* `dio` → HTTP client
* `intl` → formatting

---

## 🔗 Related Repository

Backend API:
https://github.com/Sidqii/staffops-management-api

---

## 🧠 Notes

* Some backend features (e.g. task actions like `start` and `complete`) are not yet integrated in the mobile app
* API base URL is configurable for development flexibility

---

## 📌 Requirements

* Flutter SDK (latest stable recommended)
* Android emulator or physical device
* Running backend API server
