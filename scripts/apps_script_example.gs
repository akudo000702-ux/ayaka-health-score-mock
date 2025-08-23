function fetchAndWrite() {
  const url = "https://jsonplaceholder.typicode.com/todos/1"; // デモAPI
  const res = UrlFetchApp.fetch(url, {muteHttpExceptions: true});
  const data = JSON.parse(res.getContentText());
  const sheet = SpreadsheetApp.getActiveSheet();
  sheet.getRange(1,1).setValue("title");
  sheet.getRange(1,2).setValue("completed");
  sheet.getRange(2,1).setValue(data.title);
  sheet.getRange(2,2).setValue(data.completed);
}
