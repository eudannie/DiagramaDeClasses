abstract class Task {
  int id;
  String name;
  DateTime date;

  Task(this.id, this.name, this.date);
}

enum Priority {
  Alta,
  Media,
  Baixa,
}

class TaskPriority extends Task {
  Priority priority;

  TaskPriority(int id, String name, DateTime date, this.priority) : super(id, name, date);
}

class TaskDTO {
  int id;
  String name;
  Priority pr;
  DateTime data;

  TaskDTO(this.id, this.name, this.pr, this.data);
}

abstract class TaskRepository {
  Task add(TaskDTO taskDTO);
  Task remove(int id);
  Task update(int id);
  Task findById(int id);
  List<Task> findByName(String name);
  List<Task> getAllTasks();
  List<Task> getTaskByPriority();
}

class TaskRepositoryFromList implements TaskRepository {
  List<Task> tasks = [];

  @override
  Task add(TaskDTO taskDTO) {
    Task task = TaskPriority(
      taskDTO.id,
      taskDTO.name,
      taskDTO.data,
      taskDTO.pr,
    );
    tasks.add(task);
    return task;
  }

  @override
  Task remove(int id) {
    tasks.removeWhere((task) => task.id == id);
    return TaskPriority(0, "", DateTime.now(), Priority.Alta);
  }

  @override
  Task update(int id) {
    return TaskPriority(0, "", DateTime.now(), Priority.Alta);
  }

  @override
  Task findById(int id) {
    return tasks.firstWhere((task) => task.id == id);
  }

  @override
  List<Task> findByName(String name) {
    return tasks.where((task) => task.name == name).toList();
  }

  @override
  List<Task> getAllTasks() {
    return tasks;
  }

  @override
  List<Task> getTaskByPriority() {
    return [];
  }
}

class TaskRepositoryFromCSV implements TaskRepository {
  List<Task> tasks = [];

  @override
  Task add(TaskDTO taskDTO) {
    return TaskPriority(0, "", DateTime.now(), Priority.Alta);
  }

  @override
  Task remove(int id) {
    return TaskPriority(0, "", DateTime.now(), Priority.Alta);
  }

  @override
  Task update(int id) {
    return TaskPriority(0, "", DateTime.now(), Priority.Alta);
  }

  @override
  Task findById(int id) {
    return TaskPriority(0, "", DateTime.now(), Priority.Alta);
  }

  @override
  List<Task> findByName(String name) {
    return [];
  }

  @override
  List<Task> getAllTasks() {
    return [];
  }

  @override
  List<Task> getTaskByPriority() {
    return [];
  }
}

void main() {
  TaskRepository repository = TaskRepositoryFromList();

  TaskDTO taskDTO = TaskDTO(1, "Comprar pão", Priority.Alta, DateTime.now());
  repository.add(taskDTO);

  List<Task> allTasks = repository.getAllTasks();
  print(allTasks.map((task) => task.name));
}