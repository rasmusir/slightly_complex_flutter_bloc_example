abstract class RandomNumbersEvent {}

class NewRandomNumbersEvent extends RandomNumbersEvent {
  NewRandomNumbersEvent({this.count, this.max});
  final int count;
  final int max;
}

class MoreRandomNumbersEvent extends RandomNumbersEvent {
  MoreRandomNumbersEvent({this.count});
  final int count;
}