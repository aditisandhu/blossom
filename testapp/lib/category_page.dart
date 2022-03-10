import 'package:flutter/material.dart';
import 'package:testapp/learning_page.dart';
import 'category.dart';
import 'option.dart';
import 'question.dart';
import 'learning_page.dart';

class CategoryPage extends StatefulWidget {
  final Category category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late PageController controller;
  late Question question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.category.questions.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: LearningPage(
          category: widget.category,
          controller: controller,
          onChangedPage: (index) => nextQuestion(index: index),
          onClickedOption: selectOption,
        ),
      );

  void selectOption(Option option) {
    if (question.isLocked) {
      return;
    } else {
      setState(() {
        question.isLocked = true;
        question.selectedOption = option;
      });
    }
  }

  void nextQuestion({int? index}) {
    final nextPage = controller.page! + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = widget.category.questions[indexPage];
    });
  }
}