require "ffi"

module DmtxLib
  extend FFI::Library
  ffi_lib "dmtx"

  enum :DmtxPackOrder, [
    # Custom format
    :DmtxPackCustom, 100,
    # 1 bpp
    :DmtxPack1bppK, 200,
    # 8 bpp grayscale
    :DmtxPack8bppK, 300,
    # 16 bpp formats
    :DmtxPack16bppRGB, 400,
    :DmtxPack16bppRGBX,
    :DmtxPack16bppXRGB,
    :DmtxPack16bppBGR,
    :DmtxPack16bppBGRX,
    :DmtxPack16bppXBGR,
    :DmtxPack16bppYCbCr,
    # 24 bpp formats
    :DmtxPack24bppRGB, 500,
    :DmtxPack24bppBGR,
    :DmtxPack24bppYCbCr,
    # 32 bpp formats
    :DmtxPack32bppRGBX, 600,
    :DmtxPack32bppXRGB,
    :DmtxPack32bppBGRX,
    :DmtxPack32bppXBGR,
    :DmtxPack32bppCMYK
  ]

  enum :DmtxProperty, [
    # Encoding properties
    :DmtxPropScheme, 100,
    :DmtxPropSizeRequest,
    :DmtxPropMarginSize,
    :DmtxPropModuleSize,
    # Decoding properties
    :DmtxPropEdgeMin, 200,
    :DmtxPropEdgeMax,
    :DmtxPropScanGap,
    :DmtxPropSquareDevn,
    :DmtxPropSymbolSize,
    :DmtxPropEdgeThresh,
    # Image properties
    :DmtxPropWidth, 300,
    :DmtxPropHeight,
    :DmtxPropPixelPacking,
    :DmtxPropBitsPerPixel,
    :DmtxPropBytesPerPixel,
    :DmtxPropRowPadBytes,
    :DmtxPropRowSizeBytes,
    :DmtxPropImageFlip,
    :DmtxPropChannelCount,
    # Image modifiers
    :DmtxPropXmin, 400,
    :DmtxPropXmax,
    :DmtxPropYmin,
    :DmtxPropYmax,
    :DmtxPropScale
  ]

  enum :DmtxSymbolSize, [
    :DmtxSymbolRectAuto,-3,
    :DmtxSymbolSquareAuto,-2,
    :DmtxSymbolShapeAuto,-1,
    :DmtxSymbol10x10,0,
    :DmtxSymbol12x12,
    :DmtxSymbol14x14,
    :DmtxSymbol16x16,
    :DmtxSymbol18x18,
    :DmtxSymbol20x20,
    :DmtxSymbol22x22,
    :DmtxSymbol24x24,
    :DmtxSymbol26x26,
    :DmtxSymbol32x32,
    :DmtxSymbol36x36,
    :DmtxSymbol40x40,
    :DmtxSymbol44x44,
    :DmtxSymbol48x48,
    :DmtxSymbol52x52,
    :DmtxSymbol64x64,
    :DmtxSymbol72x72,
    :DmtxSymbol80x80,
    :DmtxSymbol88x88,
    :DmtxSymbol96x96,
    :DmtxSymbol104x104,
    :DmtxSymbol120x120,
    :DmtxSymbol132x132,
    :DmtxSymbol144x144,
    :DmtxSymbol8x18,
    :DmtxSymbol8x32,
    :DmtxSymbol12x26,
    :DmtxSymbol12x36,
    :DmtxSymbol16x36,
    :DmtxSymbol16x48
  ]

  class DmtxEncode < FFI::Struct
    layout :method, :int,
           :scheme, :int,
           :sizeIdxRequest, :int,
           :marginSize, :int,
           :moduleSize, :int,
           :pixelPacking, :int,
           :imageFlip, :int,
           :rowPadBytes, :int,
           :message, :pointer,
           :image, :pointer
  end

  class DmtxImage < FFI::Struct
    layout :width, :int,
           :height, :int,
           :pixelPacking, :int,
           :bitsPerPixel, :int,
           :bytesPerPixel, :int,
           :rowPadBytes, :int,
           :rowSizeBytes, :int,
           :imageFlip, :int,
           :channelCount, :int,
           :channelStart, [:int, 4],
           :bitsPerChannel, [:int, 4],
           :pxl, :pointer
  end

  attach_function :dmtxEncodeCreate, [], :pointer
  attach_function :dmtxEncodeDataMatrix, [:pointer, :int, :string], :uint
  attach_function :dmtxImageGetProp, [:pointer, :int], :uint
  attach_function :dmtxEncodeSetProp, [:pointer, :int, :int], :uint
end
