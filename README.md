# 🛒 ecommerce_app

## 🎥 App Demo (YouTube)
Check out the full demo of the app on YouTube:  
👉 [Watch the Video](https://www.youtube.com/watch?v=ud6hY3njbgI)

## 📸 Screenshots

<table>
  <tr>
    <td><img src="screenshots/splash_screen.png" alt="Splash" width="160"/></td>
    <td><img src="screenshots/onboarding.png" alt="Onboarding" width="160"/></td>
    <td><img src="screenshots/sign_in.png" alt="Sign In" width="160"/></td>
  </tr>
  <tr>
    <td><img src="screenshots/sign_up.png" alt="Sign Up" width="160"/></td>
    <td><img src="screenshots/account_en.png" alt="Account EN" width="160"/></td>
    <td><img src="screenshots/account_ar.png" alt="Account AR" width="160"/></td>
  </tr>
  <tr>
    <td><img src="screenshots/home.png" alt="Home" width="160"/></td>
    <td><img src="screenshots/view_all.png" alt="View All" width="160"/></td>
    <td><img src="screenshots/product_details.png" alt="Product Details" width="160"/></td>
  </tr>
  <tr>
    <td><img src="screenshots/search.png" alt="Search" width="160"/></td>
    <td><img src="screenshots/saved_items.png" alt="Saved Items" width="160"/></td>
    <td><img src="screenshots/cart.png" alt="Cart" width="160"/></td>
  </tr>
  <tr>
    <td><img src="screenshots/check_out.png" alt="Checkout" width="160"/></td>
  </tr>
</table>

🛠️ Installation & Run Locally

Prerequisites:

Flutter SDK (>=3.10.0)

Dart SDK (comes with Flutter)

Git

Steps:
# 1. Clone the repository
$ git clone https://github.com/Abdelrhman-Tec/ShopZen.git
$ cd ShopZen

# 2. Install dependencies
$ flutter pub get

# 3. Run on connected device or emulator
$ flutter run
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


