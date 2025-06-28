# 🛒 ecommerce_app


 ## 🖼️ Screenshots

### 🏠 Home
![Home](assets/screenshots/home.png)

### 🔍 Search
![Search](assets/screenshots/search.png)

### 🛒 Product Details
![Details](assets/screenshots/products_details.png)

### 🔐 Sign In
![Sign In](assets/screenshots/sign_in.png)

### 📝 Sign Up
![Sign Up](assets/screenshots/sign_up.png)

### 🔄 Forgot Password
![Forgot Password](assets/screenshots/forgot_password.png)

### 🚀 Onboarding
![Onboarding](assets/screenshots/onboarding.png)


**ecommerce_app** is a modern, scalable Flutter e-commerce application that showcases best practices in mobile app development.  
It combines **Firebase** for authentication and database, **Cubit** for state management, and **REST APIs** for dynamic product content.

---

## 📱 About the App

This app simulates a full-featured e-commerce shopping experience with the following capabilities:

- User Registration & Login (via Firebase Auth)
- Product Browsing from a public API (FakeStoreAPI)
- Cart Management with item count & total price
- Order Confirmation with data saved to Firestore
- Clean UI with bottom navigation
- Fully responsive and maintainable architecture

---

## 🚀 Features

- ✅ Firebase Authentication (Email/Password)
- 🛍️ Product listing from REST API
- 🛒 Add to cart / Remove from cart
- 🧾 Place orders and save to Firestore
- 📄 View profile and order summary
- 🧠 Cubit (flutter_bloc) for clean state management
- 🔥 Feature-based modular architecture

---

## 🔗 Public API Used

We use the [FakeStoreAPI](https://fakestoreapi.com/) for fetching product listings:
- `https://fakestoreapi.com/products` - Get all products
- `https://fakestoreapi.com/products/{id}` - Get product details
- `https://fakestoreapi.com/cart/{id}` cart by id
- `https://fakestoreapi.com/cart/` - Get cart details

This API is free and perfect for demo/testing purposes.

---

## 📁 Project Structure

```
lib/
├── core/            # Shared constants, services, widgets
├── config/          # Theme & Firebase options
├── data/            # Shared models & API handlers
├── features/        # Modular features (auth, cart, products, orders, etc.)
├── routes/          # App navigation
├── main.dart
└── app.dart
```

---

## ⚙️ Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Abdelrhman-tech/ecommerce_app.git
cd ecommerce_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Setup Firebase

- Go to [Firebase Console](https://console.firebase.google.com)
- Create a new project
- Enable **Email/Password Authentication**
- Add Android & iOS apps and download:
  - `google-services.json` → `android/app/`
  - `GoogleService-Info.plist` → `ios/Runner/`
- Run Firebase CLI:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

### 4. Run the App

```bash
flutter run
```

---

## 📸 Screenshots

*Coming soon...*

---

## 🤝 Contributing

Contributions are welcome! Please fork the repository and submit a pull request for review.

---

## 📄 License

This project is licensed under the MIT License.
