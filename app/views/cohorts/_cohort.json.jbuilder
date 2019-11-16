json.extract! cohort, :id, :title, :slack, :description, :picture_url, :status, :program, :is_archived, :start_date, :created_at, :updated_at
json.url cohort_url(cohort, format: :json)
