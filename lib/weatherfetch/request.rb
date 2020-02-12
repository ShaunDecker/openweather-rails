class Request
  class << self


    def get(id)
      response, status = get_json(id)
      status == 200 ? response : errors(response)
    end

    def errors(response)
      error = { errors: { status: response["status"], message: response["message"] } }
      response.merge(error)
    end

    def get_json(query)
      response = api(query).get
      [JSON.parse(response.body), response.status]
    end

    def api(query)
      Connection.api(query)
    end
  end
end
