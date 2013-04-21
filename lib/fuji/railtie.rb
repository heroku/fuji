class Fuji
  class Railtie < Rails::Railtie

    config.fuji_options = {}

    config.after_initialize do |app|
      Fuji.options = app.config.fuji_options
    end

  end
end