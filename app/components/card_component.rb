# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one :body
  renders_one :footer

  def initialize(title:, subtitle: nil)
    @title = title
    @subtitle = subtitle
  end

end
