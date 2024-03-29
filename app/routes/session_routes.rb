class SessionRoutes < Application
  post '/' do
    session_params = validate_with!(SessionParamsContract)[:session]
    result = UserSessions::CreateService.call(*session_params.values)

    if result.success?
      token = JwtEncoder.encode(uuid: result.session.uuid)
      meta = { token: token }

      status 201
      json meta: meta
    else
      status 401
      error_response(result.session || result.errors)
    end
  end
end
