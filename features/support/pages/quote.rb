module Pages
  class QuotePage
    include PageObject

    text_field :firstname, id: 'firstname'
    text_field :email, id: 'email'
    text_field :topic_paper, id: 'topic_paper'
    select_list :paper, id: 'paper'
    

    def fill_form data, email
      self.firstname = data
      self.email = email
      self.topic_paper = data
      self.paper =



          array = %w[paper type subtype subject urgency pages]
          array.each do |arg|
            if @browser.select_list(id: arg).present?
              @browser.select_list(id: arg).wait_until(&:present?).options.to_a.sample.click
              pause
            end
          end
    end
  end
end
