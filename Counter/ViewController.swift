//
//  ViewController.swift
//  Counter
//
//  Created by Viktor on 19.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var count: Int = 0 {
        didSet {
            counterLabel.text = "\(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHistoryEntry("История изменений:")
    }

    @IBAction func plusButton(_ sender: Any) {
        count += 1
        addHistoryEntry("[\(formattedDate())]: значение изменилось на +1")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            addHistoryEntry("[\(formattedDate())]: значение изменилось на -1")
        } else {
            addHistoryEntry("[\(formattedDate())]: попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        addHistoryEntry("[\(formattedDate())]: значение сброшено")
    }
    
    private func addHistoryEntry(_ text: String) {
            historyTextView.text += "\n" + text
        let range = NSMakeRange(max(historyTextView.text.count - 1, 0), 0)
        historyTextView.scrollRangeToVisible(range)
        }

        private func formattedDate() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            return formatter.string(from: Date())
        }
    }
    


