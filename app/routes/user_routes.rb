class UserRoutes < Application
  post '/' do
    user_params = validate_with!(UserParamsContract)[:user]
    result = Users::CreateService.call(*user_params.values)

    if result.success?
      status 201
    else
      status 422
      error_response result.user
    end
  end
end
