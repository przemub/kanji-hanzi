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
  tmp_image = Image.new(100, 100) {
    self.format = 'PNG'
    self.background_color = "Transparent"
  }

  text = Draw.new
  text.annotate(tmp_image, 100, 100, 0, 0, character) {
    self.font = get_font language
    self.fill = 'white'
    self.stroke = 'transparent'
    self.pointsize = 90
    self.font_weight = BoldWeight
    self.gravity = CenterGravity
  }

  tmp_image
end

