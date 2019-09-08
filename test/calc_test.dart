
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_flutter/calc.dart';

void main() {

  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });

  test('Summation should be returned', () {
    final counter = Counter();

    int result = counter.add(2, 2);

    expect(result, 4);
  });

}