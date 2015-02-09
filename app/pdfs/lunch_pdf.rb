class LunchPdf < Prawn::Document
  def initialize(orders, total)
    super()
    @orders = orders
    @total_without_tax = total
    @tax = total * 0.07
    @total = total + @tax
    table_content
  end
 
  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table order_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
    move_down(20)
    text "Total without tax: $#{@total_without_tax.round(2)}"
    text "Tax 7%: $#{@tax.round(2)}"
    text "Total: $#{@total.round(2)}", size: 15, style: :bold
  end
 
  def order_rows
    [['User', 'Order', 'Price']] +
      @orders.map do |order|
        if !order.item.nil?  
         [order.user.name, order.item.name, order.item.price.round(2)]
         else
           [order.user.name,"",0.00] 
        end
      end 
  end
end