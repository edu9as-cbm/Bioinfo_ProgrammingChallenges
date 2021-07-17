require "./bioruby-functions.rb"


# The gene list is read, and the sequence of each gene is scanned
gene_list = File.open(ARGV[0], "r") {|lines|
  lines.read.split("\n").map!(&:downcase)}
gene_list.each {|agi|
  
  puts "\n#{agi}"
  rec = BioRubyFunctions.new(agi)
  rec.scan_seq
  
  if agi == "at5g58260"
    no_target_genes = "Genes that do not contain target sequence are:\n"
    rec.which_genes_without_target.each {|gene|
      
      # Each gene is appended to the string
      no_target_genes = "#{no_target_genes}#{gene}, " 
      
    }
    no_target_genes = no_target_genes[0...-2] + "\n"

    # Generate task 5 files
    File.write("report_genes_without_cttctt_in_exons.txt", no_target_genes)  
    
    rec.create_GFF3_file_gene  # Task 4 GFF3 file is generated
    rec.create_GFF3_file_chromosome  # Task 6 GFF3 file is generated
  end
}
