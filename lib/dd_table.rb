require "action_view"
require "dd_table/version"

module DDTable
  autoload :TableBuilder, "dd_table/table_builder"
  autoload :TableHelper, "dd_table/table_helper"
end

ActiveSupport.on_load(:action_view) do
  include DDTable::TableHelper
end