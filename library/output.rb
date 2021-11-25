require 'json'

class Output
  def initialize(file_name)
    @file_name = file_name
  end

  def valid_json?
    JSON.parse(File.read(@file_name))
    true
  rescue JSON::ParserError => e
    raise "Unexpected response (#{e})"
  end

  def read
    JSON.parse(File.read(@file_name)) if valid_json?
  end
end
