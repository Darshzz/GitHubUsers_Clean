//
//  UserDetailInteractor.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 05/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol UserDetailBusinessLogic
{
    var dataStore: UserDetailDataStoreLogic { get }
    func getUserDetail(request: ShowUserDetail.GetUserDetail.Request)
}

protocol UserChatMessages {
    func createMessage(message: Message)
    func fetchUserMessage(request: ShowMessages.GetMessages.Request)
}

class UserDetailInteractor: UserDetailBusinessLogic, UserChatMessages {
    
    var dataStore: UserDetailDataStoreLogic
    var presenter: UserDetailPresentationLogic?
    
    init(dataStore: UserDetailDataStoreLogic) {
        self.dataStore = dataStore
    }
    
    func getUserDetail(request: ShowUserDetail.GetUserDetail.Request) {
        let response = ShowUserDetail.GetUserDetail.Response(userDetail: dataStore.userDetail)
        presenter?.presentUserDetail(response: response)
    }
    
    func createMessage(message: Message) {
        dataStore.messages?.append(message)
        fetchUserMessage(request: ShowMessages.GetMessages.Request())
    }
    
    func fetchUserMessage(request: ShowMessages.GetMessages.Request) {
        let response  = ShowMessages.GetMessages.Response(message: dataStore.messages)
        presenter?.presentMessages(response: response)
    }
    
}
