//
//  SDKManager.swift
//  IMQA-Reference-iOS
//
//  Created by 차용빈 on 2022/04/26.
//

import Foundation
import IMQAMPMAgent

class SDKManager: NSObject {
    

    
    static func runSdk() {
        if ((UserDefaults.standard.string(forKey: "PK") == nil)) {
            UserDefaults.standard.set("$2b$05$mymkdICI4.l.aiW1QP4KY.ul37pE2AjhldsROD3vxk5VWhLJA9/Ka^#yQbUJ1aTaqSevo1tPrq40Q==", forKey: "PK")
        }
        
        let PROJECT_KEY = UserDefaults.standard.string(forKey: "PK")
        
        if ((UserDefaults.standard.string(forKey: "IMQA_URL")) == nil) {
            UserDefaults.standard.set("https://collector.imqa.io", forKey: "IMQA_URL")
        }
        
        let imqaUrl = UserDefaults.standard.string(forKey: "IMQA_URL")
        
        if ((UserDefaults.standard.integer(forKey: "SAVE_INTERVAL")) == 0) {
            UserDefaults.standard.set(10, forKey: "SAVE_INTERVAL")
        }
        
        let save_interval = UserDefaults.standard.integer(forKey: "SAVE_INTERVAL")
        
        if ((UserDefaults.standard.integer(forKey: "DUMP_INTERVAL")) == 0) {
            UserDefaults.standard.set(5, forKey: "DUMP_INTERVAL")
        }
        
        let dump_interval = UserDefaults.standard.integer(forKey: "DUMP_INTERVAL")
        
        let crashConfig = IMQACrashConfiguration(PROJECT_KEY!)
        crashConfig.endpoints = IMQACrashEndpointConfiguration(
            notify: imqaUrl! + "/cocoa/crash/send",
            sessions: imqaUrl! + "/cocoa/session")
        
        IMQACrash.start(with: crashConfig)
        
        let mpmConfig = IMQAConfig(PROJECT_KEY!)
        mpmConfig.api_url = imqaUrl!
        mpmConfig.dump_interval = dump_interval
        mpmConfig.save_interval = save_interval
        mpmConfig.downloadDumpData = true
        IMQAMpm.sharedInstance.run(config: mpmConfig)
                
    }
}
