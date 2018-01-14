json.extract! room_service, :id, :stock_item_id, :booking_id, :room_id, :created_at, :updated_at
json.url room_service_url(room_service, format: :json)
