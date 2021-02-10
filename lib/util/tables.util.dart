
class TablesUtil {
  static const String TEXT = 'TEXT';
  static const String INTEGER = 'INTEGER';
  static const String REAL = 'REAL';

  static String createTable(String table, Map<String, String> columns) {
    String tableColumns = '';
    columns.forEach((String column, String type) => tableColumns += '$column $type,');
    tableColumns = tableColumns.substring(0, tableColumns.length-1);
    return 'CREATE TABLE $table ($tableColumns);';
  }

}