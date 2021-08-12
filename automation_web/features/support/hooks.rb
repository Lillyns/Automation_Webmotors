Before do
    @busca = Busca.new
end
  
After do |scn|
    if scn.failed? && ENV['debug']
        binding.pry
    end
end
  
