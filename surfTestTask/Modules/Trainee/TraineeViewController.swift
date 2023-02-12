//
//  TraineeViewController.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//  
//

import UIKit
import SnapKit

final class TraineeViewController: UIViewController {
    
    private let output: TraineeViewOutput
    weak var collectionViewDelegate: TraineeControllerToViews?
    
    private var courses = [CourseViewModel]()
    
    private var selectedCourses = [CourseViewModel]()
    
    lazy var contentView: UIView  = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        return view
    }()
    
    lazy var drawerView: TraineeView  = {
        TraineeView()
    }()
    
    lazy var buttonsBar: ButtonsBarView = {
        ButtonsBarView()
    }()
    
    lazy var bgImage: UIImageView = {
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "background")
        bgImage.contentMode = .top
        return bgImage
    }()
    
    init(output: TraineeViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(drawerView)
        view.addSubview(bgImage)
        view.addSubview(buttonsBar)
        drawerView.setDelegate(delegate: self, dataSource: self)
        buttonsBar.delegate = self
        drawerView.insertSubview(bgImage, at: 0)
        self.output.viewDidLoad()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawerView.frame = view.bounds
        bgImage.frame = view.bounds
        buttonsBar.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(118)
        }
        
    }
    
    
    
}

extension TraineeViewController: TraineeViewInput {
    func set(viewModels: [CourseViewModel]) {
        self.courses = viewModels
        DispatchQueue.main.async {
            self.collectionViewDelegate?.reloadData()
        }
    }
    
}
    

extension TraineeViewController: TraineeViewsToController {
    
    func tappedButton() {
        self.output.alert()
    }
    
    
}



extension TraineeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        courses.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: TraineeCollectionViewCell.self, for: indexPath)
        let course = courses[indexPath.item]
        cell.update(with: course.name, course.isPicked)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueSectionHeaderCell(cellType: TraineeHeaderView.self, for: indexPath)
        var text = ""
        if indexPath.section == 0 {
            text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты. "
        } else if indexPath.section == 1 {
            text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        }
        header.update(with: text)
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        courses[indexPath.item].isPicked.toggle()
        collectionView.reloadItems(at: [indexPath])
        collectionView.moveItem(at: indexPath, to: IndexPath(item: 0, section: 0))


    }
    
    

    
    
    
    
    
}

