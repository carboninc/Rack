class App
  def call(env)
    @request = Rack::Request.new(env)
    @params = @request.params

    if request_valid?
      time_response
    else
      response(404, 'Not found')
    end
  end

  private

  def request_valid?
    @request.get? && @request.path_info == '/time' && @params['format']
  end

  def time_response
    time_format = TimeFormat.new(@params)

    if time_format.valid?
      response(200, time_format.call)
    else
      response(400, "Unknown time format [#{time_format.invalid.join(', ')}]")
    end
  end

  def response(status, body)
    [status, { 'Content-Type' => 'text/plain' }, [body]]
  end
end
