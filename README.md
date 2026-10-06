# Kandyagash City App

Mobile app for the city of Kandyagash with:
- Taxi service
- City delivery
- Food ordering
- Local services and businesses
- City map
- Online payment with card / Kaspi / Halyk payment flow
- Profile and notifications
- Admin panel

## Project structure

```text
kandyagash_app/
├── README.md
├── .gitignore
├── pubspec.yaml
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   └── router/
│   │       └── app_router.dart
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   └── app_strings.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   └── utils/
│   │       └── formatters.dart
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── login_screen.dart
│   │   ├── home/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── home_screen.dart
│   │   ├── taxi/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── taxi_screen.dart
│   │   ├── food/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── food_screen.dart
│   │   ├── delivery/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── delivery_screen.dart
│   │   ├── payment/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── payment_screen.dart
│   │   ├── profile/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── profile_screen.dart
│   │   └── orders/
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   │           └── screens/
│   │               └── orders_screen.dart
│   └── generated/
│       └── plugin_registrant.dart
├── test/
│   └── widget_test.dart
├── .github/
│   └── workflows/
│       └── flutter_ci.yml
└── docs/
    ├── api.md
    ├── payment.md
    └── architecture.md
```

## Main modules

### 1. Auth
- Registration/login
- OTP verification
- Password recovery
- Save user token/session

### 2. Home
- City news and announcements
- Quick services
- Top categories
- Popular restaurants and stores

### 3. Taxi
- Request ride
- Select route from map
- Estimated price
- Driver tracking
- Trip history

### 4. Food
- Search by cuisine
- Restaurant cards
- Add to cart
- Delivery time
- Payment at checkout

### 5. Delivery
- Courier delivery request
- Parcel or document delivery
- Pickup and dropoff address fields
- Order tracking

### 6. Payment
- Card payment
- Bank payment
- Kaspi / Halyk flow (or provider integration)
- Payment history
- Receipts and notifications

### 7. Orders
- Active orders
- History
- Order status tracking
- Cancellation

### 8. Profile
- Personal information
- Saved addresses
- Payment methods
- Settings and notifications
- Support

## Recommended architecture

- Flutter + Dart for mobile app
- BLoC / Cubit for state management
- GoRouter for navigation
- Repository pattern for API access
- REST API / Firebase backend
- PostgreSQL or Firestore for database
- Stripe / Kaspi / Halyk integration depending on Kazakhstan requirements

## Suggested MVP

1. Login and registration
2. Home page
3. Food order flow
4. Taxi ordering
5. Delivery order flow
6. Payment screen
7. Order tracking
8. Profile

## Next steps

- Define backend endpoints
- Setup database tables
- Integrate payment gateway
- Create UI screens by feature
- Add notifications and map support

This repo is a starter structure for the Kandyagash city app and can be expanded into a full production project.
