# word2md
function ConvertWordToMarkdown($Path) {
    $outputFile = [System.IO.Path]::GetFileNameWithoutExtension($Path)
    pandoc $Path --from docx --to commonmark -o $outputFile".md"
}

Set-Alias -name "word2md" -value "ConvertWordToMarkdown"