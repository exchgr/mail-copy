to joinList(aList, delimiter)
  set returnString to ""
  set prevDelimiter to AppleScript's text item delimiters
  set AppleScript's text item delimiters to delimiter
  set returnString to aList as string
  set AppleScript's text item delimiters to prevDelimiter
  return returnString
end joinList

tell application "Mail"
  set theSelection to selection
  set theUrls to {}

  repeat with aMessage in theSelection
    copy ("message://<" & message id of aMessage & ">") to the end of theUrls
  end repeat

  set theMessages to joinList(theUrls, "
") of me
  set the clipboard to theMessages
end tell
