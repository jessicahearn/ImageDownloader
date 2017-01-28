unless ARGV[0].nil?
  puts "Downloading images..." 

  require_relative 'app/services/ImageDownloadService'
  other_downloader = ImageDownloadService.new(ARGV[0])
  other_downloader.download_and_save

  puts "Download complete!"
else
	puts "Please provide a file of image urls."
end