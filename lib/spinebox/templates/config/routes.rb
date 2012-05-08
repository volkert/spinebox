Spinebox.routes do |routes|
  
  # Assets
  map '/assets' do
    run Spinebox.assets
  end
  
  # Root
  map '/' do
    run Rack::File.new "public/index.html"
  end
  
end