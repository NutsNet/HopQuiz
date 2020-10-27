//
//  MarkQuiz.swift
//  HopQuiz
//
//  Created by ToF on 10/26/20.
//

import Foundation

class MarkQuiz {
    let hp = HopTools()
    
    init() {
    }
    
    func markDisplayMenu() {
        hp.clear()
        
        print("Enter your markdown header:")
        
        if let markStr = readLine() {
            let htmlStr = markToHtml(markStr: markStr)
            
            print("")
            print(htmlStr)
            print("")
            
            print("Enter a different markdown header?")
            print("[1] Yes please")
            print("[0] Return to main menu")
            print("____________________")
            
            if let input = UInt(readLine()!) {
                switch input {
                case 1:
                    markDisplayMenu()
                default:
                    break
                }
            }
        }
    }
    
    func markToHtml(markStr: String) -> String {
        var htmlStr = ""
        
        let hash =  markStr.components(separatedBy:"#")
        let nbHash = hash.count - 1
        
        if nbHash == 0 {
            htmlStr = "Error: no #"
        }
        
        if htmlStr == "" && nbHash > 6 {
            htmlStr = "Error: too many #"
        }
        
        if htmlStr == "" && markStr.range(of:"# ") == nil {
            htmlStr = "Error: no space"
        }
        
        if htmlStr == "" {
            htmlStr = "<h\(nbHash)>"
            
            let range: Range<String.Index> = markStr.range(of: "# ")!
            let index: Int = markStr.distance(from: markStr.startIndex, to: range.lowerBound) + 2
            
            var str: String = String(markStr.dropFirst(index))
            let components = str.components(separatedBy: .whitespacesAndNewlines)
            str =  components.filter { !$0.isEmpty }.joined(separator: " ")
            
            htmlStr = htmlStr + str + "</h\(nbHash)>"
        }
        
        return htmlStr
    }
}
