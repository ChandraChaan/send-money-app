# Send Money App

### Overview
The **Send Money App** is a mobile application built with Flutter to facilitate secure login, wallet management, money transfers, and transaction history viewing. It follows a modular architecture (MVVM) and includes robust error handling, offline support, and scalability features.

---

### Features
- **User Authentication**: Secure login and session management.
- **Wallet Balance**: Display real-time wallet balance with offline support.
- **Money Transfer**: Send money with input validation and success/error feedback.
- **Transaction History**: View transaction history sorted by date with offline caching.
- **Responsive Design**: Works seamlessly across multiple devices.

---

### Project Structure
```
lib/
   screens/
      login_screen.dart
      dashboard_screen.dart
      send_money_screen.dart
      transactions_screen.dart
   widgets/
      bottom_sheet.dart
      custom_text_field.dart
   models/
      transaction.dart
   services/
      api_service.dart
   viewmodels/
      login_viewmodel.dart
      transaction_viewmodel.dart
   utils/
      constants.dart
   main.dart
```

---

### How to Run

#### 1. Clone the Repository
```bash
git clone <repository_url>
cd send_money_app
```

#### 2. Install Dependencies
```bash
flutter pub get
```

#### 3. Run the Application
```bash
flutter run
```

#### 4. Build for Production
- For Android:
```bash
flutter build apk
```
- For iOS:
```bash
flutter build ios
```

---

### Running Unit Tests

#### 1. Install Test Dependencies
Ensure `flutter_test` and `mockito` are included in **pubspec.yaml**:
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.0
  build_runner: ^2.0.0
```

Install them using:
```bash
flutter pub get
flutter pub run build_runner build
```

#### 2. Execute Tests
- Run all test cases:
```bash
flutter test
```
- Run specific test cases:
```bash
flutter test test/viewmodels/login_viewmodel_test.dart
```

---

### Test Coverage

#### Unit Tests
- **LoginViewModel**: Validates user authentication and session management.
- **TransactionViewModel**: Handles wallet balance and transaction logic.

#### Widget Tests
- Verifies UI interactions, navigation flows, and input validations.

---

### Error Handling
- **Network Errors**: Displays “No Internet Connection” messages.
- **Input Validation**: Shows user-friendly messages for invalid inputs.

---

### Future Enhancements
- Add multi-user support.
- Implement dark mode for accessibility.
- Enhance analytics for user spending patterns.

---

### Contributors
- **Developer**: Chandra ObulaReddy Dumpala

---

### Contact
For inquiries or issues, please contact:
- **Email**: [chandraobulredd@gmail.com](mailto:chandraobulredd@gmail.com)
- **GitHub**: [chandrachaan](https://github.com/chandrachaan)
