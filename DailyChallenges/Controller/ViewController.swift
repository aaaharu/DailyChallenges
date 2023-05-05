//
//  ViewController.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/02.
//

import UIKit

class ViewController: CustomViewController {
    
    var beforeClickedBtnTag: Int = 0


    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var premiumBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var mBtn: UIButton!
    @IBOutlet weak var xBtn: UIButton!
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var downbut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        
        setupUI()
        downbut.addTarget(self, action: #selector(downButClicked(_:)), for: .touchUpInside)
        
        premiumBtn.addTarget(self, action: #selector(NavToPrimiumVC(_:)), for: .touchUpInside)
    }
     
    fileprivate func setupUI() {
        btnTagSet()
      
            
            }

        
  
    // 돌아갈 화면에 코드 만들어놓기
    @IBAction func backToSecondVC(unwindSegue: UIStoryboardSegue) {
            
        }

    // 버튼 태그 부여해주기
    func btnTagSet() {
        let buttnArray: [UIButton] = [allBtn, premiumBtn, blackBtn, mBtn, xBtn]
        
        buttnArray.enumerated().forEach {
            // 각각의 요소를 빼서 각각 태그값을 더해서 태그값 할당해주기
            number, btn in btn.tag = number + 1
        }
    }
    
    @objc func downButClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "NavToToggleVC", sender: self)
    }
    
    @objc func NavToPrimiumVC(_ sender: UIButton) {
        self.performSegue(withIdentifier: "NavToPrimiumVC", sender: self)
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


// MARK: - TableView DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
   
    
}
