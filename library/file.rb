require 'fileutils'

class CreateFile
  def initialize(file_name)
    FileUtils.touch(file_name) unless already_created? file_name
  end

  def already_created?(file)
    File.exist?(file)
  end
end
