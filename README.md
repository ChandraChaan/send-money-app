# Send Money Application

## Overview
The **Send Money Application** is a cross-platform mobile app designed to simplify money transfers, provide real-time wallet balance updates, and display transaction history. Built using Flutter, the app ensures high performance and supports offline functionality for a seamless user experience.

## Features
1. **Login & Authentication**:
    - Secure username and password login.
    - Persistent login state with the ability to log out on any screen.

2. **Dashboard**:
    - Display wallet balance with a show/hide feature.
    - Options to send money or view transaction history.

3. **Send Money**:
    - Input screen to enter transfer amount (numeric only).
    - Confirmation via a success or error message displayed in a bottom sheet.

4. **Transaction History**:
    - Detailed list of past transactions, including amounts and timestamps.

5. **Offline Mode**:
    - View the last fetched wallet balance and transaction history when offline.
    - Auto-sync with the server once the app regains connectivity.

6. **API Integration**:
    - Mock APIs (e.g., [jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com/)) for data simulation.
    - Perform GET and POST requests to fetch and update transactions.

## Installation and Setup
### Prerequisites
- Flutter SDK installed ([Get Started with Flutter](https://flutter.dev/docs/get-started)).
- Code editor (e.g., Visual Studio Code or Android Studio).

### Steps to Run the Application
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/send-money-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd send_money_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

5. (Optional) Run the unit tests:
   ```bash
   flutter test
   ```

## Technical Stack
- **Framework**: Flutter (Dart)
- **State Management**: Provider or setState
- **Storage**: SharedPreferences for offline data
- **Testing**: Flutter's built-in testing framework
- **API**: Mock JSON API for demonstration purposes

## Project Structure
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
   utils/
      constants.dart
   main.dart
```

## Bonus Features
- **Design Documentation**:
    - Class Diagram: Representing the app’s structure.
    - Sequence Diagram: Showcasing key interactions, like login and API calls.

## Time Spent
Please include the total hours spent on this project in your email when submitting.

## Contributions
To contribute:
1. Fork the repository.
2. Create a new branch (`feature/your-feature-name`).
3. Commit your changes and push them to your fork.
4. Create a pull request for review.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

