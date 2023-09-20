// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetAllThreadsQuery: GraphQLQuery {
    static let operationName: String = "getAllThreads"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getAllThreads($threadType: String, $threadId: Int, $currentPage: Int) { getAllThreads( threadType: $threadType threadId: $threadId currentPage: $currentPage ) { __typename results { __typename id listId guest host listData { __typename city state country } threadItem { __typename id threadId content sentBy isRead type startDate endDate createdAt } guestProfile { __typename profileId displayName firstName picture } hostProfile { __typename profileId displayName firstName picture } } count status errorMessage } }"#
      ))

    public var threadType: GraphQLNullable<String>
    public var threadId: GraphQLNullable<Int>
    public var currentPage: GraphQLNullable<Int>

    public init(
      threadType: GraphQLNullable<String>,
      threadId: GraphQLNullable<Int>,
      currentPage: GraphQLNullable<Int>
    ) {
      self.threadType = threadType
      self.threadId = threadId
      self.currentPage = currentPage
    }

    public var __variables: Variables? { [
      "threadType": threadType,
      "threadId": threadId,
      "currentPage": currentPage
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getAllThreads", GetAllThreads?.self, arguments: [
          "threadType": .variable("threadType"),
          "threadId": .variable("threadId"),
          "currentPage": .variable("currentPage")
        ]),
      ] }

      var getAllThreads: GetAllThreads? { __data["getAllThreads"] }

      /// GetAllThreads
      ///
      /// Parent Type: `AllThreads`
      struct GetAllThreads: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllThreads }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("count", Int?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var count: Int? { __data["count"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetAllThreads.Result
        ///
        /// Parent Type: `Threads`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Threads }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("listId", Int?.self),
            .field("guest", String?.self),
            .field("host", String?.self),
            .field("listData", ListData?.self),
            .field("threadItem", ThreadItem?.self),
            .field("guestProfile", GuestProfile?.self),
            .field("hostProfile", HostProfile?.self),
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var guest: String? { __data["guest"] }
          var host: String? { __data["host"] }
          var listData: ListData? { __data["listData"] }
          var threadItem: ThreadItem? { __data["threadItem"] }
          var guestProfile: GuestProfile? { __data["guestProfile"] }
          var hostProfile: HostProfile? { __data["hostProfile"] }

          /// GetAllThreads.Result.ListData
          ///
          /// Parent Type: `ShowListing`
          struct ListData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("city", String?.self),
              .field("state", String?.self),
              .field("country", String?.self),
            ] }

            var city: String? { __data["city"] }
            var state: String? { __data["state"] }
            var country: String? { __data["country"] }
          }

          /// GetAllThreads.Result.ThreadItem
          ///
          /// Parent Type: `ThreadItems`
          struct ThreadItem: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ThreadItems }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("threadId", Int?.self),
              .field("content", String?.self),
              .field("sentBy", String?.self),
              .field("isRead", Bool?.self),
              .field("type", String?.self),
              .field("startDate", String?.self),
              .field("endDate", String?.self),
              .field("createdAt", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var threadId: Int? { __data["threadId"] }
            var content: String? { __data["content"] }
            var sentBy: String? { __data["sentBy"] }
            var isRead: Bool? { __data["isRead"] }
            var type: String? { __data["type"] }
            var startDate: String? { __data["startDate"] }
            var endDate: String? { __data["endDate"] }
            var createdAt: String? { __data["createdAt"] }
          }

          /// GetAllThreads.Result.GuestProfile
          ///
          /// Parent Type: `UserProfile`
          struct GuestProfile: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("firstName", String?.self),
              .field("picture", String?.self),
            ] }

            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var firstName: String? { __data["firstName"] }
            var picture: String? { __data["picture"] }
          }

          /// GetAllThreads.Result.HostProfile
          ///
          /// Parent Type: `UserProfile`
          struct HostProfile: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("firstName", String?.self),
              .field("picture", String?.self),
            ] }

            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var firstName: String? { __data["firstName"] }
            var picture: String? { __data["picture"] }
          }
        }
      }
    }
  }

}