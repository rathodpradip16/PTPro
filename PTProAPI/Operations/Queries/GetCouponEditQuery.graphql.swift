// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetCouponEditQuery: GraphQLQuery {
    static let operationName: String = "getCouponEdit"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getCouponEdit($userId: String, $couponType: String, $listId: Int, $subscriptionType: String) { getCouponEdit( userId: $userId couponType: $couponType listId: $listId subscriptionType: $subscriptionType ) { __typename errorMessage status data { __typename id couponCode activeStatus couponType discount startDate endDate description userType } } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var couponType: GraphQLNullable<String>
    public var listId: GraphQLNullable<Int>
    public var subscriptionType: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      couponType: GraphQLNullable<String>,
      listId: GraphQLNullable<Int>,
      subscriptionType: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.couponType = couponType
      self.listId = listId
      self.subscriptionType = subscriptionType
    }

    public var __variables: Variables? { [
      "userId": userId,
      "couponType": couponType,
      "listId": listId,
      "subscriptionType": subscriptionType
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getCouponEdit", GetCouponEdit?.self, arguments: [
          "userId": .variable("userId"),
          "couponType": .variable("couponType"),
          "listId": .variable("listId"),
          "subscriptionType": .variable("subscriptionType")
        ]),
      ] }

      var getCouponEdit: GetCouponEdit? { __data["getCouponEdit"] }

      /// GetCouponEdit
      ///
      /// Parent Type: `Couponmanager`
      struct GetCouponEdit: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Couponmanager }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
          .field("data", [Datum?]?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
        var data: [Datum?]? { __data["data"] }

        /// GetCouponEdit.Datum
        ///
        /// Parent Type: `Getcoupon`
        struct Datum: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Getcoupon }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("couponCode", String?.self),
            .field("activeStatus", String?.self),
            .field("couponType", String?.self),
            .field("discount", Double?.self),
            .field("startDate", String?.self),
            .field("endDate", String?.self),
            .field("description", String?.self),
            .field("userType", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var couponCode: String? { __data["couponCode"] }
          var activeStatus: String? { __data["activeStatus"] }
          var couponType: String? { __data["couponType"] }
          var discount: Double? { __data["discount"] }
          var startDate: String? { __data["startDate"] }
          var endDate: String? { __data["endDate"] }
          var description: String? { __data["description"] }
          var userType: String? { __data["userType"] }
        }
      }
    }
  }

}