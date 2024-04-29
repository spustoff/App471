//
//  DashBoardViewModel.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI
import CoreData

final class DashBoardViewModel: ObservableObject {

    @AppStorage("tasksAcc") var tasksAcc: String = "0"
    @AppStorage("activeTasks") var activeTasks: String = "0"
    @AppStorage("totalEarned") var totalEarned: String = "0"
    
    @Published var ta = ""
    @Published var at = ""
    @Published var te = ""

    @AppStorage("taskPlanKrug") var taskPlanKrug: Double = 0
    @AppStorage("tasksAccKrug") var tasksAccKrug: Double = 0.001

    @Published var TPK = ""
    @Published var TAK = ""
    
    @Published var isAddBasicData: Bool = false
    @Published var isEditDiagram: Bool = false

}

