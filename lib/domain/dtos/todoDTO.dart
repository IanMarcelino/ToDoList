class TodoDTO {
  int id;
  String title;
  String description;
  bool status;
  
  TodoDTO({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.status = false,
  });
}