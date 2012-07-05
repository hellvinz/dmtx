require "dmtx/version"
require 'chunky_png'
require "dmtx/dmtxlib"

class NoText < StandardError;;end
class NoFile < StandardError;;end

class Dmtx
  attr_accessor :text, :height, :width, :file 

  def initialize
    @enc = DmtxLib.dmtxEncodeCreate()
    DmtxLib.dmtxEncodeSetProp(@enc, :DmtxPropPixelPacking, :DmtxPack24bppRGB)
    DmtxLib.dmtxEncodeSetProp(@enc, :DmtxPropSizeRequest, :DmtxSymbolSquareAuto)
  end

  def write
    raise NoText, "please provide a text to encode" unless text
    raise NoFile, "please provide an output file" unless file

    DmtxLib.dmtxEncodeDataMatrix(@enc, text.length, text)
    dmtx_encode = DmtxLib::DmtxEncode.new(@enc)
    computed_width = DmtxLib.dmtxImageGetProp(dmtx_encode[:image], :DmtxPropWidth)
    computed_height = DmtxLib.dmtxImageGetProp(dmtx_encode[:image], :DmtxPropHeight)

    dmtx_image = DmtxLib::DmtxImage.new(dmtx_encode[:image])

    image = ChunkyPNG::Image.from_rgb_stream(width, height, dmtx_image[:pxl].read_string_length(computed_height*computed_width*3))
    image.save(file, :fast_rgb)
  end
end
