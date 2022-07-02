//
//  CardView.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/24.
//

import SwiftUI

struct CardView: View {
    
    struct Input:Identifiable{
        let id = UUID()
        let name : String
        let direction : String
        let altitude : String
        let starIcon:UIImage
    }
    
    let input : Input
    
    var body: some View {
        HStack{
            starImage
            VStack{
                signNameText
                positionText
            }//VStack
//            detailImage
        }//HStack
    }
    
    var starImage:some View{
        Image(uiImage: input.starIcon)
            .resizable()
            .frame(width: 80, height: 80)
            .aspectRatio(contentMode: .fit)
    }
    
    var signNameText:some View{
        Text(input.name)
            .foregroundColor(Color.white)
    }
    
    var positionText:some View{
        HStack{
            Text(input.direction)
                .foregroundColor(Color.white)
            Text(input.altitude)
                .foregroundColor(Color.white)
        }
    }
    
    var detailImage:some View{
        Image(systemName: "chevron.right.circle")
            .resizable()
            .frame(width: 40, height: 40)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.white)
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
