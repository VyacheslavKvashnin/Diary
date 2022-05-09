//
//  ContentView.swift
//  Diary
//
//  Created by Вячеслав Квашнин on 20.02.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        Home()
    }
}


