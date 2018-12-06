module Pages
  class QuotePage
    include PageObject

    text_field :firstname, id: 'firstname'
    text_field :email, id: 'email'
    text_field :topic_paper, topic_paper: 'topic_paper'
    select_list :paper, id: 'paper'
    

    def fill_form firstname, email
      self.firstname = firstname
      self.email = email
      self.topic_paper = topic_paper
    end
  end
end
