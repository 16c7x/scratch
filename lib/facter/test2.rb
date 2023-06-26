require 'json'
ext_facts_file = '/etc/facter/facts.d/test.json'

Facter.add(:test2) do
  setcode do
    test2 = {}
    test2['csp_region'] = 'region1'
    if test2 != {}
      my_facts = {}
      my_facts['test2'] = test2
      meta_file = File.read(ext_facts_file)
      parse_hash = JSON.parse(meta_file)
      # if content is not the same and new info is not a subset of existing info
      initial_metadata = parse_hash['test2']
      initial_metadata.merge!(test2)
      my_facts['test2'] = initial_metadata
      # my_facts.merge!(initial_metadata)
      File.write(ext_facts_file, JSON.pretty_generate(my_facts))
      test2
    end
  end
end
