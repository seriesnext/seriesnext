require 'rake'
require 'rake/clean'

zip = 'Series-Next-Microsoft-Word.zip'
styles = 'microsoft-word-styles.docx'
titles = {
  'README' =>
    'README.md',
  'Agreement Terms' =>
    'documents/investment-agreement/agreement-terms.md',
  'Certificate of Incorporation' =>
    'documents/investment-agreement/certificate-of-incorporation.md',
  'CONTRIBUTING' =>
    'CONTRIBUTING.md',
  'Copyright' =>
    'COPYRIGHT.md',
  'Definitions' =>
    'documents/investment-agreement/definitions.md',
  'Disclosure Schedule' =>
    'documents/investment-agreement/disclosure-schedule.md',
  'Investment Agreement' =>
    'documents/investment-agreement/investment-agreement.md',
  'Schedule' =>
    'documents/investment-agreement/schedule.md',
  'Term Sheet' =>
    'documents/term-sheet.md'
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
