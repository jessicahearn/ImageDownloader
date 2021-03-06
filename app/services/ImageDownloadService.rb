class ImageDownloadService
  require 'open-uri'

  def initialize(input)
    @input = validate_input_file(input)
    @destination_path = File.join(File.dirname(__FILE__), '../assets/images/')
  end

  def download_and_save
    urls_for_download.each do |url|
      begin
        download(url) if url_is_valid(url)
      rescue URI::InvalidURIError
        puts 'Error: "' + url + '" is not a valid url'
      end
    end
  end

  private

    def validate_input_file(input)
      if File.extname(input)=='.txt'
        return input
      else
        raise "Invalid input - please provide a .txt file"
      end
    end

    def url_is_valid(url)
      URI::parse(url)
    end

    def urls_for_download
      urls = File.readlines(@input).map{ |line| line.chomp }
    end

    def filename(url)
      File.basename(url)
    end

    def download(url)
      open(@destination_path + filename(url), 'wb'){ |file| file << open(url).read }
    end
end