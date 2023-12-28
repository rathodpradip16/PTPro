// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetcouponuseQuery: GraphQLQuery {
    static let operationName: String = "getcouponuse"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getcouponuse($userId: String, $couponCode: String, $listId: Int, $planId: Int, $isforplan: Boolean) { getcouponuse( userId: $userId couponCode: $couponCode listId: $listId isforplan: $isforplan planId: $planId ) { __typename errorMessage status } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var couponCode: GraphQLNullable<String>
    public var listId: GraphQLNullable<Int>
    public var planId: GraphQLNullable<Int>
    public var isforplan: GraphQLNullable<Bool>

    public init(
      userId: GraphQLNullable<String>,
      couponCode: GraphQLNullable<String>,
      listId: GraphQLNullable<Int>,
      planId: GraphQLNullable<Int>,
      isforplan: GraphQLNullable<Bool>
    ) {
      self.userId = userId
      self.couponCode = couponCode
      self.listId = listId
      self.planId = planId
      self.isforplan = isforplan
    }

    public var __variables: Variables? { [
      "userId": userId,
      "couponCode": couponCode,
      "listId": listId,
      "planId": planId,
      "isforplan": isforplan
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getcouponuse", Getcouponuse?.self, arguments: [
          "userId": .variable("userId"),
          "couponCode": .variable("couponCode"),
          "listId": .variable("listId"),
          "isforplan": .variable("isforplan"),
          "planId": .variable("planId")
        ]),
      ] }

      var getcouponuse: Getcouponuse? { __data["getcouponuse"] }

      /// Getcouponuse
      ///
      /// Parent Type: `Couponmanager`
      struct Getcouponuse: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Couponmanager }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
      }
    }
  }

}