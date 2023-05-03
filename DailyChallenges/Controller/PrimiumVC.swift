//
//  PrimiumVC.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/02.
//

import UIKit

class PrimiumVC: UIViewController {
  
 
    let cardList: [CardList] = [
        CardList(cardName: "현대카드", cardSecondName: "좋은 카드", cardDescription: "첫 가입 기념", yearPay: "연회비 100,000"),
        CardList(cardName: "현대카드", cardSecondName: "좋은 카드", cardDescription: "첫 가입 기념", yearPay: "연회비 100,000"),
        CardList(cardName: "현대카드", cardSecondName: "좋은 카드", cardDescription: "첫 가입 기념", yearPay: "연회비 100,000")
    ]
 

    


    var beforeClickedBtnTag: Int = 0


    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var premiumBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var mBtn: UIButton!
    @IBOutlet weak var xBtn: UIButton!
    
 
    @IBOutlet weak var downbut: UIButton!
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        downbut.addTarget(self, action: #selector(downButClicked(_:)), for: .touchUpInside)
        myTableView.register(UINib(nibName: C.nibName, bundle: nil), forCellReuseIdentifier: C.reuseablecell)
 
    }
     
    fileprivate func setupUI() {
        btnTagSet()
        myTableView.dataSource = self
        myTableView.delegate = self
            
            }

    
        
  
    // 돌아갈 화면에 코드 만들어놓기


    @objc func downButClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "NavToToggleVC", sender: self)
    }
    
    
    // 버튼 태그 부여해주기
    func btnTagSet() {
        let buttnArray: [UIButton] = [allBtn, premiumBtn, blackBtn, mBtn, xBtn]
        
        buttnArray.enumerated().forEach {
            // 각각의 요소를 빼서 각각 태그값을 더해서 태그값 할당해주기
            number, btn in btn.tag = number + 1
        }
    }

    

    @IBAction func btnClicked(_ sender: UIButton) {
        print("Clicked button tag: \(sender.tag)")
        
        if beforeClickedBtnTag != sender.tag { // 이전에 클릭한 버튼과 지금 클릭한 버튼이 다를 경우

            // 이전에 클릭한 버튼의 태그를 가져와서 이전에 클릭한 버튼의 색을 원래대로 바꿔준다.
            
            if let beforeBtn =  view.viewWithTag(beforeClickedBtnTag) as? UIButton {
                beforeBtn.backgroundColor = .systemGray5
                beforeBtn.setTitleColor(.systemGray, for: .normal)
                
               
            }
            // 클릭한 버튼의 색을 바꿔준다.
            sender.backgroundColor = .black
            sender.setTitleColor(.white, for: .normal)
            
            // 클릭한 버튼의 태그를 before버튼 속성에 저장해준다
            beforeClickedBtnTag = sender.tag
        }
    }
    
            

}


// MARK: - 데이터 소스
extension PrimiumVC: UITableViewDataSource  {
    
    // 필요한 셀 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    // 각 셀을 구성하고 반환하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = myTableView.dequeueReusableCell(withIdentifier: C.reuseablecell, for: indexPath)  as! CardListCell 
            cell.label.text = cardList[indexPath.row].cardName
        cell.cardSecondName.text = cardList[indexPath.row].cardSecondName
        cell.cardDesCription.text = cardList[indexPath.row].cardDescription
        cell.yearPay.text = cardList[indexPath.row].yearPay
        
            return cell
    }
    
    
}

extension PrimiumVC: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
