json.array!(@product_listings) do |product_listing|
  json.extract! product_listing, :id
  json.url product_listing_url(product_listing, format: :json)
end
