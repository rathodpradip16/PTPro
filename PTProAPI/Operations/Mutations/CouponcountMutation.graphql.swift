// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CouponcountMutation: GraphQLMutation {
    static let operationName: String = "Couponcount"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation Couponcount($id: Int!, $couponCode: String) { Couponcount(id: $id, couponCode: $couponCode) { __typename status errorMessage } }"#
      ))

    public var id: Int
    public var couponCode: GraphQLNullable<String>

    public init(
      id: Int,
      couponCode: GraphQLNullable<String>
    ) {
      self.id = id
      self.couponCode = couponCode
    }

    public var __variables: Variables? { [
      "id": id,
      "couponCode": couponCode
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("Couponcount", Couponcount?.self, arguments: [
          "id": .variable("id"),
          "couponCode": .variable("couponCode")
        ]),
      ] }

      var couponcount: Couponcount? { __data["Couponcount"] }

      /// Couponcount
      ///
      /// Parent Type: `Couponmanager`
      struct Couponcount: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Couponmanager }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}