//
//  MorseQuiz.swift
//  HopQuiz
//
//  Created by ToF on 10/26/20.
//

import Foundation

class MorseQuiz {
    let hp = HopTools()
    private let root = MorseNode(value: "")
    
    var morseCodeArr = [[Character]()]
    
    var resArr = [String]()
    
    init() {
    }
    
    func morseDisplayMenu() {
        hp.clear()
        
        resArr.removeAll()
        
        root.morseNodeCreateTree(root: root, arrStr: [
            "E", "T",
            "I", "A", "N", "M",
            "S", "U", "R", "W", "D", "K", "G", "O",
            "H", "V", "F", "", "L", "", "P", "J", "B", "X", "C", "Y", "Z", "Q", "", ""
        ])
        
        print("Enter morse letter:")
        
        if let morseStr = readLine() {
            var isValid = true
            
            let morseArr = Array(morseStr)
            
            if morseArr.count > 4 { isValid = false }
            
            for c in morseArr {
                if c != "." && c != "-"  && c != "?" {
                    isValid = false
                }
            }
            
            if isValid {
                morseCodeArr.removeAll()
                morseCodeArr.append(morseArr)
                
                morseCheckMorseStr(arrOfCodeArr: morseCodeArr)
                    
                for arr in morseCodeArr {
                    if morseDecode(arr)! != "*" {
                        resArr.append(morseDecode(arr)!)
                    }
                }
                
                print("")
                print(resArr)
                
                print("")
                print("Enter a different morse letter?")
                print("[1] Yes please")
                print("[0] Return to main menu")
                print("____________________")
                
                if let input = UInt(readLine()!) {
                    switch input {
                    case 1:
                        morseDisplayMenu()
                    default:
                        break
                    }
                }
            } else {
                morseDisplayMenu()
            }
        }
    }
    
    func morseCheckMorseStr(arrOfCodeArr: Array<Array<Character>>) {
        var arrQueue = arrOfCodeArr
        
        morseCodeArr.removeFirst()
        
        while !(arrQueue.isEmpty) {
            let arr = arrQueue.first
            arrQueue.removeFirst()
            
            if arr!.contains("?") {
                for (i, c) in arr!.enumerated() {
                    if c == "?" {
                        var dotArr = arr
                        var barArr = arr
                        dotArr![i] = "."
                        barArr![i] = "-"
                        
                        if dotArr!.contains("?") {
                            arrQueue.append(dotArr!)
                        } else {
                            if !morseCodeArr.contains(dotArr!) {
                                morseCodeArr.append(dotArr!)
                            }
                        }
                        
                        if barArr!.contains("?") {
                            arrQueue.append(barArr!)
                        } else {
                            if !morseCodeArr.contains(barArr!) {
                                morseCodeArr.append(barArr!)
                            }
                        }
                    }
                }
            } else {
                morseCodeArr.append(arr!)
            }
        }
    }
    
    func morseDecode(_ morseCode: [Character]) -> String? {
        var node = root
        var isExist = true
        
        for c in morseCode {
            switch c {
            case ".":
                if let dotNode = node.dot {
                    node = dotNode
                } else {
                    isExist = false
                }
            case "-":
                if let barNode = node.bar {
                    node = barNode
                } else {
                    isExist = false
                }
            default:
                break
            }
        }
        
        if node.val == "" { isExist = false}
        
        if isExist {
            return node.val
        } else {
            return ("*")
        }
    }
}

private class MorseNode {
    var val: String?
    var dot: MorseNode?
    var bar: MorseNode?
    
    init(value: String) {
        val = value
        dot = nil
        bar = nil
    }
    
    func morseNodeCreateTree(root: MorseNode, arrStr: [String]) {
        for c in arrStr {
            var arrNodes = [self]
            
            while !arrNodes.isEmpty {
                let node = arrNodes.removeFirst()
                
                if node.dot == nil {
                    node.dot = MorseNode(value: c)
                    break
                } else {
                    arrNodes.append(node.dot!)
                }
                
                if node.bar == nil {
                    node.bar = MorseNode(value: c)
                    break
                } else {
                    arrNodes.append(node.bar!)
                }
            }
            
        }
    }
}
