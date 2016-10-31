require "./i18n/*"
require "yaml"

class I18n
  @@load_path = "./"
  @@file = ""

  def self.load_path=(path)
    @@load_path = path
  end

  def self.locale=(label)
    @@file = "#{label}.yml"
    load_file
  end

  def self.load_file
    path = File.join([@@load_path, @@file])
    @@backend = YAML.parse(File.read(path))
  end

  def self.translate(key)
    temp = @@backend.not_nil!
    key.split('.').each do |k|
      temp = temp[k]
    end
    temp
  end

  def self.t(key)
    translate(key)
  end
end
