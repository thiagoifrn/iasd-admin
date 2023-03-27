class RecentFile {
  final String? icon, title, date, size;

  RecentFile({this.icon, this.title, this.date, this.size});
}

List demoRecentFiles = [
  
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Document",
    date: "23-02-2021",
    size: "32.5mb",
  ),
  RecentFile(
    icon: "assets/icons/pdf_file.svg",
    title: "Sales PDF",
    date: "25-02-2021",
    size: "3.5mb",
  )
];
