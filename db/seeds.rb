# Product.create!([
#   { name: "bike", price: "350.0", description: "blue bike", quantity: nil },
#   { name: "Pencil", price: "22.0", description: "a great pencil", quantity: nil },
#   { name: "log", price: "20.0", description: "a plain log", quantity: nil },
# ])

# Supplier.create(name: "Amazon", email: "amazon@email.com", phone_number: "243222342")

# Image.create({url: "https://assets.shopbmwusa.com/assets/images/highquality/frozenbluecruisebike_8344.jpg", product_id: 3}),

CartedProduct.create(:user_id => 1, :product_id => 2, :quantity => 3, :status => "carted", :order_id => nil)
