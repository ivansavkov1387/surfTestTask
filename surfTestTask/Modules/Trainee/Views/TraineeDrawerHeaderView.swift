//
//  TraineeDrawerHeaderView.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 7.02.23.
//

import UIKit
import SnapKit

extension TraineeDrawerHeaderView {
    struct Appearance {
        let tintColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
    }
}

class TraineeDrawerHeaderView: UIView {
    
    let appearance: Appearance
    
    private lazy var label: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    init(frame: CGRect = .zero, appearance: Appearance = Appearance()) {
        self.appearance = appearance
        super.init(frame: frame)
        addSubviews()
        setupLabel()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(label)
    }
    
    private func setupLabel() {
        label.tintColor = appearance.tintColor
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.12
        let attributedText = NSMutableAttributedString(string: "Стажировка в Surf", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 24)!])
        label.attributedText = attributedText
    }
    
    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.edges.top.equalToSuperview().inset(24)
            make.edges.trailing.equalToSuperview().inset(20)
            make.height.equalTo(32)
            make.width.equalTo(214)
        }
    }
    
}
