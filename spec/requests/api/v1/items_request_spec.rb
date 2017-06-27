require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    raw_item = items.first

    expect(items.count).to eq(3)
    expect(raw_item).to have_key("name")
    expect(raw_item).to have_key("description")
  end

  context "GET api/v1/items/:id" do
    it "can get one item by its id" do
      id = create(:item).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(id)
      expect(item).to have_key("name")
      expect(item["name"]).to be_a String
      expect(item).to have_key("description")
      expect(item["description"]).to be_a String
    end
  end

  context "POST /api/v1/items" do
    it "can create a new item with valid params" do
      item_params = {
        name: "Super Mario Bros. 3",
        description: "One of the best games ever."
      }

      expect {
        post "/api/v1/items", params: item_params
      }.to change {Item.count}.by(1)

      expect(response).to have_http_status(201)
    end
  end

end
