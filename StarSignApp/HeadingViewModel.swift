//
//  LocationManager.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import MapKit

class HeadingViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    let manager = CLLocationManager()
    @Published var heading:CLLocationDirection = 0.0
    
    override init(){
        super.init()

        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        
        //電子コンパス設定
        self.manager.headingFilter      = kCLHeadingFilterNone
        self.manager.headingOrientation = .portrait
        self.manager.startUpdatingHeading()
        
    }
    
    //電子コンパス取得
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.heading = newHeading.trueHeading
    }
}
