import 'package:fitness_app/common/const/color_const.dart';
import 'package:fitness_app/domain/exercise.dart';
import 'package:flutter/material.dart';

class ExercisesPage extends StatefulWidget {

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final exercises = <Exercise>[
    Exercise(name: 'Жим лежа', muscleGroup: 'грудь', type: 'Базовый'),
    Exercise(name: 'Становая тяга', muscleGroup: 'спина', type: 'Базовый'),
    Exercise(name: 'Жим ногами', muscleGroup: 'ноги', type: 'Базовый'),
    Exercise(name: 'Тяга Т грифа', muscleGroup: 'спина', type: 'Базовый'),
    Exercise(name: 'Приседания', muscleGroup: 'ноги', type: 'Базовый'),
    Exercise(name: 'Сгибания гантелей', muscleGroup: 'бицепс', type: 'Изолированный'),
    Exercise(name: 'Кроссовер', muscleGroup: 'грудь', type: 'Изолированный'),
  ];

  var filterTitle = '';
  var filterTitleController = TextEditingController();
  var filterMuscleGroup = 'Все группы';
  var filterExerciseType = 'Все упражнении';

  var filterText = '';
  var filterHeight = 0.0;

  List<Exercise> filter() {
    setState(() {
      filterText += '/' + filterMuscleGroup + '/' + filterExerciseType;
      if (filterTitle.isNotEmpty) filterText += '/' + filterTitle;
      filterHeight = 0;
    });

    var list = exercises;
    return list;
  }

  List<Exercise> clearFilter() {
    setState(() {
      filterText = 'Все группы/Все упражнении';
      filterTitle = '';
      filterExerciseType = 'Все упражнении';
      filterMuscleGroup = 'Все группы';
      filterTitleController.clear();
      filterHeight = 0;
    });

    var list = exercises;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var exercisesList = Expanded(
      child: ListView.builder(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(exercises[index].muscleGroup, style: const TextStyle(color: AppColor.textWhite, decoration: TextDecoration.underline)),
                Text(exercises[index].type, style: const TextStyle(color: AppColor.textWhite, decoration: TextDecoration.underline)),
              ],
            ),
          ),
        );
      },
    ),
    );
    
    var filterInfo = Container(
      margin: EdgeInsets.only(top: 3, left: 7, right: 7, bottom: 5),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
      height: 40,
      child: ElevatedButton(
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list),
            Text(
              filterText,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onPressed: () {
          setState(() {
            filterHeight = (filterHeight == 0.0 ? 280.0 : 0.0);
          });
        },
      ),
    );

    var exerciseTypeMenuItems = <String>[
      'Все упражнении',
      'Базовый',
      'Изолированный'
    ].map((String value1){
      return DropdownMenuItem<String>(
        value: value1,
        child: Text(value1),
      );
    }).toList();

    var muscleGroupMenuItems = <String>[
      'Все группы',
      'Спина',
      'Грудь',
      'Ноги',
      'Плечи',
      'Бицепс',
      'Трицепс',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    var filterForm = AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Группы мышц'),
                items: muscleGroupMenuItems,
                value: filterMuscleGroup,
                onChanged: (String? val) => setState(() => filterMuscleGroup = val!),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Виды упражнении'),
                items: exerciseTypeMenuItems,
                value: filterExerciseType,
                onChanged: (String? val) => setState(() => filterExerciseType = val!),
              ),
              TextFormField(
                controller: filterTitleController,
                decoration: const InputDecoration(labelText: 'Название'),
                onChanged: (String val) => setState(() => filterTitle = val),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        filter();
                      },
                      child:
                          Text("Применить", style: TextStyle(color: Colors.white)),
                      //color: AppColor.mainBackColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        clearFilter();
                      },
                      child:
                          Text("Очистить", style: TextStyle(color: Colors.white)),
                      //color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      height: filterHeight,
    );

    return Column(
      children: [
        filterInfo,
        filterForm,
        exercisesList,
      ],
    );
  }
}