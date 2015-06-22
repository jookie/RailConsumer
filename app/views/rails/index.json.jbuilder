json.array!(@rails) do |rail|
  json.extract! rail, :id, :g, :scaffold, :product, :name, :length, :width, :height, :weight
  json.url rail_url(rail, format: :json)
end
