# 🛍️ ClothHub - Flutter Clothing Store App

A full-featured **Flutter e-commerce mobile application** for a clothing store with separate **Admin** and **User** interfaces. Built using **MVVM architecture**, **GetX state management**, and **Firebase backend**.

---

## 📱 Features

### 👤 User Side
- **Authentication** - Sign up, Login, Forgot Password with session persistence
- **Profile Management** - View, Edit, Delete user profile
- **Product Browsing** - Browse by categories (Male/Female)
- **Shopping Cart** - Add/Remove items with real-time updates
- **Order Management** - Place orders and track order status

### 🔐 Admin Side
- **Product Management** - Full CRUD operations (Create, Read, Update, Delete)
- **Image Upload** - Upload product images via Cloudinary
- **Order Management** - View all orders and update status (Pending → Packed → Shipped → Delivered)

---

## 🏗️ Architecture

```
lib/
├── app/
│   ├── routes/          # App navigation routes
│   ├── services/        # Auth navigation service
│   ├── themes/          # App theming
│   └── utils/           # Utility functions
├── data/
│   ├── models/          # Data models (User, Product, Order, CartItem)
│   └── repositories/    # Data layer (Auth, User, Product, Order, Cart, Media)
└── modules/
    ├── admin/           # Admin dashboard, products, orders
    ├── auth/            # Authentication (Login, Signup, Forgot Password)
    ├── cart/            # Shopping cart
    ├── orders/          # User orders
    ├── products/        # Product listing & details
    ├── profile/         # User profile management
    └── user_home/       # User home with bottom navigation
```

### 📐 MVVM Pattern
Each module follows strict **Model-View-ViewModel** structure:
```
/module_name
   ├── model/        → Data models
   ├── repository/   → Firebase/Cloudinary operations
   ├── viewmodel/    → GetX Controllers (business logic)
   └── view/         → UI Screens
```

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| **Flutter** | Cross-platform mobile framework |
| **Dart** | Programming language |
| **Firebase Auth** | User authentication |
| **Cloud Firestore** | NoSQL database |
| **Cloudinary** | Image storage & CDN |
| **GetX** | State management, DI & routing |
| **Image Picker** | Camera/Gallery image selection |
| **Google Fonts** | Typography |

---

## 📦 Dependencies

```yaml
dependencies:
  firebase_core: ^4.2.1
  firebase_auth: ^6.1.2
  cloud_firestore: ^6.1.0
  get: ^4.7.3
  cloudinary_sdk: ^5.0.0+1
  image_picker: ^1.0.7
  google_fonts: ^6.3.3
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.9.2)
- Android Studio / VS Code
- Firebase project configured
- Cloudinary account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/clothhub.git
   cd clothhub
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add `google-services.json` to `android/app/`
   - Update `firebase_options.dart`

4. **Configure Cloudinary**
   - Update credentials in `MediaRepository`

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 📊 State Management

Using **GetX** for:
- **Reactive State** - `.obs` variables with `Obx()` widgets
- **Dependency Injection** - `Get.lazyPut()` and `Get.put()`
- **Route Management** - Named routes with `GetMaterialApp`
- **Real-time Updates** - Firestore streams for live data sync

---

## 🔄 Real-time Data Flow

```
Firestore (snapshots) → Repository (Streams) → ViewModel (RxList) → View (Obx)
```

---

## 🎨 UI Features

- Material 3 Design
- Bottom Navigation Bar (User & Admin)
- Responsive card-based layouts
- Clean form inputs with validation
- Loading states and error handling

---

## 🔮 Future Improvements

- [ ] Push notifications for order updates
- [ ] Payment gateway integration
- [ ] Product search and filters
- [ ] Wishlist functionality
- [ ] Product reviews and ratings
- [ ] Multi-language support
- [ ] Dark mode theme

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

Built with ❤️ using Flutter

---

**⭐ Star this repo if you found it helpful!**
