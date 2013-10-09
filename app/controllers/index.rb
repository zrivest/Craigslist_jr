get '/' do
  @category = params[:category]
  @post = params[:post]
  erb :index
end

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  this_post = Post.create(params[:newpost])
  redirect("/edit?key=#{this_post.edit_url}")
end

get '/edit' do
  @key = params[:key]
  @post = Post.where('edit_url=?', @key)[0]
  erb :edit_post
end

post '/edit' do
  post = Post.find(params[:post_id])
  if params[:delete]
    post.destroy
  end
  if params[:editpost]
    params[:editpost].each do |key, value|
      if value == ""
        next
      else
        key = key.to_s+"="
        key = key.to_sym
        post.send key, value
      end
    end
    post.save
    @post = post.id
  end
  erb :index
end
