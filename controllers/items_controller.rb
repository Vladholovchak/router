# frozen_string_literal: true

class ItemsController < BasicController
  def index(params)
    @items = Model.new
    @items.name = %w(item_1 item_2 item_3)
    render('items', @items)
  end

  def show(params)
    "items: #{params}"
  end
end
