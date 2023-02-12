//
//  TraineeCollectionViewCell.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//

import UIKit

final class TraineeCollectionViewCell: UICollectionViewCell {
    
    var isPicked: Bool? {
        didSet {
            self.updateViewColor()
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 12
        setupLabel()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(label)
    }
    
    private func setupLabel() {
        label.tintColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
    }
    
    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.bottom.equalToSuperview()
        }
    }
    
    func update(with text: String, _ isPicked: Bool) {
        self.isPicked = isPicked
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        let attributedText = NSMutableAttributedString(
            string: "\(text)",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 14)!])
        label.attributedText = attributedText
    }
    
    func updateViewColor() {
        guard let isPicked = isPicked else { return }
        if isPicked {
            contentView.backgroundColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        } else {
            contentView.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
        }
    }

}
