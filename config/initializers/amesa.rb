CONFIGS = HashWithIndifferentAccess.new(YAML.load_file("#{Rails.root}/config/amesa.yml")[Rails.env]).freeze
