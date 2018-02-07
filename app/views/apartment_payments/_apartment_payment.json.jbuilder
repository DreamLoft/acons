json.extract! apartment_payment, :id, :office_deal_id, :amount_paid, :payment_date, :created_at, :updated_at
json.url apartment_payment_url(apartment_payment, format: :json)
