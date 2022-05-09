# Blossom

Blossom is a one-stop app for young girls to gain access to accurate and reliable menstrual education and resources, available on Android and iOS. 

## Features

- User can either sign-in through google, create an account, or continue as an anonymous user
- Onboarding questions to personalize user experience
- Home page with daily quiz question, upcoming cycle details, and news stories related to reproductive cycle relief and recent findings 
- A period tracker, with a calendar to log period information
- A learning hub, with quizzes and resources
- A map page that allows users to find the nearest period product and health services, as well as alternatives

## Demo

Click [HERE](https://youtu.be/wKz6-HVQbGM) to check it out! 

## Usage
1. Ensure you have Flutter and Andriod Studio downloaded on your machine and are able to run Flutter projects locally.
2. Run the following command to ensure your system meets the requirements to run the app. All requirements must be met to run the app.
```
flutter doctor
```
3. Git clone the project into the directory of your choosing.
```
git clone https://github.com/aditisandhu/blossom.git
```
4. Change directory to "BlossomApp"
```
cd ./BlossomApp
```
5. Edit the secrets.dart file and add your Google and Newsapi.org API keys.
```
String NewsAPIKey = "NEWS API Key Here";
String GoogleAPIKey = "Google API Key Here";
```
6. Add your Google API key in the AndriodManifest.xml file in BlossomApp/andriod/app/src/main directory on line 65
```
<meta-data android:name="com.google.android.geo.API_KEY"
            android:value="GOOGLE API KEY HERE"/>
```
7. Add your Google API key in the AppDelegate.swift file in BlossomApp/ios/Runner directory on line 13
```
GMSServices.provideAPIKey("GOOGLE API KEY HERE")
```
8. Run the following commands to download all required dependancies.
```
flutter clean
flutter pub get
```
9. After successfully downloading all dependancies, you are ready to run the app. 
```
flutter run --no-sound-null-safety
```
It is preferred you run the app on an actual Andriod device or emulator since it was primarily tested on Andriod; however, iOS will also work.

## What's Next

- Update the period tracker to predict future cycles. To implement the prediction, we plan on using the k-nearest neighbours machine learning algorithm with the data provided by users. There a couple of options for doing so, such as the [simple_knn package]( https://pub.dev/packages/simple_knn) and/or the [ml_algo library](https://pub.dev/packages/ml_algo).
- Introduce a chatbot to answer specific questions and direct users to specific pages.
- Implement a point-reward system, wherein the more quizzes you complete correctly, the more points you accumulate. You can redeem points for coupons at partner pharmarcies/drug stores.
- Promote the app in schools and our local communities!
