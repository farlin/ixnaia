json.array!(@klasses) do |klass|
  json.extract! klass, :id, :name, :teacher_id, :student_id
  json.url klass_url(klass, format: :json)
end
