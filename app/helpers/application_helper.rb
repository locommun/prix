module ApplicationHelper
  def bootstrap_notice_mapper(type)
    case type
    when :alert
      "warning"
    when :error
      "error"
    when :notice
      "success"
    else
    "info"
    end
  end
  
  # Glyph Icons Helpers 
  def glyphicons(name)
    "<i class=\"" + name + "\"></i>".html_safe
  end
  
  def glyphicons_inv(name)
    "<i class=\"" + name + " icon-white\"></i>".html_safe
  end
  
  # Usage in Template 
  # <%= qrcode "www.google.de" %>
  # <%= qrcode "www.google.de" , :size => 10, :level => :l %>
  # # string - the string you wish to encode 
  # size   - the size of the qrcode (default 4)
  # level  - the error correction level, can be:
  # * Level :l 7%  of code can be restored
  # * Level :m 15% of code can be restored
  # * Level :q 25% of code can be restored
  # * Level :h 30% of code can be restored (default :h) 
  def qrcode string, *args
    options = args.extract_options!
    level   = (options[:level] || :h).to_sym
    size  = options[:size] || 4
    qr = RQRCode::QRCode.new(string, :size => size, :level => level)
    render "qrcode" , :qr => qr
  end
end
