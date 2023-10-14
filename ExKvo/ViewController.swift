//
//  ViewController.swift
//  ExKvo
//
//  Created by 김종권 on 2023/10/14.
//

import UIKit

class ViewController: UIViewController {
    private let label = {
        let label = UILabel()
        label.text = "count: 0"
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let myButton = {
        let button = UIButton()
        button.setTitle("myButton", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var observer: NSKeyValueObservation?
    private var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(myButton)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        NSLayoutConstraint.activate([
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        observer = myButton.observe(\.isHighlighted) { [weak self] object, _ in
            guard let self, object.isHighlighted else { return }
            count += 1
            label.text = "count: \(count)"
        }
    }

    deinit {
        observer?.invalidate()
    }
}
