require "date"

module Jekyll
  module FuzzyDateFilter
    def fuzzy_date(post_date)
      if post_date.day <= 10
        str = "Early %B %Y"
      elsif post_date.day <= 20
        str = "Mid %B %Y"
      else
        str = "Late %B %Y"
      end

      post_date.strftime(str)
    end
  end
end

Liquid::Template.register_filter(Jekyll::FuzzyDateFilter)
