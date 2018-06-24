class Types::PostType < Types::BaseObject
  field :id, ID
  field :title, String, null: true
  field :rating, Integer, null: true
end
