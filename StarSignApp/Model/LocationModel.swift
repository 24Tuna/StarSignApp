//
//  LocationModel.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/07/01.
//
import MapKit

class LocationModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    let manager = CLLocationManager()
    @Published var location = CLLocation()
    
    override init() {
        super.init()

        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        
        //位置情報関連の設定
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.distanceFilter = 2
        self.manager.startUpdatingLocation()
    }
    
    //現在地取得
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        self.location = locations.last!
    }
}
