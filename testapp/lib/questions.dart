import 'option.dart';
import 'question.dart';

final questions = [
  Question(
    text:
        'Why does blood come out during the period?',
    options: [
      Option(code: 'A', text: 'When a fertilized egg does not attach itself to the uterus lining, the lining breaks down and bleeds.', isCorrect: true),
      Option(code: 'B', text: 'There is a build-up of testosterone in the uterus.', isCorrect: false),
      Option(code: 'C', text: "When a fertilized egg does attach itself to the uterus lining, the lining breaks down and bleeds.", isCorrect: false),
      Option(code: 'D', text: "Hormones in the body stay the same", isCorrect: false),
    ],
    solution: 'See the following link for more information: https://kidshealth.org/en/teens/menstruation.html#:~:text=The%20ovaries%20release%20the%20female,lining%20breaks%20down%20and%20bleeds',
  ),
  Question(
    text: 'An individual can get pregnant while on their period',
    options: [
      Option(code: 'A', text: 'Yes, an individual is actually more likely to get pregnant while on their period.', isCorrect: false),
      Option(code: 'B', text: 'No, an individual cannot get pregant on their period.', isCorrect: false),
      Option(code: 'C', text: 'Yes, because sperm can live inside an indivual for up to 72 hours after ejaculation.', isCorrect: true),
      Option(code: 'D', text: 'No, because sperm cannot live inside an individual after ejaculation.', isCorrect: false),
    ],
    solution: 'See the following link for more information: https://kidshealth.org/en/teens/sex-during-period.html',
  ),
  Question(
    text: ' What foods are good to eat during the period',
    options: [
      Option(code: 'A', text: 'Spicy foods', isCorrect: false),
      Option(code: 'B', text: 'Red meat', isCorrect: false),
      Option(code: 'C', text: 'Fruits and leafy-green vegetables', isCorrect: true),
      Option(code: 'D', text: 'Coffee', isCorrect: false,
      ),
    ],
    solution: 'See the following link for more informaton: https://www.healthline.com/health/womens-health/what-to-eat-during-period',
  ),
  Question(
    text: 'What are blood clots and why do they occur?',
    options: [
      Option(code: 'A', text: 'Blood clots are large eggs. They occur when the body is unable to thin the material coming out of the uterus slow enough.', isCorrect: false),
      Option(code: 'B', text: 'Blood clots are small eggs. They occur when the body is unable to thin the material coming out of the uterus fast enough.', isCorrect: false),
      Option(code: 'C', text: 'Blood clots are large blobs tissue and blood. They occur when the body is unable to thin the material coming out of the uterus slow enough.', isCorrect: false),
      Option(code: 'D', text: 'Blood clots are small blobs tissue and blood. They occur when the body is unable to thin the material coming out of the uterus fast enough.', isCorrect: true),
    ],
    solution: 'See the following link for more information: https://www.healthline.com/health/womens-health/menstrual-clots',
  ),
];