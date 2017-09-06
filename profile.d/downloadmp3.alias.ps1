# downloadmp3
function downloadYTVideoAsMp3() {
    youtube-dl --extract-audio --audio-format mp3 $args
}

Set-Alias -name "downloadmp3" -value "downloadYTVideoAsMp3"