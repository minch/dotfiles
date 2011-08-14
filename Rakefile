desc "link files"
task :link_files do
  %w[ vimrc gvimrc janus.rake ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    else
      puts "file: #{dest} already exists, skipping..."
    end
  end
end
