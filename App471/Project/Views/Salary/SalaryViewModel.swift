//
//  SalaryViewModel.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI
import CoreData

final class SalaryViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @AppStorage("currentCurrency") var currentCurrency = ""

    @AppStorage("salary") var salary: String = ""
    @Published var editSalary = ""
    
    @Published var isAddPayments: Bool = false
    @Published var isEditSalary: Bool = false
    @Published var isDelete: Bool = false

    @Published var payCurrency = ""
    @Published var payAmount = ""

    @Published var payments: [PayModel] = []
    @Published var selectedPayment: PayModel?

    func addPayment() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PayModel", into: context) as! PayModel

        loan.payCurrency = payCurrency
        loan.payAmount = payAmount
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchPayments() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PayModel>(entityName: "PayModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.payments = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.payments = []
        }
    }
}
