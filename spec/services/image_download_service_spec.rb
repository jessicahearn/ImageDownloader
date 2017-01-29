require_relative '../../app/services/ImageDownloadService'

describe ImageDownloadService do
	describe "initialize" do
    it "requires input" do
      expect{ImageDownloadService.new}.to raise_error(ArgumentError)
    end

    it "requires input to be .txt file" do
      expect{ImageDownloadService.new(1234)}.to raise_error(TypeError)
      expect{ImageDownloadService.new({foo: 'bar', baz: 'foo'})}.to raise_error(TypeError)
      expect{ImageDownloadService.new('public/bad_file.doc')}.to raise_error(RuntimeError)
    end
  end

  describe "download_and_save" do
    it "downloads a file for a valid url" do
      downloader = ImageDownloadService.new('spec/fixtures/files/valid_input_urls.txt')
      allow(downloader).to receive(:open).with(downloader.instance_variable_get(:@destination_path) + 'fixture.jpg', 'wb')
      downloader.download_and_save
    end

    it "skips invalid urls" do
      downloader = ImageDownloadService.new('spec/fixtures/files/invalid_input_urls.txt' )
      expect{downloader.download_and_save}.to_not raise_error
    end
  end
end