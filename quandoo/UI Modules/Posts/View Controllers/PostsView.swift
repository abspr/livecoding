//
//  PostsViewController.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import SwiftUI

struct PostsView: View {
    
    @ObservedObject var viewModel: PostsViewModel

    var body: some View {
        List(viewModel.posts) { post in 
            Section {
                PostItemView(post: post)
            }
        }.navigationTitle("Posts")
    }
    
}

struct PostItemView: View {
  
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            title
            Divider().padding(.vertical, 5)
            content
        }.padding()
    }
    
    private var title: some View {
        Text(post.title)
            .font(.system(size: 15))
            .foregroundStyle(.secondary)
    }
    
    private var content: some View {
        Text(post.body)
            .font(.system(size: 17))
            .foregroundStyle(.primary)
    }
    
}
