#### elves/lib/Cli.rb ---                                     -*- mode: ruby; -*-

## Copyright (C) 2024  damienpichard

## Author: damienpichard <damienpichard@tutanota.de>

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

### Code:

require_relative 'File+Extension'
require_relative 'String+Extension'

module Elves
  class Cli
    def initialize
      @program_name  = File.stem($PROGRAM_NAME)
      @tmp_directory = File.expand_path("/tmp/#{@program_name}_#{String.random(8)}")
    end

    def mktmp
      Dir.mkdir(@tmp_directory)
    end

    def finalize(delete)
      FileUtils.rm_r(@tmp_directory) if delete
    end
  end
end
