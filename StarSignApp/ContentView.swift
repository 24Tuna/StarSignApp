//
//  ContentView.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel(apiService: APIService())
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 100/255)
    }
    var body: some View {
        TabView{
            SignListView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 80, height: 50)
                        .padding()
                }
            CompassView()
                .tabItem {
                    Image(systemName: "safari")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                }
        }//TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
