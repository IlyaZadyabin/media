import 'package:flutter_test/flutter_test.dart';
import 'package:media/utils/date_utils.dart';

void main() {
  group('Test date utils', () {
    final date1 = DateTime(2021);
    final date2 = DateTime(2020, 2, 15);

    test('Test date short string', () {
      expect(date1.shortString(), 'Jan 01, 2021');
      expect(date2.shortString(), 'Feb 15, 2020');
    });

    test('Test date short week string', () {
      expect(date1.shortWeekString(), 'Fri');
      expect(date2.shortWeekString(), 'Sat');
    });

    test('Test date short month string', () {
      expect(date1.shortMonthString(), 'Jan');
      expect(date2.shortMonthString(), 'Feb');
    });
  });
}
