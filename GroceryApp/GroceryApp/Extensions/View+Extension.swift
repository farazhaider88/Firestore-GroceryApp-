//
//  View+Extension.swift
//  GroceryApp
//
//  Created by Faraz Haider on 16/02/2021.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
