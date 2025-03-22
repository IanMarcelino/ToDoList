class TodoDTO {
  int id;
  String title;
  bool completed;
  
  TodoDTO({
    this.id = 0,
    this.title = '',
    this.completed = false,
  });

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
}
}