# frozen_string_literal: true

require_relative "test_helper"

class RenderingTest < Minitest::Test
  def test_get_font_japanese
    assert_equal "fonts/ipag.ttf", get_font("ja")
  end

  def test_get_font_simplified_chinese
    assert_equal "fonts/SourceHanSansCN-Normal.otf", get_font("cn")
  end

  def test_get_font_defaults_to_traditional_chinese
    assert_equal "fonts/SourceHanSansTW-Normal.otf", get_font("tw")
    assert_equal "fonts/SourceHanSansTW-Normal.otf", get_font("unknown")
  end

  def test_fonts_exist
    %w[ja cn tw].each do |language|
      assert File.exist?(get_font(language)), "missing font for #{language}"
    end
  end

  def test_draw_one_character_returns_image
    image = draw_one_character("ja", "返")

    assert_kind_of Magick::Image, image
    assert_equal 100, image.columns
    assert_equal 100, image.rows
    assert_equal "PNG", image.format
  end

  def test_draw_one_character_draws_something
    image = draw_one_character("ja", "返")
    blank = Magick::Image.new(100, 100) { |i| i.background_color = "Transparent" }

    refute_equal blank.signature, image.signature,
                 "expected the rendered character to differ from a blank canvas"
  end

  def test_different_languages_render_differently
    # 返 uses a different shinnyou radical in Japanese vs Simplified Chinese.
    japanese = draw_one_character("ja", "返")
    simplified = draw_one_character("cn", "返")

    refute_equal japanese.signature, simplified.signature
  end

  def test_image_to_blob_returns_base64_data_uri
    blob = image_to_blob(draw_one_character("ja", "返"))

    assert blob.start_with?("data:image/png;base64,")
    encoded = blob.delete_prefix("data:image/png;base64,")
    assert Base64.decode64(encoded).start_with?("\x89PNG".b)
  end
end
