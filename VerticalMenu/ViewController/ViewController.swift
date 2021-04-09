//
//  ViewController.swift
//  VerticalMenu
//
//  Created by Angelos Staboulis on 9/4/21.
//

import UIKit
protocol CollectionDelegate:AnyObject{
    func setupCell(collectionView:UICollectionView,indexPath:IndexPath)->VerticalMenuCell
    func createTwoColumns()->CGSize
}
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var numbers:[Int]=[]
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }


}

extension ViewController{
    func setupView(){
        self.navigationItem.title = "CollectionView Two Columns"
        view.backgroundColor = .link
        collectionView.delegate = self
        collectionView.dataSource = self
        for item in 0..<100{
            numbers.append(item)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:VerticalMenuCell = collectionView.cellForItem(at: indexPath) as! VerticalMenuCell
        cell.lblDescription.backgroundColor = .cyan
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell:VerticalMenuCell = collectionView.cellForItem(at: indexPath) as! VerticalMenuCell
        cell.lblDescription.backgroundColor = .clear
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return createTwoColumns()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setupCell(collectionView: collectionView, indexPath: indexPath)
    }
    
}
extension ViewController:CollectionDelegate {
    func setupCell(collectionView:UICollectionView,indexPath:IndexPath)->VerticalMenuCell{
        let cell:VerticalMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VerticalMenuCell
        if indexPath.row < numbers.count {
            cell.lblDescription.text = String(numbers[indexPath.row])
            cell.lblDescription.textColor = .white
        }
        return cell
    }
    func createTwoColumns()->CGSize{
        let width =  Double(collectionView.bounds.width/3) + 50
        let height = Double(100)
        return CGSize(width: width, height: height)
    }
}
