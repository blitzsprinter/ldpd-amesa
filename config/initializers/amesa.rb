ADMINS = Array.new(YAML.load_file("#{Rails.root}/config/admins.yml")[Rails.env]).freeze
EMAILS = HashWithIndifferentAccess.new(YAML.load_file("#{Rails.root}/config/emails.yml")[Rails.env]).freeze
