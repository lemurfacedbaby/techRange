//
//  ZoneQueue.swift
//  TechRange
//
//  Created by Bryan Cooper on 1/25/18.
//  Copyright © 2018 Bryan Cooper. All rights reserved.
//

import Foundation

class ZoneQueue: NSObject {
    

    var numberOfZones: Double = 6.0
    var zoneState: [Double: Bool] = [ 0.1 : false, 0.5: false, 1.0: false, 1.5: false, 2.0: false, 3.0: false]
    
    func closestZone() -> Double {
        var closestZone: Double = numberOfZones
        for (zone, activation) in zoneState {
            if activation && zone < closestZone {
                closestZone = zone
            }
        }
        return closestZone
    }
}
