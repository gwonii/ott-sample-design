import UIKit

final class HomeFeedContentsCollectionCell: UICollectionViewCell {
    
    static let identifier: String = "HomeFeedContentsCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
