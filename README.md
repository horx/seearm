  #在APPFOG测试，改动的东西：
    1.将 gem 'jquery-rails' 更换为: gem 'cloudfoundry-jquery-rails';
    2.config/environments/production.rb 中 config.server_static_assets = false 改为 config.server_static_assets = true;
