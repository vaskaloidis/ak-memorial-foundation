RSpec::Matchers.define :authorize do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end

  failure_message do |policy|
    "#{policy.class} does not authorize #{action}."
  end

  failure_message_when_negated do |policy|
    "#{policy.class} does not forbid #{action}."
  end
end