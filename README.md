# Weather App 🌤️

## What is this App All About

Weather App is a beautifully designed iOS application built with modern SwiftUI that provides real-time weather information with an intuitive and visually stunning interface. The app combines accurate weather data with smooth animations and interactive elements to deliver an exceptional user experience. Simply allow location access or search for any city to get comprehensive weather forecasts and detailed meteorological information.

- **Real-Time Weather**: Get current weather conditions with accurate temperature, humidity, wind speed, and visibility data.
- **7-Day Forecast**: View detailed weekly forecasts with high/low temperatures and weather conditions.
- **Hourly Forecasts**: Switch between hourly and daily views to plan your day effectively.
- **Location Services**: Automatic weather updates based on your current GPS location.
- **Interactive UI**: Smooth bottom sheet interactions with drag gestures and multiple detent sizes.
- **Beautiful Design**: Dark-mode-first interface with custom animations and parallax effects.
- **Weather Details**: Comprehensive meteorological data including UV index, sunrise/sunset times, and wind direction.
- **Search Functionality**: Find weather information for any city worldwide.
- **Modern Architecture**: Built with MVVM pattern using SwiftUI and async/await for optimal performance.

## What I have learned

- **Advanced SwiftUI**: Mastered complex SwiftUI concepts including custom animations, parallax scrolling, and interactive bottom sheets with drag gestures.
- **Weather API Integration**: Successfully integrated with [WeatherAPI.com](https://www.weatherapi.com/) to fetch real-time weather data and 7-day forecasts using modern async/await patterns.
- **Core Location Framework**: Implemented GPS-based location services with proper permission handling and user-friendly location request flows.
- **MVVM Architecture**: Structured the app using Model-View-ViewModel pattern with proper separation of concerns between UI, business logic, and data models.
- **Custom UI Components**: Created reusable SwiftUI components including custom shapes (Trapezoid), weather widgets, and forecast cards.
- **State Management**: Managed complex app state using `@ObservableObject`, `@StateObject`, and `@Published` properties for reactive UI updates.
- **Third-Party Integration**: Successfully integrated BottomSheet library for enhanced user interactions and smooth animations.
- **JSON Decoding**: Decoded complex nested JSON responses from weather APIs into Swift `Codable` structs with proper error handling.
- **Custom Animations**: Implemented smooth transitions, parallax effects, and dynamic UI elements that respond to user interactions.
- **Asset Management**: Organized custom colors, images, and icons in Xcode's Asset Catalog with proper scaling for different device sizes.
- **Error Handling**: Implemented robust error handling for network failures, location services, and API responses with user-friendly feedback.

## Note

**API Key Configuration**: To use this weather app, you need to obtain a free API key from [WeatherAPI.com](https://www.weatherapi.com/) and replace the placeholder in the code.

**Where to edit the API key:**
- Navigate to `Weather App/Services/Service.swift`
- Find the line: `let apiKey = "YOUR_API_KEY_HERE"`
- Replace `"YOUR_API_KEY_HERE"` with your actual API key from WeatherAPI.com

**Steps to get your API key:**
1. Visit [WeatherAPI.com](https://www.weatherapi.com/)
2. Sign up for a free account
3. Go to your dashboard to get your API key
4. Copy the key and paste it in the Service.swift file

## Demo

*Demo video will be added here*
