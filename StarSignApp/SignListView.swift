//
//  SignListView.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import SwiftUI

struct SignListView: View {
    @ObservedObject var viewModel : ViewModel
    var body: some View {
        ZStack{
            Image("MilkyWay")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Rectangle()
                .foregroundColor(Color.white.opacity(0.2))
            if viewModel.isLoading{
                Text("読み込み中・・・")
                    .font(.headline)
                    .foregroundColor(.white)
                    .offset(x: 0, y:200)
            }else{
                    
                    ScrollView(showsIndicators: false){
                        Rectangle()
                            .frame(height: 80)
                            .opacity(0.0)
                        
                        ForEach(viewModel.cardViewInputs){input in
                            CardView(input: input)
                        }
                        
                        Rectangle()
                            .frame(height: 80)
                            .opacity(0.0)
                    }//ScrollView
                
            }//if let else
        }//ZStack
    }
}

//struct SignListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignListView()
//    }
//}
