class App.Routes extends Spine.Stack
  controllers:
    root : App.Root
    
  routes:
    '/' : 'root'
    
  default: 'root'
  className: 'stack base'