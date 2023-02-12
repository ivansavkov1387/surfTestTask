//
//  ButtonsBarView.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 9.02.23.
//

import UIKit
import SnapKit

extension ButtonsBarView {
    struct Appearance {
        let tintColorLeftButton = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
        let tintColorRightButton = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let backgroundColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        let cornerRadius: CGFloat = 30
    }
}

class ButtonsBarView: UIView {
    
    let appearance: Appearance
    weak var delegate: TraineeViewsToController?
    
    private lazy var leftButton: InteractiveButton = {
        let button = InteractiveButton(radius: 0,
                                   backgroundColor: .white,
                                   textColor: appearance.tintColorLeftButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var rightButton: InteractiveButton = {
        let button = InteractiveButton(radius: appearance.cornerRadius,
                                   backgroundColor: appearance.backgroundColor,
                                   textColor: appearance.tintColorRightButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)

        return button
    }()
    

    init(frame: CGRect = .zero, appearance: Appearance = Appearance()) {
        self.appearance = appearance
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
        setupFirstButton()
        setupSecondButton()
        makeConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(leftButton)
        self.addSubview(rightButton)
    }
    
    private func setupFirstButton() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        let attributedText = NSMutableAttributedString(
            string: "Хочешь к нам?",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Regular", size: 14)!])
        leftButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    private func setupSecondButton() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        let attributedText = NSMutableAttributedString(
            string: "Отправить заявку",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 16)!])
        rightButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    
    private func makeConstraints() {
        leftButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.width.equalTo(219)
            make.height.equalTo(60)
        }
    }
    
    @objc func tappedButton() {
        delegate?.tappedButton()
    }
    
}
