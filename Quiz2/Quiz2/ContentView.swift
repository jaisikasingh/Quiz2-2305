//
//  ContentView.swift
//  Quiz2
//
//  Created by Jaisika Singh on 2022-02-09.
//

import SwiftUI

struct  Person{
    var name: String = ""
    var age: Int = 0
    var favouriteMovie: String = ""
    
}

struct ContentView: View {
    
    @State var person: Person = Person()
    @State var name: String = ""
    @State var age: String = ""
    @State var favouriteMovie: String = ""
    
    @State var isSubmitted = false
    
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
                   VStack {
                       //title
                       Text("Student Info")
                           .padding()
                           .font(.headline)
                       //name
                        HStack {
                            Text("Name").frame(width: 100, alignment: .leading)
                            TextField("name ", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 200, height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal)
                        }
                       // age
                        HStack {
                            Text("Age").frame(width: 100, alignment: .leading)
                            TextField("age", text: $age)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 200, height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal)
                        }
                       //favourite movie
                       HStack {
                           Text("Favourite Movie").frame(width: 100, alignment: .leading)
                           TextField("favourite movie", text: $favouriteMovie)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .frame(width: 200, height: 40)
                               .clipShape(RoundedRectangle(cornerRadius: 10))
                               .padding(.horizontal)
                       }
                       
                       
                       //display text
                       if isSubmitted{
                           VStack(alignment: .leading){
                               Text("Name: " + person.name)
                                   .frame(width:200, alignment:.leading)
                               Text("Age:  \(person.age)")
                                   .frame(width:200, alignment:.leading)
                               Text("Favourite Movie: " + person.favouriteMovie)
                                   .frame(width:200, alignment:.leading)
                           }
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .padding()
                           .overlay(
                               RoundedRectangle(cornerRadius: 10)
                                   .stroke(Color.green, lineWidth: 1)
                           )
                           .padding()
                       }
                       Spacer()

                       // submit button
                        Button(action: {
                            guard !name.isEmpty, !age.isEmpty, !favouriteMovie.isEmpty else { return }
                            
                            let s_age:Int = Int(age) ?? 0
                              // add person
                            person = Person(name:name, age:s_age, favouriteMovie: favouriteMovie)
                            isSubmitted.toggle()
                        }, label: {
                            Text("Submit")
                                .frame(width: 80, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .background(.green)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                                         
                                     })
                                 }
                                 .padding()
        }
    }
}
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
