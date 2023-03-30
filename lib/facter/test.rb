require 'json'
ext_facts_file='/etc/facter/facts.d/test.json'

Facter.add(:test) do
    setcode do
        test={}
        test['csp_region']='region1'
        if test != {}
            my_facts=Hash.new
            my_facts["test"]=test
            if !File.file?(ext_facts_file)
                File.open(ext_facts_file,"w") do |f|
                    f.write(JSON.pretty_generate(my_facts))
                end
            else
                meta_file=File.read(ext_facts_file)
                parse_hash=JSON.parse(meta_file)
                if parse_hash.has_key?("test")
                    # if content is not the same and new info is not a subset of existing info
                     if parse_hash["test"] != test and not test <= parse_hash["test"]
                       initial_metadata=parse_hash["test"]
                       initial_metadata.merge!(test)
                       my_facts["test"]=initial_metadata
                       #my_facts.merge!(initial_metadata)
                       File.write(ext_facts_file, JSON.pretty_generate(my_facts))
                    end
                else
                    File.write(ext_facts_file, JSON.pretty_generate(my_facts))
                end
            end
            test
        end  
    end
end
