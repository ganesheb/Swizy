//
//  ResourcesView.swift
//  Swizy
//
//  Created by Ganesh Ekatata Buana on 27/07/22.
//

import SwiftUI

struct Resources: Identifiable {
    let id : Int
    let title : String
    let websiteSource : String
    let image : String
    let url : String
}

var ResourcesList = [
    Resources(id: 0,
              title: "Optionals",
              websiteSource: "developer.apple.com",
              image: "apple",
              url: "https://developer.apple.com/documentation/swift/optional"),
    Resources(id: 1,
              title: "What Is an Optional Value in Swift?",
              websiteSource: "stackoverflow.com",
              image: "stackoverflow",
              url:"https://stackoverflow.com/questions/24003642/what-is-an-optional-value-in-swift#:~:text=An%20optional%20value%20either%20contains,that%20the%20value%20is%20missing."),
    Resources(id: 2,
              title: "Introduction to Optionals in Swift",
              websiteSource: "medium.com",
              image: "medium",
              url:"https://medium.com/@ranleung/understanding-optionals-in-swift-540bfa0e44c7"),
    Resources(id: 3,
              title: "Swift Optionals",
              websiteSource: "tutorialspoint.com",
              image: "tutorialpoint",
              url:"https://www.tutorialspoint.com/swift/swift_optionals.htm"),
    Resources(id: 4,
              title: "Optional Types in Swift",
              websiteSource: "freecodecamp.com",
              image: "freecodecamp",
              url:"https://www.freecodecamp.org/news/optional-types-in-swift/"),
    Resources(id: 5,
              title: "What Is an Optional in Swift?",
              websiteSource: "cocoacasts.com",
              image: "ccoacast",
              url:"https://cocoacasts.com/what-is-an-optional-in-swift#:~:text=it%20doesn't.-,An%20optional%20acts%20as%20a%20container%20for%20a%20value%20of,before%20they%20can%20be%20accessed."),
  ]


struct ResourcesView: View {
    
    @State var alertIsShown = false
    @State var navigate = false
    
    var body: some View {
            VStack{
                ForEach(ResourcesList){
                    Resources in VStack{
                        Link(destination: URL(string: "\(Resources.url)")!) {
                        ZStack{
                            Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                            HStack{
                                ZStack{
                                    Rectangle().frame(width: 44, height: 44, alignment: .leading).foregroundColor(.white).cornerRadius(8)
                                    Image(Resources.image).resizable().frame(width: 34, height: 34, alignment: .center).foregroundColor(.blue)
                                }.padding(.leading)
                                VStack(alignment: .leading, spacing: 5){
                                    Text(Resources.title).font(.system(size: 14, weight: .medium, design: .rounded)).foregroundColor(.black)
                                    Text(Resources.websiteSource).font(.system(size: 12, weight: .regular, design: .rounded)).foregroundColor(.gray)
                                }.padding(.leading, 5)
                                Spacer()
                            }
                        }.frame(width: 322, height: 68, alignment: .center)
                        }.padding(.bottom, 10)
                    }
                }
                
                NavigationLink(destination: QuizView(), isActive: $navigate){
                    Button(action: {
                        alertIsShown = true
                    }){
                        ZStack{
                            Rectangle().foregroundColor(.blue).cornerRadius(30)
                            Text("Start Evaluation").font(.system(size: 17, weight: .medium, design: .rounded)).foregroundColor(.white)
                            }.padding(.top, 10).frame(width: 228, height: 48, alignment: .center)
                    }.alert(isPresented: $alertIsShown) {
                        Alert(title: Text("Start Evaluation"), message: Text("Do you want to start your evaluation for this topic now?"), primaryButton: .destructive(Text("Cancel")) , secondaryButton: .default(Text("Yes")){
                            navigate.toggle()
                            })
                    }
                }
                
            }
        .navigationTitle("Optionals Resources")
        .navigationBarTitleDisplayMode(.large)
    }
    
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
