//
//  CompassView.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var manager = HeadingViewModel()
    var body: some View {
        let heading   = $manager.heading.wrappedValue
        
        Image("CompassImage")
            .resizable()
            .frame(width: 250, height: 250)
            .aspectRatio(contentMode: .fit)
            .rotationEffect(Angle(degrees: -heading))
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
