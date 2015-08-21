def delete_files(directory)
	Dir.foreach(directory) do |item|
		if %w(.jpg .png .gif .jpeg).include? File.extname(item)
			puts "deleting file #{item}"
			File.delete(item)
		end
	end
end