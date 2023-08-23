# Mobile Weather App

<p>Mobile Weather Application created using flutter and integrated with <a href="https://openweathermap.org/api/">openweathermap</a> API</p>

## Features

- Automatically acquire user current location
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
3. Install all packages by typing
   ```sh
   flutter pub get
   ```
4. Open the project and navigate to **lib/models/constants.dart** and paste your API key to apiKey variable
   ```dart
   final String apiKey apiKey = "";
   ```
5. Run the App on emulator or physical phone 

# Preview

<p align="center">
<img src="/assets/screenshots/homepage.png" height="480px"/> <img src="/assets/screenshots/editmode.png" height="480px" /> <img src="/assets/screenshots/detailedweather.png" height="480px" />
</p>
