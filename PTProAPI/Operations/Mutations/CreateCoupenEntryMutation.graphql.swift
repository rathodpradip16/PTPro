// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateCoupenEntryMutation: GraphQLMutation {
    static let operationName: String = "CreateCoupenEntry"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation CreateCoupenEntry($userId: String, $couponCode: String) { CreateCoupenEntry(userId: $userId, couponCode: $couponCode) { __typename status } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var couponCode: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      couponCode: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.couponCode = couponCode
    }

    public var __variables: Variables? { [
      "userId": userId,
      "couponCode": couponCode
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("CreateCoupenEntry", CreateCoupenEntry?.self, arguments: [
          "userId": .variable("userId"),
          "couponCode": .variable("couponCode")
        ]),
      ] }

      var createCoupenEntry: CreateCoupenEntry? { __data["CreateCoupenEntry"] }

      /// CreateCoupenEntry
      ///
      /// Parent Type: `Couponmanager`
      struct CreateCoupenEntry: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Couponmanager }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
        ] }

        var status: Int? { __data["status"] }
      }
    }
  }

}