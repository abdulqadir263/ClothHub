# ClothHub - Flutter Clothing Store App

## Architecture Overview (MVVM + GetX)

This app follows the **MVVM (Model-View-ViewModel)** pattern with **GetX** for state management, routing, and dependency injection.

---

## Folder Structure

```
lib/
├── main.dart                    # App entry point with DI setup
├── firebase_options.dart        # Firebase configuration
├── app/
│   ├── routes/
│   │   ├── app_routes.dart      # Route name constants
│   │   └── app_pages.dart       # GetPage definitions
│   ├── themes/
│   │   └── app_theme.dart       # Material 3 theme
│   └── utils/
│       └── constants.dart       # App constants (admin emails, etc.)
├── data/
│   ├── models/
│   │   ├── user_model.dart      # User data model
│   │   ├── product_model.dart   # Product data model
│   │   ├── order_model.dart     # Order data model
│   │   └── cart_item_model.dart # Cart item model
│   └── repositories/
│       ├── auth_repository.dart    # Firebase Auth operations
│       ├── user_repository.dart    # User profile & cart operations
│       ├── product_repository.dart # Product CRUD + Cloudinary
│       └── order_repository.dart   # Order CRUD operations
└── modules/
    ├── auth/                    # Authentication module
    ├── profile/                 # User profile completion
    ├── user_home/              # User dashboard with bottom nav
    ├── admin/                  # Admin dashboard with bottom nav
    ├── products/               # Product listing & details
    ├── cart/                   # Shopping cart
    └── orders/                 # Order management
```

---

## Repositories (Data Layer)

### 1. AuthRepository
Handles Firebase Authentication:
- `login()` - Sign in with email/password
- `signup()` - Create new account
- `logout()` - Sign out user
- `sendPasswordResetEmail()` - Password recovery

### 2. UserRepository
Handles user-related Firestore operations:
- `saveUserProfile()` - Save user data to Firestore
- `getUserById()` - Get user profile
- `updateUserProfile()` - Update profile data
- `checkProfileCompletion()` - Verify if profile is complete

### 3. CartRepository
Handles cart operations in Firestore:
- `fetchCart()` - Get cart items
- `addToCart()` - Add item to cart
- `removeFromCart()` - Remove item from cart
- `updateQuantity()` - Update item quantity
- `clearCart()` - Clear all cart items
- `getCartCount()` - Get total cart items count

### 4. ProductRepository
Handles product CRUD + Cloudinary:
- `addProduct()` - Create new product
- `updateProduct()` - Update product data
- `deleteProduct()` - Remove product
- `getAllProducts()` - Fetch all products
- `getProductsByCategory()` - Filter by Male/Female
- `uploadImageToCloudinary()` - Image upload

### 5. OrderRepository
Handles order operations:
- `createOrder()` - Place new order
- `getOrdersByUser()` - Get user's orders
- `getAllOrders()` - Get all orders (admin)
- `updateOrderStatus()` - Change order status

---

## Dependency Injection

All repositories and viewmodels are registered in `main.dart`:

```dart
void _initDependencies() {
  // Repositories
  Get.lazyPut(() => AuthRepository(), fenix: true);
  Get.lazyPut(() => UserRepository(), fenix: true);
  Get.lazyPut(() => ProductRepository(), fenix: true);
  Get.lazyPut(() => OrderRepository(), fenix: true);
  Get.lazyPut(() => CartRepository(), fenix: true);
  
  // ViewModels
  Get.put(CartViewModel(), permanent: true);
  Get.lazyPut(() => ProductListViewModel(), fenix: true);
  Get.lazyPut(() => OrderViewModel(), fenix: true);
  // ... more viewmodels
}
```

**Usage in ViewModels:**
```dart
class OrderViewModel extends GetxController {
  final OrderRepository _orderRepo = Get.find<OrderRepository>();
  // ...
}
```

---

## User Flow

1. **Splash Screen** → Checks auth state
2. **Login/Signup** → Firebase Authentication
3. **Profile Completion** → First-time users fill profile
4. **User Home** → Bottom Navigation with 3 tabs:
   - **Products Tab** → Browse by category, view details, add to cart
   - **Cart Tab** → View cart, update quantities, checkout
   - **Orders Tab** → View order history and status

---

## Admin Flow

1. **Login** → Admin email detected automatically
2. **Admin Dashboard** → Bottom Navigation with 3 tabs:
   - **Add Product** → Form + ImagePicker + Cloudinary upload
   - **View Products** → Grid view, long-press for edit/delete
   - **Manage Orders** → View all orders, update status

---

## Key Features

### User Side
- Category filtering (Male/Female/All)
- Product grid with images
- Add to cart functionality
- Quantity management
- Order placement
- Order history with status tracking

### Admin Side
- Product CRUD operations
- Image upload to Cloudinary
- Order status management (pending → packed → shipped → delivered)

---

## Technologies Used

- **Flutter** - UI framework
- **Firebase Auth** - User authentication
- **Cloud Firestore** - NoSQL database
- **Cloudinary** - Image storage (signed uploads)
- **GetX** - State management, routing, DI
- **Image Picker** - Image selection from gallery
- **Material 3** - Modern UI components

---

## MVVM Pattern Explanation

- **Model** - Data classes (UserModel, ProductModel, etc.)
- **View** - UI widgets (Flutter screens)
- **ViewModel** - GetxController classes (business logic, state)
- **Repository** - Data source abstraction (Firebase, Cloudinary)

The View observes the ViewModel using `Obx()`, and the ViewModel calls Repository methods for data operations.

