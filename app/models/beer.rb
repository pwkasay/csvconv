class Beer < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, :encoding => 'windows-1251:utf-8', headers: true, header_converters: lambda{ |h| h.gsub(' ','_') }) do |row|
      Beer.create! row.to_hash
    end
  end
end
