import 'package:flutter/cupertino.dart';
import 'package:zensleep_test/data/models/question_model.dart';
import 'package:zensleep_test/data/models/routine_model.dart';

import '../../utils/util_data.dart';

class MainProvider extends ChangeNotifier {
  int _currentQStep = 0;
  List<QuestionModel> allQuestions = UtilData.questionModels;
  List<RoutineModel> nightRoutineModels = UtilData.nightRoutineModels;
  List<RoutineModel> dayRoutineModels = UtilData.dayRoutineModels;

  QuestionModel _currentQModel = UtilData.questionModels[0];

  int get currentQStep => _currentQStep;
  QuestionModel get currentQModel => _currentQModel;

  void changeQStep(int index) {
    _currentQStep = index;
    _currentQModel = allQuestions[index];
    notifyListeners();
  }

  void changeQuestionOption(int index) {
    _currentQModel.selectOptionNum = index;
    notifyListeners();
  }

  void changeNightRoutineActiveState(int index) {
    nightRoutineModels[index].isActive = !nightRoutineModels[index].isActive;
    notifyListeners();
  }

  void changeDayRoutineActiveState(int index) {
    dayRoutineModels[index].isActive = !dayRoutineModels[index].isActive;
    notifyListeners();
  }
}
