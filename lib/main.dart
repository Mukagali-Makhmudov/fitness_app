import 'package:fitness_app/common/const/color_const.dart';
import 'package:fitness_app/domain/exercise.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FitnessApp());

class FitnessApp extends StatelessWidget {
  const FitnessApp({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'gain',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackColor,
      appBar: AppBar(
        backgroundColor: AppColor.mainBackColor,
        title: const Text('gain'),
        leading: const Icon(
          Icons.fitness_center,
        ), 
      ),
      body: ExercisesList(),
    );
  }
}

class ExercisesList extends StatelessWidget {

  final exercises = <Exercise>[
    Exercise(name: 'Жим лежа', muscleGroup: 'грудь', type: 'Базовый'),
    Exercise(name: 'Становая тяга', muscleGroup: 'спина', type: 'Базовый'),
    Exercise(name: 'Жим ногами', muscleGroup: 'ноги', type: 'Базовый'),
    Exercise(name: 'Тяга Т грифа', muscleGroup: 'спина', type: 'Базовый'),
    Exercise(name: 'Приседания', muscleGroup: 'ноги', type: 'Базовый'),
    Exercise(name: 'Сгибания гантелей', muscleGroup: 'бицепс', type: 'Изолированный'),
    Exercise(name: 'Кроссовер', muscleGroup: 'грудь', type: 'Изолированный'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (context, index){
        return Card(
          color: AppColor.cardColor,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 10),
            title: Text(exercises[index].name, style: const TextStyle(color: AppColor.textWhite),),
            subtitle: Row(
              children: [
                Text(exercises[index].muscleGroup, style: const TextStyle(color: AppColor.textWhite, decoration: TextDecoration.underline)),
                Text(exercises[index].type, style: const TextStyle(color: AppColor.textWhite, decoration: TextDecoration.underline)),
              ],
            ),
          ),
        );
      },
    );
  }
}