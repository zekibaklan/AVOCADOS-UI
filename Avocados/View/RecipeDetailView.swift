//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by Zeki Baklan on 17.09.2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    //    MARK: - PROPERTIES
    
    var recipe : Recipe
    @State private var pulsate : Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            
            
            VStack(alignment: .center,spacing: 0) {
                Image(recipe.image)
                    .resizable()
                .scaledToFit()
                
                Group {
                    // TITLE
                    
                    Text(recipe.title)
                        .font(.system(.largeTitle,design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top,10)
                    // RATINGS
                    RecipeRatingView(recipe: recipe)
                
                    // COOKING
                    RecipeCookingView(recipe: recipe)
                    // INGREDIENTS
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients,id: \.self) {
                            item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                    Divider()
                            }
                        }
                    }
                    // INSTRUCTIONS
                    Text("Instructions")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    ForEach(recipe.instructions,id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42,height: 42,alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body,design: .serif))
                                
                        }
                    }
                
                        
                }
                .padding(.horizontal,24)
                .padding(.vertical,12)
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                   
                    Button(action: {
                        // ACTION
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.8)
                            .scaleEffect(pulsate ? 1.2 : 0.8,anchor: .center)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true))
                        
                })
                    .padding(.trailing,20)
                    .padding(.top,24)
                    Spacer()
                }
            }
        
        )
        .onAppear() {
            pulsate.toggle()
        }
        
        
        
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    }
}
