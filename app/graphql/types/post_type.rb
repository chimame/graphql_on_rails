class Types::PostType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: true
  field :rating, Integer, null: true
end
