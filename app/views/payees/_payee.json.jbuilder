json.extract! payee, :id, :payee_category_id, :payee_name, :payee_account, :created_at, :updated_at
json.url payee_url(payee, format: :json)
