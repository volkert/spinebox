Spinebox::Routes.draw do
  
  # Assets
  map '/assets' do
    run Spinebox.assets
  end
  
  # Views
  map '/' do
    run Spinebox.views
  end
  
end