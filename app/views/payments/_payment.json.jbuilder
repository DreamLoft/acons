json.extract! payment, :id, :booking_id, :amount_paid, :created_at, :updated_at
json.url payment_url(payment, format: :json)
