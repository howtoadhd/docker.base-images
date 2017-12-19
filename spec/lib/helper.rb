require_relative 'helper/type'

extend H2ADockerBase::Helper::Type
class RSpec::Core::ExampleGroup
  extend H2ADockerBase::Helper::Type
  include H2ADockerBase::Helper::Type
end
