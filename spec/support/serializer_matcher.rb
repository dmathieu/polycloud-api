module SerializerExampleGroup
  extend ActiveSupport::Concern
  include ActiveModel::Serializers::Matchers

  included do
    subject { described_class }

    metadata[:type] = :serializer
  end
end

RSpec.configure do |config|
  config.include SerializerExampleGroup, example_group: {file_path: /spec\/serializers/}
end
