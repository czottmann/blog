require "date"

module Jekyll
  module TagLinksFilter
    def tag_links(tags)
      list = []
      l = tags.size.pred

      tags.each_with_index do |tag, i|
        if l > 0
          if i > 0 && i % l == 0
            list << " and "
          elsif i > 0
            list << ", "
          end
        end

        list << "<a href='/tag/#{tag}/' class='tag'>#{tag}</a>"
      end

      list.join("")
    end
  end
end

Liquid::Template.register_filter(Jekyll::TagLinksFilter)
