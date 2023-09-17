//
//  SettingsView.swift
//  Avocados
//
//  Created by Zeki Baklan on 15.09.2023.
//

import SwiftUI

struct SettingsView: View {
    //    MARK: - PROPERTIES
    
    @State private var enableNotification : Bool = true
    @State private var backgroundReflesh : Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            //    MARK: - HEADER
            
            VStack(alignment: .center,spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100,height: 100,alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
                Text("Avocados".uppercased())
                    .font(.system(.title,design: .serif))
                    .fontWeight(.bold)
                .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()
            Form{
                
                //    MARK: - SECTION #1
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable Notification")
                    }
                    Toggle(isOn: $backgroundReflesh) {
                        Text("Background Reflesh")
                    }
                }
                //    MARK: - SECTION #2
                Section(header: Text("Application")) {
                    if enableNotification {
                        HStack {
                            Text("Protect")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack {
                            Text("Compatibility")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        HStack {
                            Text("Developer")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Zeki Baklan")
                        }
                        HStack {
                            Text("Website")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("zekibaklan.com")
                                .foregroundColor(.blue)
                        }
                        HStack {
                            Text("Version")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("1.0.0 ")
                        }

                    } else {
                        HStack {
                            Text("Personal Message")
                                .foregroundColor(.gray)
                            Spacer()
                                Text("👍🏼 Happy Coding")
                        }
                    }
                    
                }
                
            }
        }
        .frame(maxWidth: 640)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
