//
//  AvocadosView.swift
//  Avocados
//
//  Created by Zeki Baklan on 15.09.2023.
//

import SwiftUI

struct AvocadosView: View {
    
    //    MARK: - PROPERTIES
    
    @State private var pulsateAnimation : Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240,height: 240 ,alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12,x: 0,y: 8)
                .scaleEffect(pulsateAnimation ? 1 : 0.9)
                .opacity(pulsateAnimation ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            
            VStack {
                Text("Avocados".uppercased())
               
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .shadow(color: Color("ColorBlackTranparentDark"), radius: 4, x: 0, y: 4)
                .padding()
                Text("""
Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
                .lineLimit(nil)
                .font(.system(.headline,design: .serif))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640,minHeight: 120)
                
            }
            .padding()
            Spacer()
        }
        .background(
        Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
        
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            
            pulsateAnimation.toggle()
        }
    }
}

struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
            .environment(\.colorScheme, .dark)
    }
}
