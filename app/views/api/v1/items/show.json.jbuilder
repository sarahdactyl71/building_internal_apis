json.(@item, :id, :name, :description, :num_orders)
json.num_items(@item.orders.count)
json.orders @item.orders do |order|
  json.(order, :id)
end
