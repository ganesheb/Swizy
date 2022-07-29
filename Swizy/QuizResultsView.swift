//
//  QuizResultsView.swift
//  Swizy
//
//  Created by Ganesh Ekatata Buana on 28/07/22.
//

import SwiftUI

struct QuizResultsView: View {
   
    @State var navigateQuiz = false
    @State var navigateResource = false
    @State var navigateTopics = false
    @State var score: Int = UserDefaults.standard.integer(forKey: "score")
    
    var body: some View {

            if(self.score < 100){
                VStack {
                    ZStack {
                        
                        Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                        
                        VStack {
                            
                            Text("Your Score :").font(.system(size: 28, weight: .medium, design: .rounded)).padding(.leading, 24).padding(.trailing, 24).frame(width: 263, height: 28, alignment: .center).multilineTextAlignment(.center)
                            
                            Text("\(self.score) / 100").font(.system(size: 28, weight: .bold, design: .rounded)).padding(.leading, 24).padding(.trailing, 24).frame(width: 263, height: 28, alignment: .center).multilineTextAlignment(.center)
                            
                            ZStack{
                                LottieView(lottieFile: "fail2")
                                    .frame(width: 112, height: 112)
                            }
                            
                            Text("Sorry, you didn’t pass the evaluation for this topic.").font(.system(size: 20, weight: .medium, design: .rounded)).padding(.leading, 24).padding(.trailing, 24).frame(width: 280, height: 48, alignment: .center).multilineTextAlignment(.center).foregroundColor(.swizyRed)
                        }
                        
                    }.frame(width: 322, height: 311, alignment: .center).padding(.bottom, 10).padding(.top, 10)
                    
                    NavigationLink(destination: QuizView(), isActive: $navigateQuiz) {
                        Button(action: {
                            navigateQuiz.toggle()
                        }){
                            ZStack{
                                Rectangle().foregroundColor(.blue).cornerRadius(30)
                                Text("Retry").font(.system(size: 17, weight: .medium, design: .rounded)).foregroundColor(.white)
                                }.frame(width: 205, height: 48, alignment: .center)
                        }
                    }.padding(.top, 10)
                    
                    NavigationLink(destination: ResourcesView(), isActive: $navigateResource) {
                        Button(action: {
                            navigateResource.toggle()
                        }){
                            ZStack{
                                Rectangle().foregroundColor(.swizyGray).cornerRadius(30)
                                Text("Learn More").font(.system(size: 17, weight: .medium, design: .rounded)).foregroundColor(.black)
                                }.frame(width: 205, height: 48, alignment: .center)
                        }
                    }.padding(.top, 16)
                    
                    NavigationLink(destination: ContentView(), isActive: $navigateTopics) {
                        Button(action: {
                            navigateTopics.toggle()
                        }){
                            ZStack{
                                Text("Back to Topics").font(.system(size: 17, weight: .medium, design: .rounded)).foregroundColor(.black).underline()
                                }.frame(width: 205, height: 48, alignment: .center)
                        }
                    }.padding(.top, 8)
                    
                    Spacer()
                }.padding(.top, 54)
                
                .navigationTitle("Optionals")
                .navigationBarTitleDisplayMode(.large)
            }
        
            else{
                VStack {
                    ZStack {
                        
                        Rectangle().foregroundColor(.swizyGray).cornerRadius(20)
                        
                        VStack {
                            
                            Text("Your Score :").font(.system(size: 28, weight: .medium, design: .rounded)).padding(.leading, 24).padding(.trailing, 24).frame(width: 263, height: 28, alignment: .center).multilineTextAlignment(.center)
                            
                            Text("\(self.score) / 100").font(.system(size: 28, weight: .bold, design: .rounded)).padding(.leading, 24).padding(.trailing, 24).frame(width: 263, height: 28, alignment: .center).multilineTextAlignment(.center)
                            
                            ZStack{
                                LottieView(lottieFile: "success")
                                    .frame(width: 148, height: 148)
                            }
                            
                            Text("Hooray! You passed the evaluation for this topic!").font(.system(size: 20, weight: .medium, design: .rounded)).padding(.leading, 24).padding(.trailing, 24).frame(width: 280, height: 48, alignment: .center).multilineTextAlignment(.center).foregroundColor(.swizyGreen)
                        }
                        
                    }.frame(width: 322, height: 311, alignment: .center).padding(.bottom, 10).padding(.top, 10)
                    
                    NavigationLink(destination: ContentView(), isActive: $navigateTopics) {
                        Button(action: {
                            UserDefaults.standard.set(1, forKey: "optionals")
                            navigateTopics.toggle()
                        }){
                            ZStack{
                                Rectangle().foregroundColor(.blue).cornerRadius(30)
                                Text("Back to Topics").font(.system(size: 17, weight: .medium, design: .rounded)).foregroundColor(.white)
                                }.frame(width: 205, height: 48, alignment: .center)
                        }
                    }.padding(.top, 10)
                    
                    Spacer()
                    
                }.padding(.top, 54)
                
                .navigationTitle("Optionals")
                .navigationBarTitleDisplayMode(.large)
            }
            
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView()
    }
}
