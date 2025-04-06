## 🎯 Final UI Screens

Here’s a look at the real app screens while using the **Shimmer Effect** in a Flutter app built with **Clean Architecture**.

---

### 🕸️ Shimmer Loading Screen

<img src="assets/screenshots/shimmerLoading.png" alt="Shimmer Loading" width="300"/>

🔹 Shows loading placeholders using shimmer effect while waiting for data from API or local database.

---

### 📋 Fetched Data UI

<img src="assets/screenshots/loadedState.png" alt="Loaded Data UI" width="300"/>
<img src="assets/screenshots/loadedState2.png" alt="Loaded Data UI" width="300"/>

🔹 Displays user data and posts after successful data fetch.  
🔹 Data is retrieved using proper clean architecture layers (use case → repository → data source).

---

### 🔄 Clean Architecture Flow Visual

<img src="assets/screenshots/clean_architecture_flow.png" alt="Clean Architecture Diagram" width="500"/>

🧠 This diagram shows how each layer communicates cleanly:  
`UI → UseCase → Repository → DataSource → Model`

---

## 📸 How to Add Your Screenshots

1. Place your images in:  
   `assets/screenshots/`

2. Update your `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/screenshots/
