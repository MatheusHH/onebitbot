module FaqModule
	class ListService
		def initialize(params, action)
			@action = action
			@query = params["query"]
		end

		def call
			if @action == "search"
				faqs = Faq.search(@query)
			elsif @action == "Search_by_hashtag"
				faqs = []
				Faq.all.each do |faq| 
					faq.hashtags.each do |hashtags| 
						faqs << faq if hashtag.name == @query
					end
				end
			else
				faqs = Faq.all 
			end

			response = "*Perguntas e respostas* \n\n"
			faqs.each do |f| 
				response += "*#{f.id}* - "
				response += "*#{f.question}*\n"
				response += "*`#{f.answer}`*\n"
				f.hashtags.each do |h|
					response += "_##{h.name}_"
				end
			end
			(faqs.count > 0)? response : "Nada encontrado"
		end
	end
end

				