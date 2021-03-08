Product.create!([
  { name: "bike", price: "350.0", description: "blue bike", quantity: nil },
  { name: "Pencil", price: "22.0", description: "a great pencil", quantity: nil },
  { name: "log", price: "20.0", description: "a plain log", quantity: nil },
])

Image.create({url: "https://assets.shopbmwusa.com/assets/images/highquality/frozenbluecruisebike_8344.jpg", product_id: 3}),
