Rails.application.routes.draw do

  scope :v1 do
    post '/words', to: 'words#create'
    get '/words/:word', to: 'words#show'
  end

end
