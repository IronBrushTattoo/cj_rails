class SpreadsheetPdf < Prawn::Document

  def initialize(spreadsheet, view)
    super()
    @spreadsheet = spreadsheet
    file_path = "public/system/dragonfly/development"
    xls_file = get_labels("#{file_path}/#{@spreadsheet.file_uid}")
    @view = view

    make_labels(xls_file)

  end

  def desc_box(desc)
    formatted_text_box [
      {
        text: "#{desc}",
        color: "ffffff",
        styles: [:italic],
        size: 11
      }
    ], at: [$padding,$top], width: $text_width
  end

  def size_box(gauge,size)
    transparent(0.1) do
      stroke_rectangle [0, $box_height+$padding], $box_width, $box_height*0.75
    end

    transparent(0.6) do
      formatted_text_box [
        {
          text: "#{gauge} #{size}",
          color: "ffffff",
          size: 15,
          styles: [:normal],
          character_spacing: 0.5
        }
      ], at: [($box_width/2)-$padding,$mid], width: $text_width
    end

  end

  def id_box(id)
    formatted_text_box [
      {
        text: "#{id}",        
        color: "ffffff",
        align: :left
      }
    ], at: [$padding,$low], width: $text_width
  end

  def price_box(price)
    formatted_text_box [
      {
        text: "#{price}",
        color: "ffffff",
        align: :right,
        styles: [:italic]
      }
    ], at: [$box_width-($padding*3),$low], width: $text_width
  end
  
  def make_labels(file)
    
    define_grid(:columns => 4, :rows => 8, :row_gutter => 10, :column_gutter => 0)
    margin = 14
    
    count = 1
    row = 0
    column = 0

    start_new_page(:margin => margin)
    
    file.each do |label|
      
      grid(row, column).bounding_box do
        #stroke_axis

        fill_color "000000"
        stroke_color "ffffff"

        $box_width = 144
        $box_height = 81
        $padding = 12
        $text_width = 90
        $top = $box_height-$padding
        $mid = $top - 30
        $low = $mid - 20
        
        transparent(0.9) do
          fill_rectangle [0, $box_height], $box_width, $box_height
          
          font "Times-Roman", :size => 10

          desc_box(label.desc)
          size_box(label.gauge, label.size)
          id_box(label.id)
          price_box(label.price)
        end

      end

      if count%4 == 0
        row+=1
        column = 0
      else
        column+=1
      end

      if count%32 == 0
        start_new_page(:margin => margin)
        row = 0
        column = 0
      end
      
      count+=1
    end

  end

  def logo
    logopath = "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 197, :height => 197
  end

  def get_labels(file)

    labels = []
    
    xls_file = Roo::Spreadsheet.open(file, extension: :xlsx)

    xls_file.sheets.each do |sheet|

      sheet = xls_file.sheet(sheet)
      
      sheet.parse[0..-1].each do |row|

        zero,one,two,four,five,ten = nil_convert(row[0]),
        nil_convert(row[1]),
        nil_convert(row[2]),
        nil_convert(row[4]),
        nil_convert(row[5]),
        nil_convert(row[10])

        sizes = strip(five.to_s)
        gauge = "#{sizes[0]}g" unless sizes[0].nil?
        size = "#{sizes[1]}\"" unless sizes[1].nil?
        desc = two.gsub("&", "and")
        id = one.to_s.split(/-/)[0]
        price = "$#{four.to_s.split(".")[0]}"
        supply = five
        updated = Chronic.parse(ten).to_f

        label = Label.new(gauge,
                          size,
                          desc,
                          id,
                          price,
                          supply,
                          updated
                         )

        seconds = 60*60*24*@spreadsheet.days.to_f
        
        if (Time.now.to_f - updated.to_f) < seconds
          #puts label.id
          $labelID = label.id
          labels.push label
        end

      end
    end

    return labels

  end

  def nil_convert(c)
    if c.nil? 
      ""
    else
      c
    end
  end

  def strip(s)
    s.gsub(/"/, '').
      gsub(/g/, '').
      gsub(/G/, '').
      gsub(/,/, '').
      split(' ')
  end

end
