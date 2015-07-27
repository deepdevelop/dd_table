module FPTable
  module TableHelper
    def table_for(model, collection, options={})
      builder = FPTable::TableBuilder.new(model, collection, options)
      with_output_buffer do
        yield builder
      end
      builder.render(self)
    end
  end
end