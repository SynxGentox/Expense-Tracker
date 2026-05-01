# Expense Tracker
An iOS expense tracking app built with SwiftUI, SwiftData, and a clean MVVM+Repository architecture.

---

## Features
- Add and track expenses with category, payment method, date, and notes
- Schedule future expense reminders via local notifications
- Daily reminder notification at a user-set time
- Currency converter powered by ExchangeRate API with live network state handling (loading, success, error, empty)
- Filter and sort expense history by category, amount, and date
- Interactive chart view with configurable time ranges
- Pull-to-refresh on all data views
- HIG-compliant UI throughout

---

## Tech Stack
| Layer | Technology |
|---|---|
| UI | SwiftUI |
| Persistence | SwiftData |
| Architecture | MVVM + Repository Pattern |
| Charts | Swift Charts |
| Notifications | UNUserNotificationCenter |
| Networking | URLSession + async/await |
| Currency API | ExchangeRate-API v6 |
| State Management | `@Observable`, `@AppStorage`, `@Environment` |

---

## Architecture
```
View → ViewModel → Repository Protocol → SwiftData / Network
```
- **Repository pattern** abstracts SwiftData behind a protocol, making the data layer swappable and testable
- **Protocol-driven networking** — `CurrencyRepository` protocol separates the API service from the ViewModel
- **`NotificationManager`** singleton owns all notification scheduling and cancellation logic
- **`ViewLoader`** acts as the composition root — wires the full dependency graph on launch

---

## Project Structure
```
Expense Tracker/
├── Models/          — SwiftData model, CategoryModel, CurrencyModel
├── ViewModels/      — ExpenseViewModel, CurrencyViewModel
├── Repositories/    — ExpensesRepository protocol, SwiftDataExpenseRepository
├── Views/
│   ├── Dashboard/   — DashBoardView, ChartView, cards
│   ├── History/     — HistoryView, RecentListView, TransNCatView
│   ├── AddExpense/  — AddExpenseView, CategoryView, DateMethodView, NotesView
│   ├── Currency/    — NetworkStateController, SuccessStateView, LoadingStateView, ErrorStateView
│   └── Settings/    — SettingsView, NotificationsToggleView
├── Managers/        — NotificationManager
└── ViewLoader.swift — Composition root
```

---

## Setup
1. Clone the repo
2. Add your API keys to `Secrets.swift` (not tracked in git):
```swift
struct ApiKey {
    static let exchangeRateApi = "YOUR_KEY_HERE"
}
```
3. Build and run on iOS 17+

---

## What I Learned Building This
- SwiftData persistence and `@Model` lifecycle
- Protocol-driven repository pattern for testable data layers
- `UNUserNotificationCenter` — permission flow, calendar triggers, identifier-based cancellation
- `async/await` networking with proper error propagation
- SwiftUI state management: `@Observable`, `@AppStorage`, `@Environment`, `@Binding`
- HIG principles applied to real screens — destructive action confirmations, empty states, navigation consistency

- ## Screenshots
<img src="Expense Tracker/Assets/dashboard.png" width="250"> 
<img src="Expense Tracker/Assets/history.png" width="250">
<img src="Expense Tracker/Assets/currency.png" width="250">
<img src="Expense Tracker/Assets/add_expense.png" width="250">
<img src="Expense Tracker/Assets/memory_graph.png" width="250">
<img src="Expense Tracker/Assets/cpu_graph.png" width="250">

## Performance
- Memory: ~50MB idle, peaks ~77MB during API calls
- CPU: 0% idle
