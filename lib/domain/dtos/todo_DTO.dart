class TodoDTO {
  int id;
  String title;
  bool status;

  
  TodoDTO({
    this.id = 0,
    this.title = '',
    this.status = false,
  });

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
}
}