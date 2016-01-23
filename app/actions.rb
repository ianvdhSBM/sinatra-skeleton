# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end 

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  @user = @message.author
  @messages_from_user = Message.where(author: @message.author).where.not(id: @message.id)
  erb :'messages/show'
end

post '/messages' do
  @message = Message.new(
    content: params[:content],
    author: params[:author],
    url: params[:url],
    created_at: params[:created_at],
    updated_at: params[:updated_at]
    )
  if @message.save
    redirect '/messages'
  else
    erb :'/messages/new'
  end
end

