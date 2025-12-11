# ClothHub - Flutter Clothing Store App
## Viva Defense Guide

---

## 📱 APP OVERVIEW

**ClothHub** is a clothing store mobile application built using Flutter that allows:
- **Users** to browse products, add items to cart, and place orders
- **Admins** to manage products and orders

---

## 🏗️ ARCHITECTURE: MVVM (Model-View-ViewModel)

### What is MVVM?
MVVM separates the app into 3 layers:

1. **Model** - Data structures (UserModel, ProductModel, OrderModel, CartItemModel)
2. **View** - UI screens that users see
3. **ViewModel** - Business logic that connects Model and View

### Why MVVM?
- **Separation of Concerns**: UI and logic are separate
- **Testable**: ViewModels can be tested without UI
- **Maintainable**: Easy to understand and modify
- **Reusable**: ViewModels can be reused across different views

---

## 📂 PROJECT STRUCTURE

```
lib/
├── main.dart                    # App entry point
├── firebase_options.dart        # Firebase configuration
│
├── app/                         # App-level configurations
│   ├── routes/                  # Navigation routes
│   ├── themes/                  # App theme and colors
│   └── utils/                   # Constants and utilities
│
├── data/                        # Data layer
│   ├── models/                  # Data models
│   │   ├── user_model.dart
│   │   ├── product_model.dart
│   │   ├── order_model.dart
│   │   └── cart_item_model.dart
│   │
│   └── repositories/            # Data operations
│       ├── auth_repository.dart      # Firebase Authentication
│       ├── user_repository.dart      # User Firestore operations
│       ├── product_repository.dart   # Product CRUD + Cloudinary
│       ├── order_repository.dart     # Order operations
│       └── cart_repository.dart      # Cart operations
│
└── modules/                     # Feature modules
    ├── auth/                    # Authentication module
    ├── profile/                 # User profile module
    ├── user_home/               # User dashboard
    ├── admin/                   # Admin dashboard
    ├── products/                # Product display
    ├── cart/                    # Shopping cart
    └── orders/                  # Order management
```

---

## 🔑 KEY MODULES

### 1. AUTHENTICATION MODULE (`modules/auth/`)

**Purpose**: Handle user login, signup, and password reset

**Files**:
- `auth_controller.dart` - Checks if user is logged in on app start
- `viewmodels/login_viewmodel.dart` - Login logic
- `viewmodels/signup_viewmodel.dart` - Signup logic
- `viewmodels/forgot_password_viewmodel.dart` - Password reset logic
- `views/splash_view.dart` - App splash screen
- `views/login_view.dart` - Login UI
- `views/signup_view.dart` - Signup UI
- `views/forgot_password_view.dart` - Password reset UI

**Flow**:
1. App starts → `SplashView` → `AuthController` checks login status
2. If logged in → Navigate to dashboard (Admin or User)
3. If not logged in → Navigate to Login screen

---

### 2. PROFILE MODULE (`modules/profile/`)

**Purpose**: Collect user details after signup

**Files**:
- `profile_viewmodel.dart` - Profile completion logic
- `views/profile_view.dart` - Profile form UI

**Fields**: Full Name, Gender, Age, Address, Phone Number

---

### 3. USER HOME MODULE (`modules/user_home/`)

**Purpose**: Main dashboard for users with bottom navigation

**Tabs**:
1. **Products** - Browse and view products
2. **Cart** - View and manage cart items
3. **Orders** - View order history

**Files**:
- `user_home_viewmodel.dart` - Tab management and logout
- `views/user_home_view.dart` - Bottom navigation UI

---

### 4. PRODUCTS MODULE (`modules/products/`)

**Purpose**: Display products by category

**Features**:
- Filter by category (Male, Female, All)
- View product details
- Add to cart

**Files**:
- `product_list_viewmodel.dart` - Fetch products from Firestore
- `product_detail_viewmodel.dart` - Handle add to cart
- `views/products_tab_view.dart` - Product grid UI
- `views/product_detail_view.dart` - Product details UI

---

### 5. CART MODULE (`modules/cart/`)

**Purpose**: Manage shopping cart and checkout

**Features**:
- View cart items
- Increase/decrease quantity
- Remove items
- Place order

**Files**:
- `cart_viewmodel.dart` - Cart operations (add, remove, update)
- `views/cart_tab_view.dart` - Cart UI with checkout

---

### 6. ORDERS MODULE (`modules/orders/`)

**Purpose**: Display user's order history

**Files**:
- `order_viewmodel.dart` - Fetch user orders
- `views/orders_tab_view.dart` - Orders list UI

---

### 7. ADMIN MODULE (`modules/admin/`)

**Purpose**: Admin dashboard with 3 tabs

**Tabs**:
1. **Add Product** - Create new products
2. **View Products** - Edit/delete products
3. **Manage Orders** - Update order status

**Sub-modules**:
- `add_product/` - Product creation
- `admin_products/` - Product management
- `admin_orders/` - Order management

---

## 🗄️ DATA MODELS

### 1. UserModel
```dart
- uid: String
- email: String
- fullName: String
- gender: String
- age: int
- address: String
- phoneNumber: String
```

### 2. ProductModel
```dart
- id: String
- name: String
- description: String
- price: double
- category: String (Male/Female)
- imageUrl: String
- createdAt: DateTime
```

### 3. OrderModel
```dart
- orderId: String
- userId: String
- products: List<CartItemModel>
- totalPrice: double
- timestamp: DateTime
- status: String (pending/packed/shipped/delivered)
```

### 4. CartItemModel
```dart
- productId: String
- name: String
- price: double
- imageUrl: String
- quantity: int
```

---

## 🔥 FIREBASE INTEGRATION

### 1. Firebase Authentication
- Email/Password login
- User signup
- Password reset

### 2. Cloud Firestore Database

**Collections**:

1. **users** (User profiles)
   ```
   users/{uid}/
   - uid, email, fullName, gender, age, address, phoneNumber
   - cart (subcollection)
       - {productId}: CartItemModel
   ```

2. **products** (Product catalog)
   ```
   products/{productId}/
   - name, description, price, category, imageUrl, createdAt
   ```

3. **orders** (Order history)
   ```
   orders/{orderId}/
   - userId, products[], totalPrice, timestamp, status
   ```

---

## ☁️ CLOUDINARY INTEGRATION

**Purpose**: Store product images in the cloud

**Process**:
1. Admin selects image from device (using ImagePicker)
2. Image is uploaded to Cloudinary
3. Cloudinary returns image URL
4. URL is saved in Firestore with product data

**Repository**: `ProductRepository.uploadImageToCloudinary()`

---

## 🎨 STATE MANAGEMENT: GetX

### Why GetX?
- **Simple**: Easy to learn and use
- **Reactive**: UI updates automatically when data changes
- **Navigation**: Built-in routing system
- **Dependency Injection**: Manages app dependencies

### Key Concepts:

1. **Reactive Variables** (`.obs`)
   ```dart
   var isLoading = false.obs;  // Observable variable
   isLoading.value = true;     // Update value
   ```

2. **Obx Widget** (Observes changes)
   ```dart
   Obx(() => Text('${viewModel.count.value}'))
   ```

3. **GetxController** (ViewModel)
   ```dart
   class MyViewModel extends GetxController {
     var data = ''.obs;
   }
   ```

4. **Dependency Injection**
   ```dart
   Get.lazyPut(() => AuthRepository());
   Get.find<AuthRepository>();
   ```

---

## 🔐 AUTHENTICATION FLOW

### Login Flow:
1. User enters email and password
2. `LoginViewModel.login()` validates input
3. Calls `AuthRepository.login()`
4. Firebase authenticates user
5. If admin email → Navigate to Admin Dashboard
6. If user email → Navigate to User Home

### Signup Flow:
1. User enters email and passwords
2. `SignupViewModel.signup()` validates input
3. Calls `AuthRepository.signup()`
4. Firebase creates account
5. If admin → Admin Dashboard
6. If user → Profile completion screen

### Auto-Login:
1. App starts → `AuthController.checkAuthStatus()`
2. Checks if user is logged in (Firebase Auth)
3. If admin → Admin Dashboard
4. If user with complete profile → User Home
5. If user with incomplete profile → Profile screen
6. If not logged in → Login screen

---

## 🛒 CART & ORDER FLOW

### Add to Cart:
1. User taps "Add to Cart" on product
2. `ProductDetailViewModel.addToCart()` creates CartItemModel
3. Calls `CartViewModel.addToCart()`
4. `CartRepository` saves to Firestore (`users/{uid}/cart/`)

### Place Order:
1. User taps "Checkout" in cart
2. `CartViewModel.placeOrder()` creates OrderModel
3. `OrderRepository.createOrder()` saves to Firestore (`orders/`)
4. Cart is cleared
5. Order appears in "My Orders"

---

## 🏪 ADMIN CRUD OPERATIONS

### Create Product:
1. Admin fills product form and selects image
2. `AddProductViewModel.addProduct()` validates input
3. Image uploaded to Cloudinary
4. Product saved to Firestore with image URL

### Read Products:
1. `AdminProductsViewModel.fetchAllProducts()`
2. `ProductRepository.getAllProducts()` fetches from Firestore
3. Displayed in grid view

### Update Product:
1. Admin long-presses product → Edit
2. `EditProductView` shows current details
3. Admin updates and saves
4. `ProductRepository.updateProduct()` updates Firestore

### Delete Product:
1. Admin long-presses product → Delete
2. Confirmation dialog appears
3. `AdminProductsViewModel.deleteProduct()`
4. `ProductRepository.deleteProduct()` removes from Firestore

---

## 🎯 KEY FEATURES

### User Side:
✅ Browse products by category (Male, Female, All)
✅ View product details
✅ Add products to cart
✅ Update cart quantities
✅ Place orders
✅ View order history
✅ Persistent cart (saved in Firestore)

### Admin Side:
✅ Add new products with images
✅ View all products
✅ Edit product details
✅ Delete products
✅ View all orders
✅ Update order status (pending → packed → shipped → delivered)

---

## 🧪 HOW TO DEFEND IN VIVA

### Common Questions & Answers:

**Q1: Why did you choose MVVM architecture?**
**A**: MVVM separates UI from business logic, making the code more organized, testable, and maintainable. It follows the principle of separation of concerns.

**Q2: What is the role of Repository?**
**A**: Repository handles all data operations (Firestore, Firebase Auth, Cloudinary). It acts as a single source of truth for data and keeps ViewModels clean from direct database access.

**Q3: How does state management work with GetX?**
**A**: GetX uses reactive programming. We mark variables as observable using `.obs`. When these variables change, the UI automatically rebuilds using `Obx()` widget.

**Q4: Explain the cart persistence mechanism.**
**A**: Cart items are stored in Firestore under `users/{uid}/cart/`. When user adds/removes items, we update Firestore. When app reopens, cart is loaded from Firestore.

**Q5: How do you distinguish between Admin and User?**
**A**: We maintain a list of admin emails in `AppConstants`. After login, we check if the user's email is in this list to determine their role.

**Q6: What is dependency injection in your app?**
**A**: We use GetX's `Get.lazyPut()` to register repositories and view models. When needed, we retrieve them using `Get.find()`. This creates a single instance that's shared across the app.

**Q7: How does image upload work?**
**A**: We use ImagePicker to select images from device. The image is uploaded to Cloudinary using HTTP multipart request with signature authentication. Cloudinary returns a secure URL which we save in Firestore.

**Q8: Explain the order status workflow.**
**A**: Orders start with "pending" status. Admin can update to "packed", then "shipped", and finally "delivered". Status updates are stored in Firestore and reflected in user's order history.

---

## 📊 FIRESTORE SECURITY

In a real app, you should implement Firestore security rules:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /products/{productId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null; // Add admin check
    }
    match /orders/{orderId} {
      allow read: if request.auth != null;
      allow create: if request.auth != null;
    }
  }
}
```

---

## 🚀 FUTURE ENHANCEMENTS

- Payment gateway integration
- Real-time order tracking
- Product reviews and ratings
- Wishlist feature
- Push notifications
- Multi-language support
- Dark mode

---

## ✅ CONCLUSION

This app demonstrates:
- Clean MVVM architecture
- Firebase integration (Auth + Firestore)
- Cloudinary image storage
- GetX state management
- Professional UI/UX
- CRUD operations
- Role-based access (Admin/User)
- Cart persistence
- Order management

**The code is simple, well-structured, and easy to explain in a viva!** 🎓

