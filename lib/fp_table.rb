require "action_view"
require "fp_table/version"

module FPTable
  autoload :TableBuilder, "fp_table/table_builder"
  autoload :TableHelper, "fp_table/table_helper"
end

ActiveSupport.on_load(:action_view) do
  include FPTable::TableHelper
end