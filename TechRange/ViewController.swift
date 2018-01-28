//
//  ViewController.swift
//  TechRange
//
//  Created by Bryan Cooper on 1/24/18.
//  Copyright © 2018 Bryan Cooper. All rights reserved.
//

import UIKit
import EstimoteProximitySDK

class ViewController: UIViewController {

    let beaconIdentifiers = ["cbf30d6f18e2a50db958c838ff58cc18"]
    var proximityObserver: EPXProximityObserver!
    var zoneQueue: ZoneQueue!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.zoneQueue = ZoneQueue()
        let credentials = EPXCloudCredentials(appID: "techrange-gao", appToken: "56915cc13a07ed021ff565408ea247d9")
        self.proximityObserver = EPXProximityObserver(credentials: credentials, errorBlock: { error in
            print("Oops! \(error)")
        })
        getRangedZones()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRangedZones() {
        
        let pointOneZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 0.1)!,
                                             attachmentKey: "desk",
                                             attachmentValue: "mint")
        pointOneZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[0.1] = true
            self.setLabel()
        }
        
        pointOneZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[0.1] = false
            self.setLabel()
        }
        
        let pointFiveZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 0.5)!,
                                            attachmentKey: "desk",
                                            attachmentValue: "mint")
        
        pointFiveZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[0.5] = true
            self.setLabel()
        }
        
        pointFiveZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[0.5] = false
            self.setLabel()
        }
        
        let oneZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 1.0)!,
                                             attachmentKey: "desk",
                                             attachmentValue: "mint")
        oneZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[1.0] = true
            self.setLabel()
        }
        
        oneZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[1.0] = false
            self.setLabel()
        }
        
        let onePointFiveZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 1.5)!,
                                             attachmentKey: "desk",
                                             attachmentValue: "mint")
        onePointFiveZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[1.5] = true
            self.setLabel()
        }
        
        onePointFiveZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[1.5] = false
            self.setLabel()
        }
        
        let twoZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 2.0)!,
                                                attachmentKey: "desk",
                                                attachmentValue: "mint")
        twoZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[2.0] = true
            self.setLabel()
        }
        
        twoZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[2.0] = false
            self.setLabel()
        }
        
        let threeZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 3.0)!,
                                                attachmentKey: "desk",
                                                attachmentValue: "mint")
        threeZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[3.0] = true
            self.setLabel()
        }
        
        threeZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[3.0] = false
            self.setLabel()
        }
        
        let fourZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 4.0)!,
                                         attachmentKey: "desk",
                                         attachmentValue: "mint")
        fourZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[4.0] = true
            self.setLabel()
        }
        
        fourZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[4.0] = false
            self.setLabel()
        }

        let fiveZone = EPXProximityZone(range: EPXProximityRange.custom(desiredMeanTriggerDistance: 5.0)!,
                                                attachmentKey: "desk",
                                                attachmentValue: "mint")
        fiveZone.onEnterAction = { attachment in
            self.zoneQueue.zoneState[5.0] = true
            self.setLabel()
        }
        
        fiveZone.onExitAction = { attachment in
            self.zoneQueue.zoneState[5.0] = false
            self.setLabel()
        }
        
        self.proximityObserver.startObserving([pointOneZone, pointFiveZone, oneZone, onePointFiveZone, twoZone, threeZone, fourZone, fiveZone])
        
    }
    
    func setLabel() {
        let zone = zoneQueue.closestZone()
        if zone == -1 {
            distanceLabel.text = "Out of Range"
        } else {
            distanceLabel.text = "\(zoneQueue.closestZone()) meters"
        }
    }


}

