module WeatherFunds

  class ResultSet

    Result = Struct.new(:date, :data)
    
    def initialize(result_tag, winner_tag)
      @result_tag = result_tag
      @winner_tag = winner_tag
      @data       = Nokogiri::XML(open("http://weatherfunds.co.uk/windata.xml"))
    end
    
    def date
      @data.css('wl').first['wdate']
    end
    
    def results
      @results ||= extract_results
    end
    
    def lotteries
      @lotteries ||= extract_winners
    end

    def find(name)
      @lotteries.select { |lottery| lottery.name == name }[0]
    end

    def find_by_scheme(scheme)
      @lotteries.select { |lottery| lottery.scheme == scheme }[0]
    end
    
    private
    
      def extract_winners
        @data.css("#{@winner_tag}").inject([]) do |result, res|
          lottery = Lottery.new(res['name'], res['scheme'])

          res.search('wn').each do |winner|
            lottery << Lottery::Winner.new(winner.search('n').text, winner.search('pr').text)
          end

          result << lottery
          result
        end
      end
    
      def extract_results
        @data.css("#{@result_tag} res").inject([]) do |result, res|
          date = Date.parse(res["idate"])
          data = res.search('d').map { |i| i.text.to_i }
          tmp  = Result.new(date, data)
          
          result << tmp
          result
        end
      end
    
  end

end