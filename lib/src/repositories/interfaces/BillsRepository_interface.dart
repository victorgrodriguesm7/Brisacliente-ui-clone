abstract class IBillsRepository {
  Future<List<Map<String, dynamic>>> getCalendarBills();
}
