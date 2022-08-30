import UIKit

final class HomeViewController: UIViewController {
    
    private let headerView: HomeHeaderView = {
        let headerView: HomeHeaderView = .init(frame: .zero)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewCompositionalLayout = {
            
            let itemSize: NSCollectionLayoutSize = .init(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1), heightDimension: NSCollectionLayoutDimension.absolute(120))
            let item: NSCollectionLayoutItem = .init(layoutSize: itemSize)
            
            let groupSize: NSCollectionLayoutSize = .init(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1), heightDimension: NSCollectionLayoutDimension.absolute(120))
            let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section: NSCollectionLayoutSection = .init(group: group)
            
            let sectionHeaderSize: NSCollectionLayoutSize = .init(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1), heightDimension: NSCollectionLayoutDimension.absolute(20))
            let header: NSCollectionLayoutBoundarySupplementaryItem = .init(
                layoutSize: sectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            section.boundarySupplementaryItems = [header]
            section.contentInsets = .init(top: 4, leading: 0, bottom: 24, trailing: 0)
            return UICollectionViewCompositionalLayout(section: section)
        }()
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeFeedCollectionViewCell.self, forCellWithReuseIdentifier: HomeFeedCollectionViewCell.identifer)
        collectionView.register(HomeFeedCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeFeedCollectionHeaderView.identifer)
        view.addSubview(headerView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
//            headerView.heightAnchor.constraint(equalToConstant: 450),
//            headerView.topAnchor.constraint(equalTo: view.topAnchor),
//            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//
//            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: )
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.bounds
        headerView.frame = .init(x: view.bounds.minX, y: view.bounds.minY, width: view.bounds.width, height: 450)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFeedCollectionViewCell.identifer, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeFeedCollectionHeaderView.identifer, for: indexPath) as? HomeFeedCollectionHeaderView else {
                    return .init(frame: .zero)
                }
                cell.prepare(title: "헤더 메시지")
                return cell
            default:
                return .init(frame: .zero)
        }
    }
}
