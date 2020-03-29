require "digest"

module Checksum

  def Checksum.Md5(file)
    return Digest::MD5.hexdigest(File.read(file))
  end

  def Checksum.Sha1(file)
    return Digest::SHA1.hexdigest(File.read(file))
  end

  def Checksum.Sha256(file)
    return Digest::SHA256.hexdigest(File.read(file))
  end
  
  def Checksum.Sha512(file)
    return Digest::SHA512.hexdigest(File.read(file))
  end

end