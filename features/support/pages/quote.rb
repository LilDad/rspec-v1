module Pages
  class QuotePage
    include PageObject

    text_field :firstname, id: 'firstname'
    text_field :email, id: 'email'
    text_field :topic_paper, id: 'topic_paper'
    file_field :attachment, id: 'attachment'
    checkbox :tc_checkbox, id: 'tc_checkbox'
    button :send_quote, id: 'send_quote'

    def fill_form(data, email)
      array = %w[paper type subtype subject urgency pages]

      self.firstname = data
      self.email = email
      self.topic_paper = data
      array.each do |value|
        if select_list(id: value).present?
          rand_select_list value
          sleep 1
        end
      end
      self.attachment = '/home/oem/Документы/RubyMine/Projects/rspec-v1/Files/test_file'
      checkbox(id: 'tc_checkbox').set
      button(id: 'send_quote').click
      sleep 344
    end

    def rand_select_list(arg)
      select_list(id: arg).wait_until(&:present?).options.to_a.sample.click
    end
  end
end
