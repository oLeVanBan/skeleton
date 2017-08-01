server "xxxx", user: "ubuntu", roles: %w(app web db)
set :bundle_without, %w(test production).join(" ")
set :nginx_server_name, "skeleton"
