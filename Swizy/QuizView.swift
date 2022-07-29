//
//  QuizView.swift
//  Swizy
//
//  Created by Ganesh Ekatata Buana on 28/07/22.
//

import SwiftUI

struct QuizData: Identifiable {
    let id : Int
    let question : String
    let answerA : String
    let answerB : String
    let answerC : String
    let answerD : String
    let answerKey : String
}

var QuizDataList = [
    QuizData(id: 0,
            question: "Which of these methods is NOT a way to unwrap optional values?",
            answerA: "Forced unwrapping",
            answerB: "Optional binding",
            answerC: "Optional chaining",
            answerD: "Optional relation",
            answerKey: "D"),
    QuizData(id: 1,
            question: "An optional variable in Swift is set to a valueless state by assigning which of the following special values?",
            answerA: "Null",
            answerB: "Nil",
            answerC: "Nul",
            answerD: "Nol",
            answerKey: "B"),
    QuizData(id: 2,
            question: "Which operator is used next to a variable type to declare the variable as optional?",
            answerA: "!",
            answerB: "~",
            answerC: "?",
            answerD: "&",
            answerKey: "C"),
    QuizData(id: 3,
            question: "Which operator is often used to forcely unwrap (as opposed to safely unwrap) optionals?",
            answerA: "!",
            answerB: "~",
            answerC: "?",
            answerD: "&",
            answerKey: "A"),
    QuizData(id: 4,
            question: "What does an optional variable mean in Swift?",
            answerA: "The var doesn't have to be used",
            answerB: "The var may/may not have a value",
            answerC: "The var may not be used",
            answerD: "The var can't change its value",
            answerKey: "B"),
    QuizData(id: 5,
            question: "Which unwrapping method uses the '??' operator to provide a default value?",
            answerA: "Optional binding",
            answerB: "Optional chaining",
            answerC: "If/else block",
            answerD: "Nil coalescing",
            answerKey: "D"),
    QuizData(id: 6,
            question: "Which unwrapping method may lead to the error 'Unexpectedly found nil while unwrapping an Optional value'?",
             answerA: "Forced unwrapping",
             answerB: "Optional binding",
             answerC: "Optional chaining",
             answerD: "Nil coalescing",
             answerKey: "A"),
    QuizData(id: 7,
            question: "Which unwrapping method works by assigning optional into constant and will ignore the code block if the optional has no value?",
             answerA: "Optional binding",
             answerB: "Optional chaining",
             answerC: "If/else block",
             answerD: "Nil coalescing",
             answerKey: "A"),
    QuizData(id: 8,
            question: "Which unwrapping method most suitable to use when unwrapping multiple optional values at once?",
             answerA: "Optional binding",
             answerB: "Optional chaining",
             answerC: "If/else block",
             answerD: "Nil coalescing",
             answerKey: "B"),
    QuizData(id: 9,
            question: "Which of these variables is most suitable to be defined as optional variable?",
             answerA: "Age",
             answerB: "First Name",
             answerC: "Middle Name",
             answerD: "Gender",
             answerKey: "C"),
  ]

struct QuizView: View {
    
    @State var questionIndex: Int = 0
    @State var score: Int = 0
    @State var navigate = false
    
    var body: some View {
        
        NavigationLink(destination: QuizResultsView(), isActive: $navigate) { EmptyView() }
        
        if(self.questionIndex < QuizDataList.count){
            
            VStack{
                
                VStack(alignment: .leading, spacing: 4){
                    Text("\(String(self.questionIndex + 1)) / 10").font(.system(size: 17, weight: .medium, design: .rounded)).padding(.bottom, 10)
                    ProgressView(value: Float(self.questionIndex) + 1, total: 10)
                }.padding(.bottom, 34).padding(.top, 10)
                
                ZStack {
                    Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                    Text(QuizDataList[self.questionIndex].question).font(.system(size: 20, weight: .medium, design: .rounded)).padding(.leading, 24).padding(.trailing, 24).frame(width: 263, height: 152, alignment: .center).multilineTextAlignment(.center)
                    
                }.frame(width: 322, height: 213, alignment: .center).padding(.bottom, 24)
                
                Button(action:{
                    buttonAction(x: "A")
                }){
                    ZStack {
                        Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                        Text("A. \(QuizDataList[self.questionIndex].answerA)").font(.system(size: 17, weight: .medium, design: .rounded)).frame(width: 284, height: 48, alignment: .leading).foregroundColor(.black)
                    }.frame(width: 322, height: 48, alignment: .center).padding(.bottom, 24)
                }
                
                Button(action:{
                    buttonAction(x: "B")
                }){
                    ZStack {
                        Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                        Text("B. \(QuizDataList[self.questionIndex].answerB)").font(.system(size: 17, weight: .medium, design: .rounded)).frame(width: 284, height: 48, alignment: .leading).foregroundColor(.black)
                    }.frame(width: 322, height: 48, alignment: .center).padding(.bottom, 24)
                }
                
                Button(action:{
                    buttonAction(x: "C")
                }){
                    ZStack {
                        Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                        Text("C. \(QuizDataList[self.questionIndex].answerC)").font(.system(size: 17, weight: .medium, design: .rounded)).frame(width: 284, height: 48, alignment: .leading).foregroundColor(.black)
                    }.frame(width: 322, height: 48, alignment: .center).padding(.bottom, 24)
                }
                
                Button(action:{
                    buttonAction(x: "D")
                }){
                    ZStack {
                        Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                        Text("D. \(QuizDataList[self.questionIndex].answerD)").font(.system(size: 17, weight: .medium, design: .rounded)).frame(width: 284, height: 48, alignment: .leading).foregroundColor(.black)
                    }.frame(width: 322, height: 48, alignment: .center).padding(.bottom, 24)
                }
                
                
            }.padding(.leading, 34).padding(.trailing, 34)
            .navigationTitle("Quiz: Optionals")
            .navigationBarTitleDisplayMode(.large)
            
            }
        
        }
    
    func buttonAction(x : String){
        if(QuizDataList[self.questionIndex].answerKey == x){
            self.score = self.score + 10
            UserDefaults.standard.set(self.score, forKey: "score")
            let savedScore = UserDefaults.standard.integer(forKey: "score")
            print (savedScore)
        }
        
        self.questionIndex = self.questionIndex + 1
        
        if(self.questionIndex == QuizDataList.count){
            self.navigate = true
        }
        }
    }
    

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
