class OrdersApi {
  static const String getAllOrdersList = """
query getOrders(\$userId:String!){
 userOrders(userId:\$userId){
cart{
    product{
        id
    },
    count
},
coupon{
    title
},
id,
orderNo
createdAt
status
transactionAmount
  }
}

""";
}
