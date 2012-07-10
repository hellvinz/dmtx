require "dmtx/version"
require "chunky_png"
require "dmtx/dmtxlib"

class Dmtx
  NoText = Class.new StandardError
  NoFile = Class.new StandardError

  attr_accessor :text, :file

  def initialize(text = nil)
    @text = text
  end

  def write
    raise NoText, "please provide a text to encode" unless text
    raise NoFile, "please provide an output file" unless file
    chunky_png_image.save(file, :fast_rgb)
  end

private

  def chunky_png_image
    encoder = DmtxLib.dmtxEncodeCreate()
    DmtxLib.dmtxEncodeSetProp(encoder, :DmtxPropPixelPacking, :DmtxPack24bppRGB)
    DmtxLib.dmtxEncodeSetProp(encoder, :DmtxPropSizeRequest, :DmtxSymbolSquareAuto)

    DmtxLib.dmtxEncodeDataMatrix(encoder, text.length, text)
    dmtx_encode = DmtxLib::DmtxEncode.new(encoder)
    computed_width = DmtxLib.dmtxImageGetProp(dmtx_encode[:image], :DmtxPropWidth)
    computed_height = DmtxLib.dmtxImageGetProp(dmtx_encode[:image], :DmtxPropHeight)

    dmtx_image = DmtxLib::DmtxImage.new(dmtx_encode[:image])

    ChunkyPNG::Image.from_rgb_stream(computed_width, computed_height, dmtx_image[:pxl].read_string_length(computed_height*computed_width*3))
  end

end
