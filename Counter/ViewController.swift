//
//  ViewController.swift
//  Counter
//
//  Created by Sergey Simashov on 26.04.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    
    private var counter: Int = 0 // Счетчик

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        counterLabel.text = "Значение счетчика: \(counter)"
        logTextView.text = "История изменений: \n"
      
    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        let currentDate = Date()
        counter += 1
                counterLabel.text = "Значение счетчика: \(counter)"
        logTextView.text += "[\(currentDate.formatted(date: .numeric, time: .standard))]: Значение изменено на +1\n"
        autoscroll()
    }
    
    @IBAction func subtractButtonDidTap(_ sender: Any) {
        let currentDate = Date()
        
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счетчика: \(counter)"
            logTextView.text += "[\(currentDate.formatted(date: .numeric, time: .standard))]: Значение изменено на -1\n"
            autoscroll()
        } else {
            logTextView.text += "[\(currentDate.formatted(date: .numeric, time: .standard))]: Попытка уменьшить значение счетчика ниже 0 \n"
            autoscroll()
        }
    }
    @IBAction func resetButtonDidTap(_ sender: Any) {
        let currentDate = Date()
        
        counter = 0
        counterLabel.text = "Значение счетчика: \(counter)"
        logTextView.text += "[\(currentDate.formatted(date: .numeric, time: .standard))]: Значение сброшено \n"
        autoscroll()
    }
    
    func autoscroll(){
        let range = NSRange(location: logTextView.text.count - 1, length: 0)
                logTextView.scrollRangeToVisible(range)
    }
    
}

