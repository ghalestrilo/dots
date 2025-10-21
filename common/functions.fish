# Common fish functions

echo "hi"

function epub_to_mobi
    # Translate all .epub files in the current directory to .mobi using ebook-convert
    for epub_file in *.epub
        set mobi_file (string replace ".epub" ".mobi" $epub_file)
        /Applications/calibre.app/Contents/MacOS/ebook-convert "$epub_file" "$mobi_file"
        # /Applications/calibre.app/Contents/MacOS/ebook-convert "$epub_file" "$mobi_file"
        echo "Converted $epub_file to $mobi_file"
    end
end

function piprun
    set -l user_base (python3 -m site --user-base)
    set -l command "$user_base/bin/$argv[1]"

    if test -f "$command"
        eval "$command" $argv[2..]
    else
        echo "Error: Command '$argv[1]' not found in $user_base/bin/"
        return 1
    end
end


# NOTABC
function tigris-find
    set bucket $argv[1]
    set filename $argv[2]
    echo "bucket: $bucket"
    echo "filename: $filename"
    # aws s3api list-objects-v2 --bucket imazon --prefix 'myFolder' --query "Contents[*]|[?ends_with(Key,'jpg')].[Key]"
    aws s3api list-objects-v2 --bucket "imazon" --query "Contents[*]|[$filename]"
end
