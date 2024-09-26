//
//  ContentView.swift
//  HelloSwift
//
//  Created by Amadeo Terrière on 24/09/2024.
//

import SwiftUI

struct CheckboxItem {
    var name: String
    var isChecked: Bool
}

struct CheckboxView: View {
    @Binding var item: CheckboxItem
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Image(systemName: item.isChecked ? "checkmark.circle.fill": "circle")
                .foregroundColor(item.isChecked ? .green : .gray)
                .font(.system(size: 22))
                .onTapGesture {
                    item.isChecked.toggle()
                }
        }
        .padding()
    }
}

struct ContentView: View {
    
    @State private var items = [
        CheckboxItem(name: "Alberto", isChecked: false),
        CheckboxItem(name: "Ann", isChecked: false),
        CheckboxItem(name: "Amadeo", isChecked: false),
        CheckboxItem(name: "Francis", isChecked: false),
        CheckboxItem(name: "Ilse", isChecked: false),
        CheckboxItem(name: "Jonas", isChecked: false),
        CheckboxItem(name: "Reynder", isChecked: false)
    ]
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var dateToday = Date()
    
    
    // Return View
    var body: some View {
        
        // Title
        Text("Daily EB2ANG")
            .font(.largeTitle)
            .foregroundColor(Color.purple)
        
        // Date of today
        Text("\(dateToday, formatter: Self.dateFormat)")
            .font(.title3)
        
        
        // Members of meeting
        List {
            ForEach($items, id: \.name) {
                $item in
                CheckboxView(item:$item)
            }
        }

        // Logo
        Image(.cipalschaubroeck)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

#Preview {
    ContentView()
}
