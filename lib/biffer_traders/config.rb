module BifferTraders
  class Config
    def self.config
      @config ||= {token: ENV["BIFFER_TRADERS_TOKEN"]}
    end

    def self.[](key)
      config[key]
    end

    def self.[]=(key, val)
      config[key] = val
    end
  end
end