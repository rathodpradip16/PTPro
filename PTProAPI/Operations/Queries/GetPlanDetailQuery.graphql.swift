// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPlanDetailQuery: GraphQLQuery {
    static let operationName: String = "getPlanDetail"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPlanDetail($userId: String) { getPlanDetails(userId: $userId) { __typename errorMessage status results { __typename planType id title one onetitle two twotitle three threetitle four fourtitle five fivetitle six sixtitle seven seventitle eight eighttitle monthly yearly currency status expiryDate } } }"#
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
        .field("getPlanDetails", GetPlanDetails?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var getPlanDetails: GetPlanDetails? { __data["getPlanDetails"] }

      /// GetPlanDetails
      ///
      /// Parent Type: `PlanDetailsType`
      struct GetPlanDetails: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.PlanDetailsType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
          .field("results", [Result?]?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
        var results: [Result?]? { __data["results"] }

        /// GetPlanDetails.Result
        ///
        /// Parent Type: `GetPlanDetailsType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPlanDetailsType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("planType", String?.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("one", String?.self),
            .field("onetitle", String?.self),
            .field("two", String?.self),
            .field("twotitle", String?.self),
            .field("three", String?.self),
            .field("threetitle", String?.self),
            .field("four", String?.self),
            .field("fourtitle", String?.self),
            .field("five", String?.self),
            .field("fivetitle", String?.self),
            .field("six", String?.self),
            .field("sixtitle", String?.self),
            .field("seven", String?.self),
            .field("seventitle", String?.self),
            .field("eight", String?.self),
            .field("eighttitle", String?.self),
            .field("monthly", Int?.self),
            .field("yearly", Int?.self),
            .field("currency", String?.self),
            .field("status", Int?.self),
            .field("expiryDate", String?.self),
          ] }

          var planType: String? { __data["planType"] }
          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var one: String? { __data["one"] }
          var onetitle: String? { __data["onetitle"] }
          var two: String? { __data["two"] }
          var twotitle: String? { __data["twotitle"] }
          var three: String? { __data["three"] }
          var threetitle: String? { __data["threetitle"] }
          var four: String? { __data["four"] }
          var fourtitle: String? { __data["fourtitle"] }
          var five: String? { __data["five"] }
          var fivetitle: String? { __data["fivetitle"] }
          var six: String? { __data["six"] }
          var sixtitle: String? { __data["sixtitle"] }
          var seven: String? { __data["seven"] }
          var seventitle: String? { __data["seventitle"] }
          var eight: String? { __data["eight"] }
          var eighttitle: String? { __data["eighttitle"] }
          var monthly: Int? { __data["monthly"] }
          var yearly: Int? { __data["yearly"] }
          var currency: String? { __data["currency"] }
          var status: Int? { __data["status"] }
          var expiryDate: String? { __data["expiryDate"] }
        }
      }
    }
  }

}