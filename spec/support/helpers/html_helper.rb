class HtmlHelper
  def self.load(file_name)
    Nokogiri::HTML(File.open("../markup/#{file_name}.html", 'r'){|f| f.readlines.join("\n")})
  end

  def self.html_for(file_name, css_path)
    html = load(file_name).css(css_path).to_s.gsub(/\n/, '')
    while html.index('  ')
      html.gsub!('  ', ' ')
    end
    html.gsub('> ', '>')
  end
end