import 'dart:convert' show json;

class TaskResponse {
  static const TITLE = 1;
  static const RANK = 2;
  static const TASK = 3;
  int currentRange;
  List<TaskGroupBean> taskGroups;

  TaskResponse.fromParams({this.currentRange, this.taskGroups});

  factory TaskResponse(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new TaskResponse.fromJson(json.decode(jsonStr))
          : new TaskResponse.fromJson(jsonStr);

  TaskResponse.fromJson(jsonRes) {
    currentRange = jsonRes['currentRange'];
    taskGroups = jsonRes['taskGroups'] == null ? null : [];

    for (var taskGroupsItem
        in taskGroups == null ? [] : jsonRes['taskGroups']) {
      taskGroups.add(taskGroupsItem == null
          ? null
          : new TaskGroupBean.fromJson(taskGroupsItem));
    }
  }

  @override
  String toString() {
    return '{"currentRange": $currentRange,"taskGroups": $taskGroups}';
  }

  List<TaskBean> generateTaskList() {
    List list = List<TaskBean>();
    for (var index = 0; index < taskGroups.length; index++) {
      final group = taskGroups[index];
      TaskBean taskBean = TaskBean();
      taskBean.type = TITLE;
      taskBean.taskName = group.taskGroupName;
      list.add(taskBean);
      if (index == 0 && currentRange > 0) {
        TaskBean taskRankBean = TaskBean();
        taskRankBean.type = RANK;
        taskRankBean.taskName = "当前周排名$currentRange";
        list.add(taskRankBean);
      }
      for (var taskIndex = 0; taskIndex < group.tasks.length; taskIndex++) {
        final task = group.tasks[taskIndex];
        task.type = TASK;
        list.add(task);
      }
    }
    return list;
  }
}

class TaskGroupBean {
  String taskGroupName;
  List<TaskBean> tasks;

  TaskGroupBean.fromParams({this.taskGroupName, this.tasks});

  TaskGroupBean.fromJson(jsonRes) {
    taskGroupName = jsonRes['taskGroupName'];
    tasks = jsonRes['tasks'] == null ? null : [];

    for (var tasksItem in tasks == null ? [] : jsonRes['tasks']) {
      tasks.add(tasksItem == null ? null : new TaskBean.fromJson(tasksItem));
    }
  }

  @override
  String toString() {
    return '{"taskGroupName": ${taskGroupName != null ? '${json.encode(taskGroupName)}' : 'null'},"tasks": $tasks}';
  }
}

class TaskBean {
  TaskBean();

  int taskScore;
  String taskDesc;
  String taskIcon;
  String taskName;
  String taskType;
  int type;
  TaskStatus taskStatus;

  TaskBean.fromParams(
      {this.taskScore,
      this.taskDesc,
      this.taskIcon,
      this.taskName,
      this.taskType,
      this.taskStatus});

  TaskBean.fromJson(jsonRes) {
    taskScore = jsonRes['taskScore'];
    taskDesc = jsonRes['taskDesc'];
    taskIcon = jsonRes['taskIcon'];
    taskName = jsonRes['taskName'];
    taskType = jsonRes['taskType'];
    taskStatus = jsonRes['taskStatus'] == null
        ? null
        : new TaskStatus.fromJson(jsonRes['taskStatus']);
  }

  @override
  String toString() {
    return '{"taskScore": $taskScore,"taskDesc": ${taskDesc != null ? '${json.encode(taskDesc)}' : 'null'},"taskIcon": ${taskIcon != null ? '${json.encode(taskIcon)}' : 'null'},"taskName": ${taskName != null ? '${json.encode(taskName)}' : 'null'},"taskType": ${taskType != null ? '${json.encode(taskType)}' : 'null'},"taskStatus": $taskStatus}';
  }
}

class TaskStatus {
  int currentScore;
  int totalScore;
  String message;

  TaskStatus.fromParams({this.currentScore, this.totalScore, this.message});

  TaskStatus.fromJson(jsonRes) {
    currentScore = jsonRes['currentScore'];
    totalScore = jsonRes['totalScore'];
    message = jsonRes['message'];
  }

  @override
  String toString() {
    return '{"currentScore": $currentScore,"totalScore": $totalScore,"message": ${message != null ? '${json.encode(message)}' : 'null'}}';
  }
}
