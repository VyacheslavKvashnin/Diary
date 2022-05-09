//
//  HomeViewModel.swift
//  Diary
//
//  Created by Вячеслав Квашнин on 20.02.2021.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    
    
    @Published var isNewData = false
    // Storing Update item...
    @Published var updateItem: Task!
    
    let calender = Calendar.current
    
    func checkDate() -> String {
        
        if calender.isDateInToday(date) {
            
            return "Today"
        }
        else if calender.isDateInTomorrow(date) {
            return "Tomorrow"
        }
        else {
            return "Other day"
        }
    }
    
    func updateDate(value: String) {
        if value == "Today" {date = Date()}
        else if value == "Tomorrow" {
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }
        else {
            
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        
        // Updating item...
        if updateItem != nil {
            // Means update old data...
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            
            // removing updatingItem if successfull
            
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
       
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
         //saving data
        do {
            try context.save()
            isNewData.toggle()
            content = ""
            date = Date()
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    func editItem(item: Task) {
        
        updateItem = item
        // togging the newDateView
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
