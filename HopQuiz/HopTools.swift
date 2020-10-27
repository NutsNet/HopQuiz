//
//  HopTools.swift
//  HopQuiz
//
//  Created by ToF on 10/26/20.
//

import Foundation

public class HopTools: NSObject {
    static let shared = HopTools()
    override init() {
        super.init()
    }
    
    func clear() {
        let cls = Process()
        cls.launchPath = "/usr/bin/clear"
        cls.launch()
        cls.waitUntilExit()
    }
}
