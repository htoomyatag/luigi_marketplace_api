module ApiHelpers

  def json_body
    JSON.parse(response.body)
  end

  def validation_error_msg(field)
    json_body["error"].fetch(field)
  end

end