def self.search(search)
  return Product.all unless search
  Product.where(['name LIKE ?', "%#{search}%"])
end