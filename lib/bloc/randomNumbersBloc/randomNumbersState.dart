class RandomNumbersState {
  RandomNumbersState({this.numbers, this.max});
  factory RandomNumbersState.initial() => RandomNumbersState(numbers: List(), max: 100);
  final List<num> numbers;
  final num max;
}