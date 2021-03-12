//
//  UserResponseJSONs.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

enum UserResponseJSONs {
    static let dailymotionUsersJSON = """
    {
      "page": 1,
      "limit": 10,
      "explicit": false,
      "total": 1000,
      "has_more": true,
      "list": [
        {
          "avatar_360_url": "https://s1.dmcdn.net/d/5000001oOmaRS/360x360",
          "username": "dm_9f445d0a163a3f52c1edf93d2eae5221"
        },
        {
          "avatar_360_url": "https://s2.dmcdn.net/u/8y-qs1WITjm6uXFR6/360x360",
          "username": "TheFalcon-And-TheWinterSoldier-Season-1-Episode-5-Film-HDQ"
        },
        {
          "avatar_360_url": "https://s2.dmcdn.net/d/5000001oOmaRS/360x360",
          "username": "dm_ada1e666eff21515edb442fc115e54a8"
        },
        {
          "avatar_360_url": "https://s2.dmcdn.net/d/5000001oOmaRS/360x360",
          "username": "dm_dec0ebd7b24b4cec7b166ea4b87ab413"
        },
        {
          "avatar_360_url": "https://s2.dmcdn.net/u/8y-kq1WITTZmgx3Ce/360x360",
          "username": "dm_0972f66d08885bee5cc80dd97d6d545b"
        },
        {
          "avatar_360_url": "https://s2.dmcdn.net/d/5000001oOmaRS/360x360",
          "username": "dm_ec83a91182b354868e10e9f6f8ea01bd"
        },
        {
          "avatar_360_url": "https://s2.dmcdn.net/u/8y-kT1WITY85xv3Cd/360x360",
          "username": "TheFalcon-And-TheWinterSoldier-Season-1-Episode-4-Film-HDQ"
        },
        {
          "avatar_360_url": "https://s1.dmcdn.net/d/5000001oOmaRS/360x360",
          "username": "dm_833c368499b09f17bdf5dac07da91b16"
        },
        {
          "avatar_360_url": "https://s1.dmcdn.net/d/5000001oOmaRS/360x360",
          "username": "dm_2d4228028b4209d99e92095ef17f91d4"
        },
        {
          "avatar_360_url": "https://s2.dmcdn.net/u/8y-k51WITP9nfbevq/360x360",
          "username": "dm_c81a6552584d7da5befb6f1846994425"
        }
      ]
    }
    
    """
    
    static let githubUsersJSON = """
    [
      {
        "login": "mojombo",
        "id": 1,
        "node_id": "MDQ6VXNlcjE=",
        "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/mojombo",
        "html_url": "https://github.com/mojombo",
        "followers_url": "https://api.github.com/users/mojombo/followers",
        "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
        "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
        "organizations_url": "https://api.github.com/users/mojombo/orgs",
        "repos_url": "https://api.github.com/users/mojombo/repos",
        "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
        "received_events_url": "https://api.github.com/users/mojombo/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "defunkt",
        "id": 2,
        "node_id": "MDQ6VXNlcjI=",
        "avatar_url": "https://avatars.githubusercontent.com/u/2?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/defunkt",
        "html_url": "https://github.com/defunkt",
        "followers_url": "https://api.github.com/users/defunkt/followers",
        "following_url": "https://api.github.com/users/defunkt/following{/other_user}",
        "gists_url": "https://api.github.com/users/defunkt/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/defunkt/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/defunkt/subscriptions",
        "organizations_url": "https://api.github.com/users/defunkt/orgs",
        "repos_url": "https://api.github.com/users/defunkt/repos",
        "events_url": "https://api.github.com/users/defunkt/events{/privacy}",
        "received_events_url": "https://api.github.com/users/defunkt/received_events",
        "type": "User",
        "site_admin": false
      },
      {
        "login": "pjhyett",
        "id": 3,
        "node_id": "MDQ6VXNlcjM=",
        "avatar_url": "https://avatars.githubusercontent.com/u/3?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/pjhyett",
        "html_url": "https://github.com/pjhyett",
        "followers_url": "https://api.github.com/users/pjhyett/followers",
        "following_url": "https://api.github.com/users/pjhyett/following{/other_user}",
        "gists_url": "https://api.github.com/users/pjhyett/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/pjhyett/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/pjhyett/subscriptions",
        "organizations_url": "https://api.github.com/users/pjhyett/orgs",
        "repos_url": "https://api.github.com/users/pjhyett/repos",
        "events_url": "https://api.github.com/users/pjhyett/events{/privacy}",
        "received_events_url": "https://api.github.com/users/pjhyett/received_events",
        "type": "User",
        "site_admin": false
      }
    ]
    """
}
