require "./spec_helper"

describe I18n do
  I18n.load_path = File.join({__DIR__, "./fixtures"})

  it "should load english simple case" do
    I18n.locale = :en
    I18n.translate("hello").should eq("hello")
  end

  it "should load english nested case" do
    I18n.locale = :en
    I18n.translate("home.message").should eq("hello, world!")
  end

  it "should load portuguese simple case" do
    I18n.locale = :"pt-BR"
    I18n.translate("hello").should eq("oi")
  end

  it "should load portuguese nested case" do
    I18n.locale = :"pt-BR"
    I18n.translate("home.message").should eq("olá, mundo!")
  end
end
