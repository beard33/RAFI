require 'gtk3'
require_relative 'Checksum.rb'

module Application

  include Checksum

  GREEN = Gdk::RGBA::new(0, 1.0, 0, 1)
  RED = Gdk::RGBA::new(1, 0, 0, 1)
  WHITE = Gdk::RGBA::new(1, 1, 1, 1)
  GREY = Gdk::RGBA::new(0.6, 0.6, 0.6,1)


  def Application.control_status(file, type, entry, comparison='')
    case type
    when 'sha1'
      hash = Checksum.Sha1(file)
    when 'sha256'
      hash = Checksum.Sha256(file)
    when 'sha512'
      hash = Checksum.Sha512(file)
    else
      hash = Checksum.Md5(file)      
    end

    entry.override_color(:normal, WHITE)
    entry.set_text(hash)
    unless comparison.eql?('')
      if hash == comparison
        entry.override_color(:normal, GREEN)
      else
        entry.override_color(:normal, RED)
      end
    end

  end

end

