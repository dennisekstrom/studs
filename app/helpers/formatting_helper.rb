module FormattingHelper
  def paragraphize(string)
    # Trim whitespace
    string = string.gsub(/\A\s+|\s+\Z/, '').gsub(/\r\n?/, "\n")
    ('<p>' + string.split(/\n{2,}/).join('</p><p>') + '</p>').html_safe
  end

  def markdown(string)
    @markdown_renderer ||= Redcarpet::Markdown.new(
      Redcarpet::Render::XHTML.new(
        hard_wrap: true,
        safe_links_only: true,
        no_images: true,
        filter_html: true
      ),
      tables: false,
      fenced_code_blocks: false,
      autolink: true,
      strikethrough: true,
      superscript: true
    )

    @markdown_renderer.render(string).html_safe
  end
end
