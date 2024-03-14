//
//  SettingsView.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var darkMode: Bool = UserDefaults.standard.bool(forKey: "darkMode")
    @State private var showAlert = false
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle(isOn: $darkMode) {
                        Text("Dark Mode")
                    }
                    .onChange(of: darkMode) { value in
                        UserDefaults.standard.set(darkMode, forKey: "darkMode")
                        showAlert = true
                    }
                }
                Section {
                    Button(action: {
                        self.showSheet = true
                    }, label: {
                        Label("About", systemImage: "questionmark.circle")
                    })
                    Label("[Developer Website](https://jayagra.com)", systemImage: "safari")
                    Label("[Source Code](https://github.com/JayAgra/clicky)", systemImage: "curlybraces")
                }
            }
            .navigationTitle("settings")
            .alert(isPresented: $showAlert, content: {
                Alert (
                    title: Text("theme changed"),
                    message: Text("an app restart is required for the theme change to take effect"),
                    dismissButton: .default(Text("ok"))
                )
            })
            .sheet(isPresented: $showSheet) {
                NavigationView {
                    VStack {
                        Text("useless machine simulator is a fidget type game in which the object is to enable all switches. When a switch is pressed, a random number of other switches are set to a random value. The fewer switches toggled, the better your score is (lower = better).")
                            .padding()
                        Spacer()
                    }
                    .padding()
                    .navigationTitle("about useless machine simulator")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
