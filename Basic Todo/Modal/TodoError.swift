//
//  TodoError.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/22/21.
//

import Foundation

enum TodoError: Error, LocalizedError {
    case saveError
    case readError
    case decodingError
    case encodeingError
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return NSLocalizedString("Could not save Todos, please reinstall the app.", comment: "")
        case .readError:
            return NSLocalizedString("Could not load Todos, please reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your Todos, please create a new todo to start over.", comment: "")
        case .encodeingError:
            return NSLocalizedString("Could not save Todos, please reinstall the app.", comment: "")
        }
    }
}

struct  ErrorType: Identifiable {
    let id = UUID()
    let error: TodoError
}

