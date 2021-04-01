class SessionParamsContract < Dry::Validation::Contract
  params do
    required(:session).hash do
      required(:email).filled(:string)
      required(:password).filled(:string)
    end
  end
end
