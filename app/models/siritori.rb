class Siritori < ApplicationRecord

    # しりとりを成立させるバリデーション
    validate do
        errors.add(:word, 'がしりとりになっていません') if word !~ /\A[#{Siritori.last.word[-1]}][ぁ-ん]*[ぁ-を]\z/
    end

    # ポジティブ度を判定するバリデーション
    validates :score, 
    numericality: { greater_than_or_equal_to: 0.4, message: "が低いです、もっとポジティブに！"} ,
    if: :score_is_float?
    
    def score_is_float?
        score.instance_of?(Float)  
    end

    # google Natural Language -感情分析APIによるScore取得
    before_validation :get_score
    def get_score
        require 'google/cloud/language' #APIを使う
        language = Google::Cloud::Language.language_service

        document = { type: :PLAIN_TEXT, content: word }
        response = language.analyze_sentiment document: document
        sentiment = response.document_sentiment
        self.score = sentiment.score.to_f.round(1)

    end
end
