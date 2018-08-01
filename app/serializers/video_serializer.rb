class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :position
end
