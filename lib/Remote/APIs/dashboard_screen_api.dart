class DashboardScreenApi {
  static const String loadDataQuery = """
  query LoadDashBoardScreenData{
      store{
    
        deliveryTime
    }
  
  discountedProducts: products(options: {limit:6,discountFilter:true}) {
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    isAvailable
    discount
    price
  }
  
  popularProducts: products(options: {limit:6,popularFilter:true}) {
    id
    name
    isAvailable
    imageUrl
    quantity{
            totalQuantity
            type
            value
         }
    discount
    price
  }
    

    categories(limit:8){
    id
    name
    imageUrl
    }
  
  user{
        id
        userName
        pincode
        profileImageUrl
        location{
          lat
          lng
        }
        coupons{
          id
        }
        favourites{
          id
          name
          imageUrl
          quantity{
              totalQuantity
              type
              value
          }
          description
          isAvailable
          discount
          price
        }
        shippingAddresses{
          recipientName
          address
          pincode
          landmark
          type
        }
      }
  }
""";

static const String loadDataForGuestQuery = """
query LoadDashBoardScreenData{
      store{
    
        deliveryTime
    }
  
  discountedProducts: products(options: {limit:6,discountFilter:true}) {
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    isAvailable
    discount
    price
  }
  
  popularProducts: products(options: {limit:6,popularFilter:true}) {
    id
    name
    isAvailable
    imageUrl
    quantity{
            totalQuantity
            type
            value
         }
    discount
    price
  }
    

    categories(limit:8){
    id
    name
    imageUrl
    }
    }
""";

}


