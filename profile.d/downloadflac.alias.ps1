# downloadflac
function downloadYTVideoAsFlac() {
    youtube-dl --extract-audio --audio-format flac $args
}

Set-Alias -name "downloadflac" -value "downloadYTVideoAsFlac"