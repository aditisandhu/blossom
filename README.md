# Blossom
An Andriod and iOS app created using Flutter, Firebase and Google Cloud Platform to [goal].

## Features [summarize]

- Period Logger, include ss
- Maps, include ss
- Learning page, include ss

## Demo

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
5. Run the following commands to download all required dependancies.
```
flutter clean
flutter pub get
```
6. After successfully downloading all dependancies, you are ready to run the app. 
```
flutter run --no-sound-null-safety
```
It is preferred you run the app on an actual Andriod device or emulator since it was primarily tested on Andriod; however, iOS will also work.

## What's Next

- Update the period tracker to predict future cycles. To implement the prediction, we plan on using the k-nearest neighbours machine learning algorithm with the data provided by users. There a couple of options for doing so, such as the [simple_knn package]( https://pub.dev/packages/simple_knn) and/or the [ml_algo library](https://pub.dev/packages/ml_algo).
- Introduce a chatbot to answer specific questions and direct users to specific pages.
- Implement a point-reward system, wherein the more quizzes you complete correctly, the more points you accumulate. You can redeem points for coupons at partner pharmarcies/drug stores.
- Promote the app in schools and our local communities!
