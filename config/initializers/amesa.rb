ADMINS = Array.new(YAML.load_file("#{Rails.root}/config/admins.yml")[Rails.env]).freeze
