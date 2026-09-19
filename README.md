# SavingsMini

A small SwiftUI savings-goal tracker — set a target amount, contribute toward it over time, and track progress until the deadline.

## Features
- Create savings goals with a target amount, deadline, and color tag
- Log contributions and see running progress per goal
- Local persistence (no backend) via `UserDefaults` + `Codable`
- Built with `@Observable` (Swift Observation framework), no third-party dependencies

## Tech Stack
- SwiftUI
- Swift Observation (`@Observable`)
- `UserDefaults` + `JSONEncoder`/`JSONDecoder` for persistence

## Project Structure
```
SavingsMini/
├── App/            # App entry point
├── Models/         # SavingsGoal, Transaction
├── Stores/         # SavingsStore — state + persistence
├── Views/
│   ├── Goals/      # List and detail screens
│   ├── AddGoal/    # Create-goal form
│   └── Components/ # Reusable views (goal card, etc.)
└── Extensions/     # Color(hex:), VND currency formatting
```

## Status
🚧 Work in progress — models and store are done, views (list, detail, add-goal form) are in progress.

## Requirements
- Xcode 16+
- iOS 17+

## Author
[Karsir](https://github.com/karsirdev)
