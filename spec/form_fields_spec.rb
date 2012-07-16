require 'spec_helper'

describe Form, '-> Fields' do

  it 'fields with actions' do
    tag = Form.horizontal do
      append do
        Fieldset.new do
          append do
            ControlGroup.new('Focused input', :for => 'focusedInput') do
              append Input.text :class => 'input-xlarge focused', :id => 'focusedInput', :value => 'This is focused...'
            end
          end
          append do
            ControlGroup.new('Uneditable input') do
              append Tag.block(:span, :class => 'input-xlarge uneditable-input') { append 'Some value here' }
            end
          end
          append do
            ControlGroup.new('Disabled input', :for => 'disabledInput') do
              append Input.text :class => 'input-xlarge disabled', :id => 'disabledInput', :placeholder => 'Disabled input here...', :disabled => nil
            end
          end
          append do
            ControlGroup.new('Disabled checkbox', :for => 'optionsCheckbox2') do
              append do
                Tag.block(:label, :class => 'checkbox') do
                  append Input.checkbox :id => 'optionsCheckbox2', :value => 'option1', :disabled => nil
                  append 'This is a disabled checkbox'
                end
              end
            end
          end
          append do
            ControlGroup.warning('Input with warning', :for => 'inputWarning') do
              append Input.text :id => 'inputWarning'
              append Help.inline 'Something may have gone wrong'
            end
          end
          append do
            ControlGroup.error('Input with error', :for => 'inputError') do
              append Input.text :id => 'inputError'
              append Help.inline 'Please correct the error'
            end
          end
          append do
            ControlGroup.success('Input with success', :for => 'inputSuccess') do
              append Input.text :id => 'inputSuccess'
              append Help.inline 'Woohoo!'
            end
          end
          append do
            ControlGroup.success('Select with success', :for => 'selectSuccess') do
              append Select.new [1, 2, 3, 4, 5], :id => 'selectSuccess'
              append Help.inline 'Woohoo!'
            end
          end
          append do
            Tag.block(:div, :class => 'form-actions') do
              append Submit.primary('Save changes')
              append Button.new('Cancel')
            end
          end
        end
      end
    end

    tag.to_s.should eq HtmlHelper.html_for('form_fields', "form")
  end

end