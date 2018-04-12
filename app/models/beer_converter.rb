class BeerConverter

  def self.convert(file:)
    catalogue = Hash.new

    #change it to take account of the tax rate in a new file please


    uk = ["UK", "uk", "United Kingdom", "engerland", "GB", "Uk", "U.K.", "England", "united kingdom", "england"]
    exception_cities = ["Saint Denis"]

    reader = CSV.read(file.path, encoding: "ISO8859-1")
    reader.each_with_index do |row, i|
      unless row.blank?

        #row_labels
        item_name = row[3]
        item_quantity = row[6]
        price_d = row[9]
        price_i = row[7]
        country = row[31]
        zip_code = row[32]
        order_id = row[0]
        tax_rate = row[10]

        unless i == 0
          unless item_name.blank?
            if catalogue[(item_name.match /.*%/).to_s].blank?
              catalogue[(item_name.match /.*%/).to_s] = {
                info: {
                  abv: (item_name.match /\d+.\d+%|\d%/).to_s
                },
                totals: {
                  quantity: BigDecimal.new(item_quantity),
                  cost: BigDecimal.new(price_d),
                  export: (BigDecimal.new(item_quantity) if !uk.include? country).to_f,
                  uk: (BigDecimal.new(item_quantity) if uk.include? country).to_f,
                  x330ml: (BigDecimal.new(item_quantity) if item_name.include? "[24x330ml]").to_f,
                  x750ml: (BigDecimal.new(item_quantity) if item_name.include? "[12x750ml]").to_f,
                  x500ml: (BigDecimal.new(item_quantity) if item_name.include? "[12x500ml]").to_f,
                  k30L: (BigDecimal.new(item_quantity) if item_name.include? "30L").to_f,
                  k20L: (BigDecimal.new(item_quantity) if item_name.include? "20L").to_f,
                  exportx330ml: (BigDecimal.new(item_quantity) if ((item_name.include? "[24x330ml]") && ((!uk.include? country) && (!country.blank?)))).to_f,
                  exportx750ml: (BigDecimal.new(item_quantity) if ((item_name.include? "[12x750ml]") && ((!uk.include? country) && (!country.blank?)))).to_f,
                  exportx500ml: (BigDecimal.new(item_quantity) if ((item_name.include? "[12x500ml]") && ((!uk.include? country) && (!country.blank?)))).to_f,
                  exportk30L: (BigDecimal.new(item_quantity) if ((item_name.include? "30L") && ((!uk.include? country) && (!country.blank?)))).to_f,
                  exportk20L: (BigDecimal.new(item_quantity) if ((item_name.include? "20L") && ((!uk.include? country) && (!country.blank?)))).to_f,
                  ukx330ml: (BigDecimal.new(item_quantity) if ((item_name.include? "[24x330ml]") && ((uk.include? country) || (country.blank?)))).to_f,
                  ukx750ml: (BigDecimal.new(item_quantity) if ((item_name.include? "[12x750ml]") && (uk.include? country || country.blank?))).to_f,
                  ukx500ml: (BigDecimal.new(item_quantity) if ((item_name.include? "[12x500ml]") && (uk.include? country || country.blank?))).to_f,
                  ukk30L: (BigDecimal.new(item_quantity) if ((item_name.include? "30L") && ((uk.include? country) || country.blank?))).to_f,
                  ukk20L: (BigDecimal.new(item_quantity) if ((item_name.include? "20L") && (uk.include? country || country.blank?))).to_f
                },
                orders: [
                  {
                    id: order_id,
                    item_price: BigDecimal.new(price_i),
                    discounted_price: BigDecimal.new(price_d),
                    item_tax_rate: tax_rate,
                    address_country: country,
                    address_code: zip_code,
                    x330ml: (BigDecimal.new(item_quantity) if item_name.include? "[24x330ml]"),
                    x750ml: (BigDecimal.new(item_quantity) if item_name.include? "[12x750ml]"),
                    x500ml: (BigDecimal.new(item_quantity) if item_name.include? "[12x500ml]"),
                    k30L: (BigDecimal.new(item_quantity) if item_name.include? "30L"),
                    k20L: (BigDecimal.new(item_quantity) if item_name.include? "20L")
                  }
                ]
              }
            else
              catalogue[(item_name.match /.*%/).to_s][:orders].push(
                {
                  id: order_id,
                  item_price: BigDecimal.new(price_i),
                  discounted_price: BigDecimal.new(price_d),
                  item_tax_rate: tax_rate,
                  address_country: country,
                  address_code: zip_code,
                  x330ml: (BigDecimal.new(item_quantity) if item_name.include? "[24x330ml]"),
                  x750ml: (BigDecimal.new(item_quantity) if item_name.include? "[12x750ml]"),
                  x500ml: (BigDecimal.new(item_quantity) if item_name.include? "[12x500ml]"),
                  k30L: (BigDecimal.new(item_quantity) if item_name.include? "30L"),
                  k20L: (BigDecimal.new(item_quantity) if item_name.include? "20L")
                }
              )
              catalogue[(item_name.match /.*%/).to_s][:totals][:quantity] += BigDecimal.new(item_quantity)
              catalogue[(item_name.match /.*%/).to_s][:totals][:cost] += BigDecimal.new(price_d)
              catalogue[(item_name.match /.*%/).to_s][:totals][:export] += (BigDecimal.new(item_quantity) if !uk.include? country).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:uk] += (BigDecimal.new(item_quantity) if uk.include? country).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:x330ml] += (BigDecimal.new(item_quantity) if item_name.include? "[24x330ml]").to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:x750ml] += (BigDecimal.new(item_quantity) if item_name.include? "[12x750ml]").to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:x500ml] += (BigDecimal.new(item_quantity) if item_name.include? "[12x500ml]").to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:k30L] += (BigDecimal.new(item_quantity) if item_name.include? "30L").to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:k20L] += (BigDecimal.new(item_quantity) if item_name.include? "20L").to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:exportx330ml] += (BigDecimal.new(item_quantity) if ((item_name.include? "[24x330ml]") && ((!uk.include? country) && (!country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:exportx750ml] += (BigDecimal.new(item_quantity) if ((item_name.include? "[12x750ml]") && ((!uk.include? country) && (!country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:exportx500ml] += (BigDecimal.new(item_quantity) if ((item_name.include? "[12x500ml]") && ((!uk.include? country) && (!country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:exportk30L] += (BigDecimal.new(item_quantity) if ((item_name.include? "30L") && ((!uk.include? country) && (!country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:exportk20L] += (BigDecimal.new(item_quantity) if ((item_name.include? "20L") && ((!uk.include? country) && (!country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:ukx330ml] += (BigDecimal.new(item_quantity) if ((item_name.include? "[24x330ml]") && ((uk.include? country) || (country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:ukx750ml] += (BigDecimal.new(item_quantity) if ((item_name.include? "[12x750ml]") && ((uk.include? country) || (country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:ukx500ml] += (BigDecimal.new(item_quantity) if ((item_name.include? "[12x500ml]") && ((uk.include? country) || (country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:ukk30L] += (BigDecimal.new(item_quantity) if ((item_name.include? "30L") && ((uk.include? country) || (country.blank?)))).to_f
              catalogue[(item_name.match /.*%/).to_s][:totals][:ukk20L] += (BigDecimal.new(item_quantity) if ((item_name.include? "20L") && ((uk.include? country) || (country.blank?)))).to_f
            end
          end
        end
      end
    end; puts ""

    headers = ["Product Name","% ABV","Quantity","","Export","24 x 330ml","12 x 750ml","12 x 500ml","30L Keg","20L Keg","","UK","24 x 330ml","12 x 750ml", "12 x 500", "30L Keg","20L Keg","","Export HL","Export HL%","UK Duty HL","UK Duty HL%","LSBD","HSBD"]

    CSV.generate(write_headers: true, headers: headers) do |csv|
      catalogue.each do |beer, stats|
        csv << [
          beer,
          stats[:info][:abv],
          stats[:totals][:quantity],
          "",
          "",
          stats[:totals][:exportx330ml],
          stats[:totals][:exportx750ml],
          stats[:totals][:exportx500ml],
          stats[:totals][:exportk30L],
          stats[:totals][:exportk20L],
          "",
          "",
          stats[:totals][:ukx330ml],
          stats[:totals][:ukx750ml],
          stats[:totals][:ukx500ml],
          stats[:totals][:ukk30L],
          stats[:totals][:ukk20L],
          "",
          ((((stats[:totals][:exportx330ml].to_f)*0.0792)+((stats[:totals][:exportx750ml].to_f)*0.09)+((stats[:totals][:exportx500ml].to_f)*0.06)+((stats[:totals][:exportk30L].to_f)*0.29)+((stats[:totals][:exportk20L].to_f)*0.19)).to_f).round(2),
          (((((stats[:totals][:exportx330ml].to_f)*0.0792)+((stats[:totals][:exportx750ml].to_f)*0.09)+((stats[:totals][:exportx500ml].to_f)*0.06)+((stats[:totals][:exportk30L].to_f)*0.29)+((stats[:totals][:exportk20L].to_f)*0.19))*((stats[:info][:abv]).to_f)).to_f).round(2),
          ((((stats[:totals][:ukx330ml].to_f)*0.0792)+((stats[:totals][:ukx750ml].to_f)*0.09)+((stats[:totals][:ukx500ml].to_f)*0.06)+((stats[:totals][:ukk30L].to_f)*0.29)+((stats[:totals][:ukk20L].to_f)*0.19)).to_f).round(2),
          ((((stats[:totals][:ukx330ml].to_f)*0.0792)+((stats[:totals][:ukx750ml].to_f)*0.09)+((stats[:totals][:ukx500ml].to_f)*0.06)+((stats[:totals][:ukk30L].to_f)*0.29)+((stats[:totals][:ukk20L].to_f)*0.19))*((stats[:info][:abv]).to_f).to_f).round(2),
          ((((stats[:totals][:ukx330ml].to_f)*0.0792)+((stats[:totals][:ukx750ml].to_f)*0.09)+((stats[:totals][:ukx500ml].to_f)*0.06)+((stats[:totals][:ukk30L].to_f)*0.29)+((stats[:totals][:ukk20L].to_f)*0.19))*((stats[:info][:abv]).to_f)*(9.54.to_f)).round(2),
          if stats[:info][:abv].to_f > 7.4
            (((((stats[:totals][:ukx330ml].to_f)*0.0792)+((stats[:totals][:ukx750ml].to_f)*0.09)+((stats[:totals][:ukx500ml].to_f)*0.06)+((stats[:totals][:ukk30L].to_f)*0.29)+((stats[:totals][:ukk20L].to_f)*0.19))*((stats[:info][:abv]).to_f).to_f)*5.69.to_f).round(2)
          end
        ]
      end
    end
  end
end
