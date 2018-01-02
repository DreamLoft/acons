json.extract! log, :id, :guest_id, :check_in_time, :check_out_time, :booking_id, :created_at, :updated_at
json.url log_url(log, format: :json)
