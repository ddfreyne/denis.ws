require 'nokogumbo'

Nanoc::Check.define(:dashes) do
  @output_filenames.each do |filename|
    next unless filename =~ /html$/
    doc = Nokogiri::HTML(File.read(filename))
    doc.css('.subtitle').each do |subtitle|
      if subtitle.text =~ / - /
        add_issue('wrong dash detected (use en dash)', subject: filename)
      end
    end
  end
end