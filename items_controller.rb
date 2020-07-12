class ItemsController
  def index(params)
    ['items']
  end

  def show(params)
    ["item: #{params}"]
  end
end
