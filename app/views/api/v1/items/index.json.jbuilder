json.(@items) do |item|
  json.(order, :id, :name, :description, :num_orders)
  json.num_orders(item.orders.count)
end
