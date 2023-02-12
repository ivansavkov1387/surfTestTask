//
//  TraineeView.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//

import UIKit
import UltraDrawerView
import SnapKit

extension TraineeView {
    struct Appearance {
        let backgroundColor = UIColor.white
        let cornerRadius: CGFloat = 32
        let middleInsetFromBottom: CGFloat = 476
    }
}

final class TraineeView: UIView  {
    
    let appearance: Appearance
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TraineeHeaderView.self)
        collectionView.register(TraineeCollectionViewCell.self)
        collectionView.collectionViewLayout = createLayout()
        return collectionView
    }()
    
    private lazy var header: TraineeDrawerHeaderView = {
        let header = TraineeDrawerHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private lazy var drawerView: DrawerView = {
        let drawerView = DrawerView(scrollView: self.collectionView, headerView: self.header)
        drawerView.translatesAutoresizingMaskIntoConstraints = false
        drawerView.availableStates = [.top, .middle, .bottom]
        drawerView.setState(.middle, animated: false)
        drawerView.bottomPosition = .fromBottom(300)
        drawerView.topPosition = .fromBottom(734)
        drawerView.shouldFadeInBottomState = false
        
        drawerView.animationParameters = .spring(mass: 1, stiffness: 200, dampingRatio: 0.5)
        drawerView.animationParameters = .spring(.default)
        
        return drawerView
    }()
    
    init(frame: CGRect = .zero, appearance: Appearance = Appearance()) {
        self.appearance = appearance
        super.init(frame: frame)
        backgroundColor = appearance.backgroundColor
        self.setupDrawerView()
        self.addSubviews()
        self.makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupDrawerView() {
        drawerView.containerView.backgroundColor = appearance.backgroundColor
        drawerView.cornerRadius = appearance.cornerRadius
        drawerView.middlePosition = .fromBottom(appearance.middleInsetFromBottom)
    }
    

    
    private func addSubviews() {
        addSubview(drawerView)
    }
    
    private func makeConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        drawerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

extension TraineeView: TraineeControllerToViews {
    func setDelegate(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    
}

// MARK: - UICollectionViewCompositionalLayout
private extension TraineeView {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layountEnviroment in
            let section = MockData.shared.pageData[sectionIndex]
            switch section {
            case .sectionOne:
                return self.createFirstSectionLayout()
            case .sectionTwo:
                return self.createSecondSectionLayout(layoutEnviroment: layountEnviroment)
            }
        }
    }
    
    func createFirstSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(40),
                                              heightDimension: .absolute(44))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 24, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 12
        section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
        return section
    }
    
    func createSecondSectionLayout(layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(40),
                                              heightDimension: .absolute(44))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(360),
            heightDimension: .estimated(70))
        
        var group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        

        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 24, trailing: 20)
        
        section.orthogonalScrollingBehavior = .none
        
        section.interGroupSpacing = 12
        section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
        return section
    }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(40)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .topLeading)
    }
    
}

