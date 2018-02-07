json.extract! office_customer, :id, :name, :phone, :email, :date_of_enquiry, :from_where, :looking_for, :budget, :broker, :status, :comments, :source, :created_at, :updated_at
json.url office_customer_url(office_customer, format: :json)
