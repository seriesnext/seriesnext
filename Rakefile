require 'rake'
require 'rake/clean'

markdown_files = Rake::FileList['**/*.md']
docx_files = markdown_files.ext('docx')
zip = 'Series-Next-Microsoft-Word.zip'
styles = 'microsoft-word-styles.docx'

task :default => zip

task zip => docx_files do |t|
  sh "zip '#{t.name}' " + t.prerequisites.map { |file| "'#{file}'" }.join(' ')
end

rule '.docx' => ['.md', styles] do |t|
  sh "pandoc --reference-docx #{styles} --smart -o '#{t.name}' '#{t.source}'"
end

CLEAN.include(docx_files)

CLOBBER << zip
