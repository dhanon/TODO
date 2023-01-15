import Foundation

class Task: Codable{
    var title: String
    var done: Bool
    
    public init(title: String){
        self.title = title
        self.done = false
    }
}

extension Task{
    
    public static func saveTaskList(taskList: [Task]){
        let taskData = try! JSONEncoder().encode(taskList)
        UserDefaults.standard.set(taskData, forKey: "tasks")
    }
    
    public static func loadTaskList() -> [Task]?{
        let taskData = UserDefaults.standard.data(forKey: "tasks")
        var taskList = [Task]()
        if(taskData != nil){
            taskList = try! JSONDecoder().decode([Task].self, from: taskData!)
        }else{
//            //If no user defaults for "tasks" are found, load default values
//            var dummyList = [Task]()
//            let task1 = Task(title: "")
//            let task2 = Task(title: "")
//            let task3 = Task(title: "")
//            let task4 = Task(title: "")
//            let task5 = Task(title: "")
//            task1.done = true
//            dummyList.append(task1)
//            dummyList.append(task2)
//            dummyList.append(task3)
//            dummyList.append(task4)
//            dummyList.append(task5)
//            taskList = dummyList
        }
        return taskList
    }
    
}
