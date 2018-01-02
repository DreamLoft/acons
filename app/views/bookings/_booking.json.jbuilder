json.extract! booking, :id, :customer_name, :customer_email, :customer_mobile, :booking_date, :total_guests, :booking_status, :booked_from, :booked_till, :booking_amount, :created_at, :updated_at
json.url booking_url(booking, format: :json)
