Spinebox.config do |config|
  
  # Setup assets paths
  config.assets.append_path 'app/assets/javascripts'
  config.assets.append_path 'app/assets/stylesheets'
  config.assets.append_path 'app/assets/images'
  
  # Setup views paths
  config.views.append_path 'app/views'
  
  # Concatenate assets or serve them seperately?
  config.concatenate = false
  
end