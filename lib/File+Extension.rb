#### elves/lib/File+Extension.rb ---                          -*- mode: ruby; -*-

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

class File
  def self.exclude?(file)
    File.directory?(file) || file.match?(/^\..*/)
  end

  def self.find(dir, exts:)
    files = []

    Dir.foreach(dir).sort.each do |file|
      next if     File.exclude?(file)
      next unless exts.include?(File.extname(file.downcase))

      files << file
    end

    files
  end

  def self.stem(file)
    File.basename(file, File.extname(file))
  end

  # https://stackoverflow.com/a/5471032
  def self.which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each do |ext|
        exe = File.join(path, "#{cmd}#{ext}")
        return exe if File.executable?(exe) && !File.directory?(exe)
      end
    end
  end
end
