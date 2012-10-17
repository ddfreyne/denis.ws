# Make sure we're using nanoc 3.0 or higher
if Nanoc3::VERSION < '3.0'
  puts 'WARNING:'
  puts 'You need nanoc 3.0 or higher to compile this site. If you really ' +
       'want to compile this site with an older version of nanoc, set ' +
       'FORCE to true in your environment.'

  exit unless ENV['FORCE'] == 'true'
end

module StoneshipSite
  module Helpers
  end
end

# Returns the latest essay, article or review
def latest_item
  @items.select { |item| %w( article essay review ).include?(item[:kind]) }.
         sort_by { |item| Time.parse(item[:created_at]) }.last
end

# Returns the item with the given identifier.
def item_named(identifier)
  @items.find { |item| item.identifier == identifier }
end
