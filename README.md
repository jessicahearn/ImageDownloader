# Image Download Script
Author: Jessica Hearn

## Project Setup
The script itself can be run without any setup, but in order to run the tests included in this mini-project, you'll need to install rspec. To do that, run this command from the root directory:

`gem install rspec`

## Usage
The Image Download Script can be run from the command line, and requires one argument. This argument must be the path to a plaintext file with a list of image urls in it, one per line. Two example files are included in the "public" directory of this mini-project. To download the images listed in the file "input_file.rb," run this command from the root directory:

`ruby image_download_script.rb 'public/input_file.txt'`

Downloaded images can be found in the 'app/assets/images' directory.