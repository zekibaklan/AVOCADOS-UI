//
//  ContentView.swift
//  Avocados
//
//  Created by Zeki Baklan on 14.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    //    MARK: - PROPERTIES
    
    var headers : [Header] = headersData
    var facts : [Fact] = factsData
    var recipes : [Recipe] = recipesData
    
    
    var body: some View {
        
        
        
        ScrollView(.vertical,showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
                
                //    MARK: - HEADER
                
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                        
                    }
                }
                //    MARK: - DISHES
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                DishesView()
                    .frame(maxWidth: 640)
                
                //    MARK: - AVOCADO FACT
                
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(alignment: .top ,spacing: 16) {
                        ForEach(facts) { fact in
                            FactsView(fact: fact)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading,60)
                    .padding(.trailing,20)
                }
                
            //    MARK: - RECIPE CARDS
                
            Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                VStack(alignment: .center,spacing: 20) {
                    ForEach(recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                 
                
                //    MARK: - FOOTER
                VStack(alignment: .center, spacing: 20) {
                    
                    
                    
                    Text("All about Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    .padding(8)
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body,design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom,85)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)
        
    }
}
struct TitleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title,design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData,facts: factsData,recipes: recipesData)
    }
}
