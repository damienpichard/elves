#### elves/lib/String+Extension.rb ---                        -*- mode: ruby; -*-

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

class String
  def between(str1, str2)
    self[/#{Regexp.escape(str1)}(.*?)#{Regexp.escape(str2)}/m, 1]
  end

  def self.random(length)
    [('a'..'z'), (0..9)].map(&:to_a).flatten.shuffle[1, length].join
  end
end
