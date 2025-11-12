# Gets a list of the currently running Languages on Windows Machine
$LangList = Get-WinUserLanguageList
# Gets a list of the currently running Languages on Windows Machine and finds if the language tag equals a specific language and saves it
$MarkedLang = $LangList | where LanguageTag -eq "en-US"
# Removes the language that is saved from the previous command
$LangList.Remove($MarkedLang)
# Creates a random value of 1 or 2
$value = 1, 2 | Get-Random
# If value equals 1 it will become french keyboard. Else it is a russian keyboard
if ($value -eq 1) {
    #French keyboard because it messes with keyboard layout and the number pads
    Set-WinUserLanguageList -Force 'fr-FR'
}
else{
    #Russian keyboard because russian has nothing in common with enlish
    Set-WinUserLanguageList -Force 'ru-RU'
}