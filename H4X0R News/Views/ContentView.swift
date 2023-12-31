//
//  ContentView.swift
//  H4X0R News
//
//  Created by Jayanth Ambaldhage on 02/07/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("HX40R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post: Identifiable{
//    let id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hi"),
//    Post(id: "3", title: "Hai")
//
//]
