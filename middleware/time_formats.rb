class TimeFormat
  AVAILABLE_FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  attr_reader :invalid

  def initialize(params)
    @valid = []
    @invalid = []
    @formats = params['format'].split(',')

    detect_formats
  end

  def valid?
    invalid.empty?
  end

  def call
    Time.now.strftime(@valid.join('-'))
  end
  
  private

  def detect_formats
    @formats.each do |format|
      if AVAILABLE_FORMATS[format]
        @valid << AVAILABLE_FORMATS[format]
      else
        @invalid << format
      end
    end
  end
end
