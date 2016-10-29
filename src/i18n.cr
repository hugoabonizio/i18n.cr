require "./i18n/*"
require "yaml"

class I18n
  @@load_path = "./"
  @@file = ""
  @@loaded = false

  def self.load_path=(path)
    @@load_path = path
  end

  def self.locale=(label)
    @@file = "#{label}.yml"
    @@loaded = false
  end

  def self.load_file
    unless @@loaded
      path = File.join([@@load_path, @@file])
      @@backend = YAML.parse(File.read(path))
    end
  end

  def self.translate(key)
    load_file unless @@loaded

    temp = @@backend.not_nil!
    key.split('.').each do |k|
      temp = temp[k]
    end
    temp
  end
end
