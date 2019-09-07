Rails.application.routes.draw do

  scope :v1 do
    get '/words/:word', to: 'words#show'
  end

end
