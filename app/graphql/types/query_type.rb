class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, null: false,
    description: "An example field added by the generator"
  def test_field
    "Hello World!"
  end

  field :posts, [Types::PostType], function: Resolvers::Posts.new
  field :search_posts, Types::SearchPostsType, function: Resolvers::SearchPosts.new
end
