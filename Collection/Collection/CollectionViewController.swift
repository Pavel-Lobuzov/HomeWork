import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

   private var data: [CollectionSection] = [CollectionSection(title: "Избранное", items: [Item(title: "Платеж", imageName: "star.fill"),
                                                                                   Item(title: "Еда", imageName: "star.fill"),
                                                                                   Item(title: "Квартира", imageName: "star.fill"),
                                                                                   Item(title: "Налоги", imageName: "star.fill")]),
                                     CollectionSection(title: "Категории", items: [Item(title: "Машина", imageName: "star.fill"),
                                                                                   Item(title: "Развлечения", imageName: "star.fill"),
                                                                                   Item(title: "Хобби", imageName: "star.fill"),
                                                                                   Item(title: "Заведения", imageName: "star.fill"),
                                                                                   Item(title: "Одежда", imageName: "star.fill"),
                                                                                   Item(title: "Обувь", imageName: "star.fill"),
                                                                                   Item(title: "Аксессуары", imageName: "star.fill"),
                                                                                   Item(title: "Путешествия", imageName: "star.fill"),
                                                                                   Item(title: "Доставки", imageName: "star.fill")]),
                                     CollectionSection(title: "Архив", items: [Item(title: "Кредит", imageName: "star.fill"),
                                                                                   Item(title: "Рассрочка", imageName: "star.fill")])]
                                                                                
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 100, height: 140)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 40)
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.collectionViewLayout = layout
        collection.delegate = self
        collection.dataSource = self
        collection.register(ItemCustomCall.self, forCellWithReuseIdentifier: ItemCustomCall.reuseId)
        collection.register(HeaderView.self , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        collection.backgroundColor = UIColor.systemGray6
        return collection
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.title = "Аналитика расходов"
        setup()
    }
    
func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCustomCall.reuseId, for: indexPath) as! ItemCustomCall
        cell.bind(item: data[indexPath.section].items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as! HeaderView
            header.bind(title: data[indexPath.section].title)
            return header
        }
        return UICollectionReusableView()
    }
    
    private func setup() {
    
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
}
