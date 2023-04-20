//
//  ContentView.swift
//  bottomsheet
//
//  Created by juny kallukalam on 4/20/23.
//
import SwiftUI

struct ContentView: View {
    @State private var isSheetShowing = false
    @State private var selectedTab = 0
    let names = ["Juny", "Joe", "Sam"]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                List {
                    ForEach(names, id: \.self) { name in
                        Button(action: {
                            isSheetShowing = true
                        }) {
                            HStack {
                                Text(name)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color.gray)
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle("List")
                .sheet(isPresented: $isSheetShowing, content: {
                    SheetContent(closeAction: { isSheetShowing = false })
                })
            }
            .tabItem {
                Image(systemName: "mic.fill")
                Text("Microphone")
            }
            .tag(0)
            
            NavigationView {
                Text("Keyboard")
            }
            .tabItem {
                Image(systemName: "keyboard")
                Text("Keyboard")
            }
            .tag(1)
            
            NavigationView {
                Text("Four Square")
            }
            .tabItem {
                Image(systemName: "rectangle.grid.1x2.fill")
                Text("Four Square")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SheetContent: View {
    let closeAction: () -> Void
    @State private var amountText = "100"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Sheet Heading")
                    .font(.system(size: 18, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    closeAction()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 18, weight: .bold))
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Sender")
                    .font(.headline)
                Text("555-5555-5555")
                
                Text("Amount")
                    .font(.headline)
                HStack {
                    Text("$")
                    TextField("", text: $amountText)
                        .keyboardType(.decimalPad)
                        .frame(width: 100)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .font(.system(size: 24))
                
                Text("Status")
                    .font(.headline)
                Text("Your payment was sent on March and is waiting to be received.")
                
                Text("From")
                    .font(.headline)
                Text("Checking...123")
                
                Text("Memo")
                    .font(.headline)
                Text("Happy Birthday")
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}
