require 'acceptance_spec_helper'

describe 'shoulda-matchers integrates with an ActiveModel project' do
  specify 'and loads without errors' do
    create_active_model_project

    add_shoulda_matchers_to_project

    write_file 'load_dependencies.rb', <<-FILE
      require 'active_model'
      require 'shoulda-matchers'

      puts ActiveModel::VERSION::STRING
      puts "Loaded all dependencies without errors"
    FILE

    result = run_command('bundle exec ruby load_dependencies.rb')
    expect(result).to have_output('Loaded all dependencies without errors')
  end
end
