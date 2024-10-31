CONFIGS = HashWithIndifferentAccess.new(YAML.load_file("#{Rails.root}/config/amesa.yml", aliases: true)[Rails.env]).freeze
