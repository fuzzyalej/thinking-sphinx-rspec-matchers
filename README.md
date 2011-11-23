# Thinking Sphinx matchers
Ok, so here I present you my first gem. It was created out of necessity and I hope to both be useful to the community and learn a lot in the process!


# Installation
To install the matchers you only have to add the gem to your test group in `Gemfile`:

     group :test do
       gem 'thinking-sphinx-rspec-matchers'
     end


# Use
     describe "fields" do
       it { should index :name, :from = :client, :as = :client_name }
       it { should index :content }
     end
    
     describe "attributes" do
       it { should have_attribute :user_id, :as = :users }
     end

Field options
    - :from
    - :as
    - :facet
    - :sortable

Attribute Field options
    - :as
    - :facet

# References
[1] http://openmonkey.com/2009/07/19/thinking-sphinx-rspec-matchers/

[2] https://gist.github.com/21755


# Credits
Thanks to Pal Allan from http://freelancing-gods.com/ for creating Thinking Sphinx!
Thanks to Tim Riley for the initial version of the matcher
