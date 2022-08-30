import UIKit

final class HomeFeedCollectionViewCell: UICollectionViewCell {
    
    static let identifer: String = "HomeFeedCollectionViewCell"
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.minimumInteritemSpacing = 12
        layout.itemSize = .init(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemMint
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeFeedContentsCollectionCell.self, forCellWithReuseIdentifier: HomeFeedContentsCollectionCell.identifier)
        
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = contentView.bounds
    }
}

extension HomeFeedCollectionViewCell: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

extension HomeFeedCollectionViewCell: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFeedContentsCollectionCell.identifier, for: indexPath)
        return cell
    }
}
