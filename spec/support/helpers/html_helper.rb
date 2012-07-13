class HtmlHelper
  def self.load(file_name)
    Nokogiri::HTML(File.open("../markup/#{file_name}.html", 'r'){|f| f.readlines.join("\n")})
  end

  def self.html_for(file_name, css_path)
    load(file_name).css(css_path).to_s.split(/\n/).inject do |result, line|
      (result || '') << line.lstrip
    end
  end
end