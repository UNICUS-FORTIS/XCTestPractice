//
//  ViewController.swift
//  XCTestPractice
//
//  Created by LOUIE MAC on 4/19/24.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let idTextField = UITextField()
    private let pwTextField = UITextField()
    var validationCenter: ValidationCenter
    
    init(validationCenter: ValidationCenter) {
        self.validationCenter = validationCenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
    }
    
    private func configure() {
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.backgroundColor = .black
        
        idTextField.backgroundColor = .white
        pwTextField.backgroundColor = .white
    }
    
    
    private func setConstraints() {
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.bottom.equalTo(view.snp.centerY).offset(-30)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.bottom.equalTo(view.snp.centerY).offset(30)
        }
    }
}

