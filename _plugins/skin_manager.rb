# frozen_string_literal: true

module SkinManager
  class << self
    attr_accessor :available_skins
  end

  Jekyll::Hooks.register :site, :post_read do |site|
    skins_dir = site.in_theme_dir("_sass", "minimal-mistakes", "skins")
    SkinManager.available_skins = Dir["#{skins_dir}/*.scss"].map { |i| File.basename(i, ".scss") }
  end

  Jekyll::Hooks.register [:pages, :documents], :pre_render do |doc, payload|
    payload["page"]["available_skins"] = SkinManager.available_skins
  end

  class SkinPage < Jekyll::PageWithoutAFile
    def initialize(site, skin_name)
      super(site, site.source, "assets/css", "#{skin_name}.scss")
    end
  end

  class StyleSheetGenerator < Jekyll::Generator
    def generate(site)
      SkinManager.available_skins.each do |skin_name|
        site.pages << SkinPage.new(site, skin_name).tap do |page|
          page.data["skin_name"] = skin_name
          page.content = <<~SCSS
          @import 
            "minimal-mistakes/skins/{{ page.skin_name }}",
            "minimal-mistakes";
          SCSS
        end
      end
    end
  end
end
