//
//  SumQuiz.swift
//  HopQuiz
//
//  Created by ToF on 10/26/20.
//

import Foundation

class SumQuiz {
    let hp = HopTools()
    
    init() {
    }
    
    func sumDisplayMenu() {
            hp.clear()
            
            print("Enter N:")
            
            if let n = Int(readLine()!) {
                print("")
                if n > 0 {
                    print("Sum: \(sumProcess(n: n))")
                } else {
                    print("N > 0 !!!")
                }
                print("")
                
                print("Enter a different number?")
                print("[1] Yes please")
                print("[0] Return to main menu")
                print("____________________")
                
                if let input = UInt(readLine()!) {
                    switch input {
                    case 1:
                        sumDisplayMenu()
                    default:
                        break
                    }
                }
            }
    }
    
    private func sumProcess(n: Int) -> Int {
        var sum = 0
        
        for i in 1...n {
            if !(i%3 == 0 && i%5 == 0) {
                if (i%3 == 0 || i%5 == 0) {
                    sum += i
                }
            }
        }
        
        return sum
    }
}
