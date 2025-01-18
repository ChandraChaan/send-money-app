# Project README

## Overview
This project is a Flutter-based money transfer application that includes functionalities for user authentication, viewing transactions, sending money, and handling API data. The app uses the `Provider` package for state management, `SharedPreferences` for local storage, and `http` for API calls. The UI is responsive and dynamically adapts to different screen sizes.

## Features
1. **Authentication**:
   - Login functionality with persistent state management using `SharedPreferences`.
   - Logout functionality accessible globally from any page.

2. **Dashboard**:
   - Displays the user's wallet balance with an option to hide/show the balance.
   - Buttons for sending money and viewing transaction history.
   - Displays a note for clarity and responsiveness.

3. **Transactions**:
   - Fetches transaction data from the sample API `https://jsonplaceholder.typicode.com/todos`.
   - Displays top three recent transactions in a formatted style.
   - Handles errors such as no internet connection with user-friendly messages.

4. **Send Money**:
   - Form for entering an amount to send.
   - Shows the available balance.
   - Displays a loading indicator during the money transfer.
   - Saves the transaction data locally and updates the API.

## Folder Structure
```
lib/
   screens/
      login_screen.dart         # Login screen implementation
      dashboard_screen.dart     # Dashboard showing wallet balance and actions
      send_money_screen.dart    # Form to send money
      transactions_screen.dart  # Transaction history page
   viewmodels/
      login_viewmodel.dart      # Login logic and authentication state management
      transaction_viewmodel.dart # Transaction logic and API integration
   services/
      api_service.dart          # Handles API calls (fetch transactions, send money)
   models/
      transaction.dart          # Transaction model for structured data handling
   utils/
      constants.dart            # Contains app constants (e.g., base API URL)
```

## Dependencies
The project uses the following dependencies:
- `provider`: State management.
- `shared_preferences`: Persistent local storage.
- `http`: Making API calls.
- `intl`: Formatting dates for display.

## How to Run
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```bash
   cd <project_folder>
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## API Integration
### Endpoints
- **Fetch Transactions**:
  URL: `https://jsonplaceholder.typicode.com/todos`
   - Fetches sample transaction data.
   - Example transaction structure:
     ```json
     {
       "amount": "₹200.00",
       "date": "Jan 20, 2025 10:30 AM"
     }
     ```

- **Send Money**:
  URL: `https://jsonplaceholder.typicode.com/todos`
   - Posts the transaction data.

### Error Handling
- Displays "No Internet Connection" message when network is unavailable.
- Handles API errors gracefully with retry options.

## UI Highlights
1. **Responsive Design**:
   - All screens adapt to various screen sizes dynamically.
   - Text sizes and spacing scale based on the device.

2. **Loading Indicators**:
   - Displays progress indicators for API calls, such as fetching transactions or sending money.

3. **User Feedback**:
   - Snackbar notifications for successful or failed actions.
   - Friendly messages for sample data notes and error explanations.

4. **Formatted Transactions**:
   - Dates formatted using `intl` (e.g., `MMM dd, yyyy hh:mm a`).
   - Mock transaction amounts based on API response IDs.

## Future Enhancements
1. Add registration functionality.
2. Implement "Forgot Password" feature.
3. Secure sensitive data using encryption.
4. Replace sample API with a real backend service.

## License
This project is licensed under the MIT License. See the LICENSE file for details.