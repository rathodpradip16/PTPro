// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class MembershipplanbenefitsQuery: GraphQLQuery {
    static let operationName: String = "membershipplanbenefits"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query membershipplanbenefits($userId: String) { membershipplanbenefits(userId: $userId) { __typename errorMessage status results { __typename id title one two three four five six seven eight monthly yearly currency } } }"#
      ))

    public var userId: GraphQLNullable<String>

    public init(userId: GraphQLNullable<String>) {
      self.userId = userId
    }

    public var __variables: Variables? { ["userId": userId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("membershipplanbenefits", Membershipplanbenefits?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var membershipplanbenefits: Membershipplanbenefits? { __data["membershipplanbenefits"] }

      /// Membershipplanbenefits
      ///
      /// Parent Type: `MembershipPlanBenefitsType`
      struct Membershipplanbenefits: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.MembershipPlanBenefitsType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
          .field("results", Results?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
        var results: Results? { __data["results"] }

        /// Membershipplanbenefits.Results
        ///
        /// Parent Type: `MembershipPlanType`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.MembershipPlanType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("one", String?.self),
            .field("two", String?.self),
            .field("three", String?.self),
            .field("four", String?.self),
            .field("five", String?.self),
            .field("six", String?.self),
            .field("seven", String?.self),
            .field("eight", String?.self),
            .field("monthly", Int?.self),
            .field("yearly", Int?.self),
            .field("currency", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var one: String? { __data["one"] }
          var two: String? { __data["two"] }
          var three: String? { __data["three"] }
          var four: String? { __data["four"] }
          var five: String? { __data["five"] }
          var six: String? { __data["six"] }
          var seven: String? { __data["seven"] }
          var eight: String? { __data["eight"] }
          var monthly: Int? { __data["monthly"] }
          var yearly: Int? { __data["yearly"] }
          var currency: String? { __data["currency"] }
        }
      }
    }
  }

}