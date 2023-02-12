//
//  TraineeHeaderView.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//

import UIKit

final class TraineeHeaderView: UICollectionReusableView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(label)
    }
    
    private func setupLabel() {
        label.backgroundColor = UIColor.white
        label.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
    }
    
    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func update(with text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        let attributedText = NSMutableAttributedString(
            string: "\(text)",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Regular", size: 14)!])
        label.attributedText = attributedText
    }
}
