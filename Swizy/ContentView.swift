//
//  ContentView.swift
//  Swizy
//
//  Created by Ganesh Ekatata Buana on 26/07/22.
//

import SwiftUI
import CoreData

struct Topics: Identifiable {
    let id : Int
    let name  : String
    let level  : String
    var isMastered : Bool
}

var topicList = [
    Topics(id: 0, name: "Variables and Constants", level: "BEGINNER", isMastered: false),
    Topics(id: 1, name: "Swift Functions", level: "BEGINNER", isMastered: false),
    Topics(id: 2, name: "Optionals", level: "BEGINNER", isMastered: false),
    Topics(id: 3, name: "Conditional Code and Logic", level: "BEGINNER", isMastered: false),
    Topics(id: 4, name: "Arrays, Dictionaries, and Sets", level: "BEGINNER", isMastered: false),
    Topics(id: 5, name: "Structs vs. Classes", level: "INTERMEDIATE", isMastered: false),
    Topics(id: 6, name: "Protocols", level: "INTERMEDIATE", isMastered: false),
    Topics(id: 7, name: "Object-Oriented Programming", level: "INTERMEDIATE", isMastered: false),
    Topics(id: 8, name: "Error Handling", level: "ADVANCED", isMastered: false),
    Topics(id: 9, name: "Opaque Types", level: "ADVANCED", isMastered: false),
  ]

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @State var searchQuery = ""
    @State var optionalsMastery: Int = UserDefaults.standard.integer(forKey: "optionals") ?? 0
    
//    NotificationCenter.default.post(name: Notification.Name("update"), object: self)
//    NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: NSNotification.Name("update"), object: nil)
    
    init(){
        if(optionalsMastery == 1){
            topicList[2].isMastered = true
        }
        else if(optionalsMastery == 0){
            topicList[2].isMastered = false
        }
    }
//    init() {
//            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//        UINavigationBar.appearance().backgroundColor = UIColor.systemGray6
//        }
    
    var body: some View {
        NavigationView {
                List(topicList) { Topics in
//                    Section{
                    if(Topics.name == "Optionals"){
                        NavigationLink(destination: ResourcesView()) {
                            HStack {
                                if(Topics.isMastered == false){
                                    Image(systemName: "checkmark").foregroundColor(.gray).imageScale(.medium).padding(8)
                                }
                                else if(Topics.isMastered == true){
                                    Image(systemName: "checkmark").foregroundColor(.blue).imageScale(.medium).padding(8)
                                }
                                VStack(
                                  alignment: .leading,
                                  spacing: 5
                                )
                                {
                                    Text(Topics.name).font(.system(size: 17, weight: .medium, design: .rounded))
                                    Text(Topics.level).font(.system(size: 14, weight: .light, design: .rounded)).foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .navigationTitle("Swift Topics")
                        }
                    }
                    
                    else{
                        NavigationLink(destination: ResourcesView()) {
                            HStack {
                                if(Topics.isMastered == false){
                                    Image(systemName: "checkmark").foregroundColor(.gray).imageScale(.medium).padding(8)
                                }
                                else if(Topics.isMastered == true){
                                    Image(systemName: "checkmark").foregroundColor(.blue).imageScale(.medium).padding(8)
                                }
                                VStack(
                                  alignment: .leading,
                                  spacing: 5
                                )
                                {
                                    Text(Topics.name).font(.system(size: 17, weight: .medium, design: .rounded))
                                    Text(Topics.level).font(.system(size: 14, weight: .light, design: .rounded)).foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .navigationTitle("Swift Topics")
                        }.disabled(true)
                    }
                    
                }.navigationBarItems(trailing:
                    Button(action:{
                    UserDefaults.standard.set(0, forKey: "optionals")}){
                    Image(systemName: "arrow.counterclockwise").foregroundColor(.blue).imageScale(.large)
                        }
                    )

//                    header: {
//                    Text("Select Desired Topics")
//                }
//            }
        }
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Topics")

    }
            
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewInterfaceOrientation(.portraitUpsideDown)
    }
}
