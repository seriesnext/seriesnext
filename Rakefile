require 'rake'
require 'rake/clean'

zip = 'Series-Next-Microsoft-Word.zip'
styles = 'microsoft-word-styles.docx'
titles = {
  'Agreement Terms' => 'documents/agreement-terms.md',
  'CONTRIBUTING' => 'CONTRIBUTING.md',
  'Certificate of Incorporation' => 'documents/certificate-of-incorporation.md',
  'Copyright' => 'COPYRIGHT.md',
  'Definitions' => 'documents/definitions.md',
  'Disclosure Schedule' => 'documents/disclosure-schedule.md',
  'Investment Agreement' => 'documents/investment-agreement.md',
  'README' => 'README.md',
  'Schedule' => 'documents/parties-schedule.md',
  'Term Sheet' => 'documents/term-sheet.md'
}
docx_files = titles.keys.map { |x| x + '.docx' }

task default: zip

task zip => docx_files do |t|
  sh "zip '#{t.name}' " + t.prerequisites.map { |file| "'#{file}'" }.join(' ')
end

titles.map do |basename, source|
  task "#{basename}.docx" => [source, styles] do |t|
    sh "pandoc --reference-docx #{styles} --smart -o '#{t.name}' '#{source}'"
  end
end

CLEAN.include(docx_files)

CLOBBER << zip
