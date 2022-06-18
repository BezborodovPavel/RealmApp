//
//  TaskList.swift
//  RealmApp
//
//  Created by Alexey Efimov on 08.10.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import RealmSwift

class TaskList: Object {
    @Persisted var name = ""
    @Persisted var date = Date()
    @Persisted var tasks = List<Task>()
    
    var statusList: String {
        let completedTasksCount = tasks.filter("isComplete == true").count
        if tasks.count == 0 {
            return "0" }
        else if tasks.count == completedTasksCount {
            return "✔️"
        }else {
            return String(tasks.count - completedTasksCount)
        }
    }
}

class Task: Object {
    @Persisted var name = ""
    @Persisted var note = ""
    @Persisted var date = Date()
    @Persisted var isComplete = false
}
