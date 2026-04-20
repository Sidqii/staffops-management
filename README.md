# Mini Project E2E - Frontend (Flutter)

Aplikasi mobile sederhana untuk manajemen task yang dibangun menggunakan Flutter dan terintegrasi dengan REST API Laravel.

Project ini dibuat sebagai bagian dari technical assessment.

---

## 🚀 Tech Stack

* **Framework**: Flutter
* **Bahasa**: Dart
* **State Management**: GetX
* **HTTP Client**: Dio
* **Arsitektur**: Clean Architecture (feature-based)

---

## 📱 Fitur Aplikasi

* Autentikasi:

  * Login
  * Register

* Task Management:

  * Menampilkan daftar task
  * Melihat detail task
  * Membuat task
  * Update task
  * Menghapus task

---

## 🔌 Integrasi API

Aplikasi terhubung dengan backend Laravel melalui REST API.

### Base URL

```dart
class ApiConfig {
  static const String uri = 'https://10.0.2.2:8000/api';
}
```

> Base URL saat ini menggunakan **ngrok** untuk kebutuhan development.

---

## 🏗️ Arsitektur

Project ini menggunakan pendekatan **Clean Architecture (feature-based)** dengan pembagian:

* `features/`

  * `data/` → datasource & model
  * `domain/` → entity & usecase
  * `presentation/` → UI & state (GetX)

* `core/` → shared utilities

* `app/` → konfigurasi aplikasi (routing, dependency injection)

---

## ⚙️ Cara Menjalankan Project

### 1. Install Dependency

```bash
flutter pub get
```

---

### 2. Jalankan Aplikasi

```bash
flutter run
```

Pastikan:

* Emulator atau device sudah berjalan
* Backend API aktif (Laravel server)

---

## ⚠️ Konfigurasi Penting

### API Endpoint

Pastikan URL pada `ApiConfig` sesuai dengan backend yang sedang berjalan:

```dart
static const String uri = 'YOUR_BACKEND_URL/api';
```

Jika menggunakan localhost:

* Gunakan IP lokal (bukan `localhost`) untuk device fisik

---

## 🔄 State Management

Aplikasi menggunakan **GetX** untuk:

* State management
* Dependency injection
* Navigation

State handling yang sudah diimplementasikan:

* Loading state
* Error state
* Empty state

---

## 📦 Dependency Utama

* `get` → state management & navigation
* `dio` → HTTP client
* `intl` → formatting data

---

## 🧠 Catatan

* Endpoint aksi task (`start`, `complete`) sudah tersedia di backend,
  namun belum diintegrasikan ke frontend karena keterbatasan waktu.

* Konfigurasi API masih menggunakan hardcoded base URL (ngrok) untuk kebutuhan development.

---

## 📌 Prasyarat

* Flutter SDK (disarankan versi terbaru stabil)
* Emulator / device Android
* Backend API harus aktif

---

## 👨‍💻 Author

Dikembangkan sebagai bagian dari technical interview assignment.
