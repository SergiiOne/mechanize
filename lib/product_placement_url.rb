class ProductPlacementUrl
  
  def handle
    result = File.new("/Users/john/workspaces/mechanize_test/result.txt", 'a')
    file   = File.open("/Users/john/workspaces/mechanize_test/product_placements_urls.txt")

    file.each_line do |line|
      a = line.chomp.match(/([a-z0-9][a-z0-9\-]*?\.(?:com|cn|net|org|gov|info|la|cc|co|nl|ge|de|hu|es|tv)(?:\.(?:cn|jp|uk|nz))?)/)
      result.puts a[0] unless a.nil?
    end
  end
  
end

ProductPlacementUrl.new.handle
