json.extract! construction_payment, :id, :payee_name, :payee_account, :amount_paid, :payment_date, :payment_mode, :payemnt_category, :project_id, :payment_info, :created_at, :updated_at
json.url construction_payment_url(construction_payment, format: :json)
