//
//  SearchViewController.swift
//  Github Followers
//
//  Created by Vitaliy Yefimchuk on 25.07.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListViewController() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please, enter Your username", buttonTitle: "Okay")
            return
        }
        
        let followersListVC = FollowersListViewController()
        followersListVC.username = usernameTextField.text
        followersListVC.title = usernameTextField.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    // MARK: - Private functions
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 80
            ),
            logoImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor,
                constant: 0
            ),
            logoImageView.heightAnchor.constraint(
                equalToConstant: 200
            ),
            logoImageView.widthAnchor.constraint(
                equalToConstant: 200
            )
        ])
    }
    
    private func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: 48
            ),
            usernameTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 48
            ),
            usernameTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -48
            ),
            usernameTextField.heightAnchor.constraint(
                equalToConstant: 48
            )
        ])
    }
    
    private func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushFollowerListViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -48
            ),
            callToActionButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 48
            ),
            callToActionButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -48
            ),
            callToActionButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

// MARK: - Extensions
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListViewController()
        return true
    }
}
