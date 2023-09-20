// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreatecouponcodeMutation: GraphQLMutation {
    static let operationName: String = "Createcouponcode"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation Createcouponcode($userId: String, $listId: Int, $couponCode: String, $couponType: String, $discount: Float, $startDate: String, $endDate: String, $description: String, $userType: String) { Createcouponcode( userId: $userId listId: $listId couponCode: $couponCode couponType: $couponType discount: $discount startDate: $startDate endDate: $endDate description: $description userType: $userType ) { __typename status } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var listId: GraphQLNullable<Int>
    public var couponCode: GraphQLNullable<String>
    public var couponType: GraphQLNullable<String>
    public var discount: GraphQLNullable<Double>
    public var startDate: GraphQLNullable<String>
    public var endDate: GraphQLNullable<String>
    public var description: GraphQLNullable<String>
    public var userType: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      listId: GraphQLNullable<Int>,
      couponCode: GraphQLNullable<String>,
      couponType: GraphQLNullable<String>,
      discount: GraphQLNullable<Double>,
      startDate: GraphQLNullable<String>,
      endDate: GraphQLNullable<String>,
      description: GraphQLNullable<String>,
      userType: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.listId = listId
      self.couponCode = couponCode
      self.couponType = couponType
      self.discount = discount
      self.startDate = startDate
      self.endDate = endDate
      self.description = description
      self.userType = userType
    }

    public var __variables: Variables? { [
      "userId": userId,
      "listId": listId,
      "couponCode": couponCode,
      "couponType": couponType,
      "discount": discount,
      "startDate": startDate,
      "endDate": endDate,
      "description": description,
      "userType": userType
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("Createcouponcode", Createcouponcode?.self, arguments: [
          "userId": .variable("userId"),
          "listId": .variable("listId"),
          "couponCode": .variable("couponCode"),
          "couponType": .variable("couponType"),
          "discount": .variable("discount"),
          "startDate": .variable("startDate"),
          "endDate": .variable("endDate"),
          "description": .variable("description"),
          "userType": .variable("userType")
        ]),
      ] }

      var createcouponcode: Createcouponcode? { __data["Createcouponcode"] }

      /// Createcouponcode
      ///
      /// Parent Type: `Couponmanager`
      struct Createcouponcode: PTProAPI.SelectionSet {
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