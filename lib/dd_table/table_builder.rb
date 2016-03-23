module DDTable
  class TableBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::RecordTagHelper

    attr_accessor :output_buffer

    def initialize(model, collection, options={}, &block)
      @model = model
      @collection = collection
      @options = {
        table_class: 'table table-stripped',
        nodata_content: '暂无数据',
        nodata_class: 'nodata',
      }.merge(options)
      @columns = []
    end

    def column(field, options={}, &block)
      @columns << {
        field: field,
        options: options,
        block: block
      }
    end

    def render(context)
      @context = context
      content_tag :table, class: @options[:table_class] do
        concat render_thead
        concat render_tbody
      end
    end

    private

    def render_column(col)
      if @current_record.instance_of?(@model)
        content_tag :td, td_content(col[:field], &(col[:block])), col[:options]
      elsif @current_record == @model
        content_tag :th, @model.human_attribute_name(col[:field])
      end
    end

    def render_thead
      @current_record = @model
      content_tag :thead do
        content_tag :tr do
          @columns.each do |col|
            concat render_column(col)
          end
        end
      end
    end

    def render_tbody
      content_tag :tbody do
        concat render_nodata if @collection.empty?
        @collection.each do |record|
          @current_record = record
          concat render_body_row
        end
      end
    end

    def render_body_row
      content_tag_for :tr, @current_record do
        @columns.each do |col|
          concat render_column(col)
        end
      end
    end

    def render_nodata
      content_tag :tr, :class => @options[:nodata_class] do
        content_tag :td, @options[:nodata_content],
                    :colspan => @columns.count
      end
    end

    def td_content(field, &block)
      if block_given?
        @context.capture(@current_record, &block)
      else
        @current_record.send(field)
      end
    end
  end
end