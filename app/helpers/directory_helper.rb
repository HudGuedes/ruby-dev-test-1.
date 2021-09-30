module DirectoryHelper

  def childrens(directory)
    @html = "<i class='fa fa-folder-o'></i> #{directory.title} <br/>"
    recursive_childrens(directory)
    @html.html_safe
  end

  private

  def recursive_childrens(directory, spaces = '')
    spaces += "&nbsp; &nbsp; &nbsp; &nbsp;"
    if directory.has_childrens?
      directory.get_childrens.each do |dir|
        @html += "#{spaces} <i class='fa fa-folder-o'></i> #{dir.title} <br/>"
        recursive_childrens(dir, spaces)
      end
    end
    get_files(directory, spaces)
  end

  def get_files(directory, spaces)
    if directory.archives.present?
        directory.archives.order(:title).each do |archive|
          @html += "#{spaces} <i class='fa fa-file-o'></i> #{archive.title} <br/>"
        end
      end
  end
end
