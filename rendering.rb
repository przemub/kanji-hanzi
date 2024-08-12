require 'rubygems'
require 'bundler/setup'

require 'rmagick'
include Magick

def get_font(language)
  if language.eql? 'ja'
    'fonts/ipag.ttf'
  elsif language.eql? 'cn'
    'fonts/SourceHanSansCN-Normal.otf'
  else
    'fonts/SourceHanSansTW-Normal.otf'
  end
end

def draw_one_character(language, character)
  tmp_image = Image.new(100, 100) { |image|
    image.format = 'PNG'
    image.background_color = "Transparent"
  }

  text = Draw.new
  text.annotate(tmp_image, 100, 100, 0, 0, character) { |annotation|
    annotation.font = get_font language
    annotation.fill = 'white'
    annotation.stroke = 'transparent'
    annotation.pointsize = 90
    annotation.font_weight = BoldWeight
    annotation.gravity = CenterGravity
  }

  tmp_image
end

