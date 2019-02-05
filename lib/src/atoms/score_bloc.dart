import 'package:rxdart/rxdart.dart';

class ScoreBloc {
  final _scoreSubject = BehaviorSubject<double>(seedValue: 0);
  final _highScoreSubject = BehaviorSubject<Map<int, double>>(seedValue: {});

  ScoreBloc(){
    Map<int, double> initialHighScores;

    for(int i=1; i <= 100; i++){
      initialHighScores.addAll({i : 0.0});
    }
  }

  //getters
  ValueObservable<double> get scoreStream => _scoreSubject.stream;
  ValueObservable<Map<int, double>> get highScoreStream => _highScoreSubject.stream;
  double Function(int) get highScore => (level) => _highScoreSubject.stream.value[level];
  //setters
  Function(double) get setScore => (newScore) => _scoreSubject.sink.add(newScore);
  Function(int, double) get setHighScore => (level, newHighScore) {
    Map<int, double> newHighScores = _highScoreSubject.stream.value;
    newHighScores.update(level, (oldScore) => newHighScore);
    _highScoreSubject.sink.add(newHighScores);
  };

  void dispose() { 
    _scoreSubject.close();
    _highScoreSubject.close();
  }
}