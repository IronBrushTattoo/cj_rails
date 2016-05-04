class Spreadsheet < ActiveRecord::Base
  dragonfly_accessor :file  # defines a reader/writer for file
end
