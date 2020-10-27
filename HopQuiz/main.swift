//
//  main.swift
//  HopQuiz
//
//  Created by ToF on 10/26/20.
//

import Foundation

let hp = HopTools()

mainDisplayMenu()

func mainDisplayMenu() {
    hp.clear()
    
    print("Select quiz:")
    print("[1] Sum")
    print("[2] Morse decoder")
    print("[3] Markdown to HTML")
    print("[0] Exit quiz menu now! :(")
    print("____________________")
    
    let input = UInt(readLine()!)
    
    switch input {
    case 1:
        let sumQuiz = SumQuiz()
        sumQuiz.sumDisplayMenu()
    case 2:
        let morseQuiz = MorseQuiz()
        morseQuiz.morseDisplayMenu()
    case 3:
        let markQuiz = MarkQuiz()
        markQuiz.markDisplayMenu()
    default:
        break
    }
    
    if input != 0 { mainDisplayMenu() }
}
