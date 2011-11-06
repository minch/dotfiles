desc "link files"
task :link_files do
  %w[ zshrc ackrc vimrc.local gvimrc.local janus.rake irbrc pryrc railsrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      puts "linking: #{file} -> #{dest}"
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    else
      puts "skipping:  #{dest} as it already exists..."
    end
  end
end

task :default => :link_files
