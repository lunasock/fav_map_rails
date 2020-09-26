class Elasticsearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string
  attribute :page, :integer

  def search
    Spot.search(
      # 検索ワードが空欄の場合は、全検索
      keyword_for_search,
      page: page,
      per_page: 10
    )
  end

  private

  # 検索ワードが空欄の場合は、全検索
  def keyword_for_search
    keyword.presence || "*"
  end
end