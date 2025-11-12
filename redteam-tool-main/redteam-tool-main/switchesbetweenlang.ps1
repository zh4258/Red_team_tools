Add-Type -AssemblyName System.Windows.Forms

#Placeholder value for While loop
$value = 1

#While value equals 1 the command executes alt shift is the command to switch languages if there is multiple on machine
while($value -eq 1){

# Simulate pressing Alt+Shift
[System.Windows.Forms.SendKeys]::SendWait('%+')

# Simulate releasing Alt+Shift
[System.Windows.Forms.SendKeys]::SendWait('%-')
}
