# StaffOps Management - Mobile App (Flutter)

A simple task management mobile application built with Flutter, connected to a Laravel-based REST API.


## 📥 Download APK

👉 [Download Latest APK](https://drive.google.com/file/d/1zX-obnYAdDa-kIeFDj0nCeMelDbYwTNC/view?usp=sharing)

You can also view the portfolio documentation on [Google Drive](https://drive.google.com/drive/folders/1CyTqHiqlpOPjSQQWTDkT3lkxnYNpr3QB?usp=sharing)

## 🚀 Tech Stack

* **Framework**: Flutter
* **Language**: Dart
* **State Management**: GetX
* **HTTP Client**: Dio

## 📱 Features

Authentication:

* Login
* Register

Task Management:

* View task list
* View task details
* Create task
* Update task
* Delete task

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

## ⚙️ Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the App

```bash
flutter run
```

## 🔄 State Management

The app uses **GetX** for:

* State management
* Dependency injection
* Navigation

Basic states implemented:

* Loading
* Error
* Empty

## 📦 Dependencies

* `get` → state management & navigation
* `dio` → HTTP client
* `intl` → formatting

## 🔗 Related Repository

Backend API: [staffops-management-api](https://github.com/Sidqii/staffops-management-api)

## 🧠 Notes

* Some backend features (e.g. task actions like `start` and `complete`) are not yet integrated in the mobile app
* API base URL is configurable for development flexibility

## 📌 Requirements

* Flutter SDK (latest stable recommended)
* Android emulator or physical device
