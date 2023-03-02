# module Searchable
#   extend ActiveSupport::Concern
# byebug
#   included do
#     include Elasticsearch::Model
#     include Elasticsearch::Model::Callbacks

#     # mapping do
#     #     indexes :name, type: :text
#     #     indexes :image, type: :string
#     #     indexes :comment, type: :text
#     # end

#         def self.search(query)
#           params = {
#             query: {
#               multi_match: {
#                 query: query, 
#                 fields: [ :name, :image, :comment ] 
#               },
#             },
#           }

#           self.__elasticsearch__.search(params)
#         # end
        
#     end
#   end
# end