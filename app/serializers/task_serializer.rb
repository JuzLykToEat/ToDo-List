class TaskSerializer < ActiveModel::Serializer
  attributes :description, :complete, :id

  belongs_to :user_id
end
