//
//  UserDetailPresentor.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 05/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol UserDetailPresentationLogic {
    func presentUserDetail(response: ShowUserDetail.GetUserDetail.Response)
    func presentMessages(response: ShowMessages.GetMessages.Response)
}

class UserDetailPresenter: UserDetailPresentationLogic {
    
    weak var viewController: UserDetailDisplayLogic?
    
    func presentUserDetail(response: ShowUserDetail.GetUserDetail.Response) {
        
        let displayedUserDetail = ShowUserDetail.GetUserDetail.ViewModel.DisplayedUserDetail(userIdentifier: response.userDetail.id, username: "@\(response.userDetail.login)")
        
        let viewModel = ShowUserDetail.GetUserDetail.ViewModel(displayedUserDetail: displayedUserDetail)
        viewController?.displayUserDetail(viewModel: viewModel)
        
    }
    
    func presentMessages(response: ShowMessages.GetMessages.Response) {
        
        var displayedMessages: [ShowMessages.GetMessages.ViewModel.DisplayedMessage] = []
        for message in response.message ?? [] {
            let displayMessage = ShowMessages.GetMessages.ViewModel.DisplayedMessage(isMe: message.isMe, textMessage: message.text)
            displayedMessages.append(displayMessage)
        }
        let viewModel = ShowMessages.GetMessages.ViewModel(displayedMessages: displayedMessages)
        viewController?.displayMessages(viewModel: viewModel)
    }
}
