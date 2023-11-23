//
//  Locator.swift
//  App
//
//  Created by Phycom Mac Pro on 22/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import CoreLocation


class Locator: NSObject, CLLocationManagerDelegate {
    
    enum Result{
        case Success(Locator)
        case Failure(Error)
    }
    
    static let shared: Locator = Locator()
    
    typealias Callback = (Result) -> Void
    
    var requests: Array <Callback> = Array <Callback>()
    
    var location: CLLocation? { return sharedLocationManager.location  }
    
    lazy var sharedLocationManager: CLLocationManager = {
        let newLocationmanager = CLLocationManager()
        newLocationmanager.delegate = self
        // ...
        return newLocationmanager
    }()
    
    // MARK: - Authorization
    
    class func authorize() { shared.authorize() }
    func authorize() { sharedLocationManager.requestWhenInUseAuthorization() }
    
    // MARK: - Helpers
    
    func locate(callback: @escaping Callback) {
        self.requests.append(callback)
        sharedLocationManager.startUpdatingLocation()
    }
    
    func reset() {
        self.requests = Array <Callback>()
        sharedLocationManager.stopUpdatingLocation()
    }
    
    // MARK: - Delegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        for request in self.requests { request(.Failure(error)) }
        self.reset()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for request in self.requests { request(.Success(self)) }
        self.reset()
    }
}

