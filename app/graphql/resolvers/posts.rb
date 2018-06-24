class Resolvers::Posts < GraphQL::Function
  # arguments passed as "args"
  argument :title, types.String
  
  # return type from the mutation
  type Types::PostType
  
  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    ::Post.where("posts.title like ?", "%#{args[:title]}%")
  end
end
