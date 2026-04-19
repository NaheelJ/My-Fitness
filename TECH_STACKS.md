# 🧰 TECH STACK PROMPT — 90 DAYS DISCIPLINE APP

## 🎯 OBJECTIVE

Develop a Flutter mobile application called **“90 Days Discipline”** using a simple, scalable, and offline-first architecture.

The app must:

* Work fully without authentication
* Store data locally
* Sync with cloud (optional backup)
* Be fast, minimal, and easy to maintain

---

# 📱 FRONTEND

## Framework:

* Flutter (latest stable)

## Language:

* Dart

---

# 🧠 STATE MANAGEMENT

Use:

* Provider

### Requirements:

* Minimal rebuilds
* Clean separation of logic
* No complex patterns (avoid Bloc, Riverpod)

---

# 💾 LOCAL STORAGE (PRIMARY DATA SOURCE)

Use:

* Hive (preferred)

### Purpose:

* Store daily routine data
* Store progress (90 days)
* Store streak and rules
* Enable full offline usage

### Requirements:

* Fast read/write
* Structured models (DayModel, UserModel)
* Must work without internet

---

# ☁️ CLOUD STORAGE (OPTIONAL SYNC)

Use:

* Firebase Firestore

### Purpose:

* Backup user data
* Sync history across reinstall
* Store all 90-day records

### Rules:

* App must work without Firestore
* Sync only when internet available
* No authentication required (use single-user document or device ID)

---

# 🔔 NOTIFICATION SYSTEM

Use:

* flutter_local_notifications

### Features:

* Morning reminder (5:30–7 AM)
* Evening reminder (4–6 PM)
* Night reminder (10 PM)

---

# 📊 DATA VISUALIZATION

Use:

* fl_chart

### Purpose:

* Show weight progress graph
* Show simple weekly progress

---

# 📅 DATE & TIME HANDLING

Use:

* intl package

### Purpose:

* Format dates
* Track daily progress
* Calculate streaks and missed days

---

# 🧱 PROJECT ARCHITECTURE

## Folder Structure:

lib/
┣ core/
┣ models/
┣ providers/
┣ services/
┣ views/
┣ widgets/
┗ main.dart

---

## MODELS:

* DayModel
* ProgressModel
* WeightModel

---

## PROVIDERS:

* RoutineProvider
* ProgressProvider
* SettingsProvider

---

## SERVICES:

* LocalStorageService (Hive)
* FirestoreService (sync only)
* NotificationService

---

# ⚙️ CORE SYSTEM REQUIREMENTS

## 1. OFFLINE-FIRST ARCHITECTURE

* All data saved in Hive first
* Firestore used only for backup
* App must function without internet

---

## 2. RULE ENGINE

Implement logic for:

* Streak calculation
* Reset after 7 missed days
* Comeback mode (3–6 missed days)
* Skip token system

---

## 3. DAILY LOCK SYSTEM

* Lock previous day after 24 hours
* Prevent editing past data

---

## 4. PERFORMANCE REQUIREMENTS

* Fast load time (<1 second)
* Smooth UI transitions
* Minimal widget rebuilds

---

## 5. SIMPLICITY PRINCIPLE

* Single main dashboard
* Avoid deep navigation
* Clear UI with large touch targets

---

# 🔧 DEVELOPMENT TOOLS

Use:

* Visual Studio Code OR Android Studio
* Flutter SDK (latest stable)

---

# 🔌 FIREBASE SETUP (WITHOUT AUTH)

* Create Firebase project
* Enable Firestore
* Add Android app
* Add google-services.json

### Data Strategy:

* Use a single document per device
* Or generate device-based ID
* No login system required

---

# ⚠️ RESTRICTIONS

Do NOT use:

* Authentication systems
* Complex state management
* Heavy backend logic
* Unnecessary third-party packages

---

# 🎯 FINAL TECH STACK SUMMARY

* Flutter + Dart
* Provider (state management)
* Hive (local database)
* Firebase Firestore (optional sync)
* flutter_local_notifications
* fl_chart
* intl

---

# 🧠 DEVELOPMENT PRINCIPLE

Focus on:

* Speed
* Simplicity
* Daily usability

Avoid overengineering.
