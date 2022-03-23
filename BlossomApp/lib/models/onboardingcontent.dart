import 'package:flutter/material.dart';

class OnboardingContent {
  String question;
  Container widget;

  OnboardingContent({
    required this.question, required this.widget
  });
}

class Utils {
  static List<OnboardingContent> getOnboarding() {
  return [
    OnboardingContent(question: "How old are you?", widget: Container(child: Text('Fuck this app'),)),

    OnboardingContent(question: "Have you started your period?", widget: Container(child: Text('Fuck this app'),)),

    OnboardingContent(question: "What would you like to learn more about?", widget: Container(child: Text('Fuck this app'),)),

  ];
  }
}