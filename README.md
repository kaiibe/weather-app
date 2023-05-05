# Flutter Weather App

<p>A simple weather App created using Flutter and Dart and using weather API</p>

## Features
- Automatically acquire user current location
- Permission for geolocation 
- Add locations to your list
- Hourly weather information
- 7 days weather information 

## How to Run
1. Get your API key from <a href="https://openweathermap.org/api/">openweathermap.com</a>.
2. Clone the repo
   ```sh
   https://github.com/kaiibe/weather-app.git
   ```
   or 
   ```sh
   git@github.com:kaiibe/weather-app.git
   ```
   
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to **lib/models/constants.dart** and paste your API key to the apiKey variable
   ```dart
   final String apiKey apiKey = "";
   ```
6. Run the App


# Preview
<p align="center">
<img src="/assets/screenshots/homepage.png" height="480px"/> <img src="/assets/screenshots/editmode.png" height="480px" /> <img src="/assets/screenshots/detailedweather.png" height="480px" />
</p>

