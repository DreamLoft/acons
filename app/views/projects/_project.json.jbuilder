json.extract! project, :id, :project_name, :number_of_buildings, :number_of_wings, :number_of_apartments, :created_at, :updated_at
json.url project_url(project, format: :json)
