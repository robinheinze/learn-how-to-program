LearnHowToProgram::Application.routes.draw do
	match('/', {:via => :get, :to => 'lessons#index'})
  match('lessons', {:via => :get, :to => 'lessons#index'})
  match('lessons/new', {:via => :get, :to => 'lessons#new'})
  match('lessons', {:via => :post, :to => 'lessons#create'})
  match('lessons/:id/edit', {:via => :get, :to => 'lessons#edit'})
  match('lessons/:id', {:via => :get, :to => 'lessons#show'})
  match('lessons/:id', {:via => [:patch, :put], :to => 'lessons#update'})
  match('lessons/:id', {:via => :delete, :to => 'lessons#destroy'})
end
