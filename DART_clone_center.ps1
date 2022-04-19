function PickVcenter()
{
#Text label for vCenter selection
$dropDownLabel = New-Object System.Windows.Forms.Label
$dropDownLabel.Location = New-Object System.Drawing.Size(10,12)
$dropDownLabel.Size = New-Object System.Drawing.Size(120, 20)
$dropDownLabel.Text = "Select vCenter Server"
$form.Controls.Add($dropDownLabel)

#Dropdown list for vCenter names
$dropDownList = New-Object System.Windows.Forms.ComboBox
$dropDownList.Location = New-Object System.Drawing.Size(150,10)
$dropDownList.Size = New-Object System.Drawing.Size(150,30)
$dropDownList.Items.Add("sb-vcenter.sandbox.local")
$dropDownList.SelectedIndex = 0
$form.Controls.Add($dropDownList)

#Button to click off connect to selected vCenter
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size(310, 10)
$button.Size = New-Object System.Drawing.Size(60, 20)
$button.Text = "Connect"
$button.Add_Click({ConnectVIServer})
$form.Controls.Add($button)

#Button to refresh form
$refreshbutton = New-Object System.Windows.Forms.Button
$refreshbutton.Location = New-Object System.Drawing.Size(400, 10)
$refreshbutton.Size = New-Object System.Drawing.Size(60, 20)
$refreshbutton.Text = "Test Vms"
$refreshbutton.Add_Click({TestVMs})
$form.Controls.Add($refreshbutton)

#Button to build csv
$csvbutton = New-Object System.Windows.Forms.Button
$csvbutton.Location = New-Object System.Drawing.Size(490, 10)
$csvbutton.Size = New-Object System.Drawing.Size(80, 20)
$csvbutton.Text = "Upload DB"
$csvbutton.Add_Click({BuildCSV})
$form.Controls.Add($csvbutton)

<#Button to upload csv
$uploadbutton = New-Object System.Windows.Forms.Button
$uploadbutton.Location = New-Object System.Drawing.Size(600, 10)
$uploadbutton.Size = New-Object System.Drawing.Size(80, 20)
$uploadbutton.Text = "Upload CSVs"
$uploadbutton.Add_Click({UploadCSV})
$form.Controls.Add($uploadbutton)#>

#Button to remove vms
$removebutton = New-Object System.Windows.Forms.Button
$removebutton.Location = New-Object System.Drawing.Size(220, 625)
$removebutton.Size = New-Object System.Drawing.Size(60, 20)
$removebutton.Text = "Remove"
$removebutton.Add_Click({DeleteVM})
$form.Controls.Add($removebutton)

#Button to pick vlan
$vlanbutton = New-Object System.Windows.Forms.Button
$vlanbutton.Location = New-Object System.Drawing.Size(220, 660)
$vlanbutton.Size = New-Object System.Drawing.Size(60, 20)
$vlanbutton.Text = "VLAN"
$vlanbutton.Add_Click({SetVlan})
$form.Controls.Add($vlanbutton)

#Button to pick ip
$ipbutton = New-Object System.Windows.Forms.Button
$ipbutton.Location = New-Object System.Drawing.Size(220, 700)
$ipbutton.Size = New-Object System.Drawing.Size(60, 20)
$ipbutton.Text = "IP"
$ipbutton.Add_Click({SeeIp})
$form.Controls.Add($ipbutton)

#Button to check db status
$dbbutton = New-Object System.Windows.Forms.Button
$dbbutton.Location = New-Object System.Drawing.Size(310, 825)
$dbbutton.Size = New-Object System.Drawing.Size(70, 20)
$dbbutton.Text = "Check DB"
$dbbutton.Add_Click({CheckDB})
$form.Controls.Add($dbbutton)

#Button to reconnect db 
$reconnbutton = New-Object System.Windows.Forms.Button
$reconnbutton.Location = New-Object System.Drawing.Size(420, 825)
$reconnbutton.Size = New-Object System.Drawing.Size(70, 20)
$reconnbutton.Text = "Reconnect"
$reconnbutton.Add_Click({ReconnDB})
$form.Controls.Add($reconnbutton)

#Text Label for listbox of VMs returned
$listBoxVMsLabel = New-Object System.Windows.Forms.Label
$listBoxVMsLabel.Location = New-Object System.Drawing.Size(10,60)
$listBoxVMsLabel.Text = "Select VM"
$form.Controls.Add($listBoxVMsLabel)
#Listbox populated with VMs
$listBoxVMs.Location = New-Object System.Drawing.Size(10,85)
$listBoxVMs.Size = New-Object System.Drawing.Size(280,20)
$listBoxVMs.Height = 200
$form.Controls.Add($listBoxVMs)

#Datastore list box label
$listBoxDSLabel = New-Object System.Windows.Forms.Label
$listBoxDSLabel.Location = New-Object System.Drawing.Size(325,60)
$listBoxDSLabel.Text = "Select Datastore"
$form.Controls.Add($listBoxDSLabel)
#Datastore list box
$listBoxDS.Location = New-Object System.Drawing.Size(325,85)
$listBoxDS.Size = New-Object System.Drawing.Size(200,20)
$listBoxDS.Height = 200
$form.Controls.Add($listBoxDS)

#Host list box label
$listBoxHostLabel = New-Object System.Windows.Forms.Label
$listBoxHostLabel.Location = New-Object System.Drawing.Size(555,60)
$listBoxHostLabel.Text = "Select Target Host"
$form.Controls.Add($listBoxHostLabel)
#Host list box
$listBoxHost.Location = New-Object System.Drawing.Size(555,85)
$listBoxHost.Size = New-Object System.Drawing.Size(200,20)
$listBoxHost.Height = 200
$form.Controls.Add($listBoxHost)

#New Virtual Machine name label
$newNameLabel = New-Object System.Windows.Forms.Label
$newNameLabel.Location = New-Object System.Drawing.Size(780, 60)
$newNameLabel.Text = "New VM Name"
$form.Controls.Add($newNameLabel)
#New virtual machine name text box
$newNameTextBox.Location = New-Object System.Drawing.Size(780, 85)
$newNameTextBox.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($newNameTextBox)

#Clone button on the GUI form
$cloneButton = New-Object System.Windows.Forms.Button
$cloneButton.Location = New-Object System.Drawing.Size(780, 190)
$cloneButton.Size = New-Object System.Drawing.Size(60, 20)
$cloneButton.Text = "Clone"
#Confirming actions to be taken when button is clicked
$cloneButton.Add_Click({CloneVM $listBoxVMs $listBoxDS $listBoxHost $newNameTextBox $VMIPAddrTextBox $DHCPScopeBox})
$form.Controls.Add($cloneButton)

#How many clones label
$VMIPaddr = New-Object system.windows.Forms.Label
$VMIPaddr.Text = "Clone Quanity"
$VMIPaddr.AutoSize = $true
$VMIPaddr.Width = 25
$VMIPaddr.Height = 10
$VMIPaddr.location = new-object system.drawing.point(780,120)
$Form.controls.Add($VMIPaddr)
#how many clones drop down box
$VMIPAddrTextBox = New-Object System.Windows.Forms.ComboBox
$VMIPAddrTextBox.Location = New-Object System.Drawing.Size(780,140)
$VMIPAddrTextBox.Size = New-Object System.Drawing.Size(110,20)
$VMIPAddrTextBox.Items.Add(1)
$VMIPAddrTextBox.Items.Add(2)
$VMIPAddrTextBox.Items.Add(3)
$VMIPAddrTextBox.Items.Add(4)
$VMIPAddrTextBox.Items.Add(5)
$VMIPAddrTextBox.Items.Add(6)
$VMIPAddrTextBox.Items.Add(7)
$VMIPAddrTextBox.Items.Add(8)
$VMIPAddrTextBox.Items.Add(9)
$VMIPAddrTextBox.Items.Add(10)
$VMIPAddrTextBox.SelectedIndex = 0
$Form.controls.Add($VMIPAddrTextBox)

#list box for clone status
$OutputTextBox = New-Object System.Windows.Forms.TextBox
$OutputTextBox.Location = New-Object System.Drawing.Size(10, 300)
$OutputTextBox.Size = New-Object System.Drawing.Size(600, 200)

#Text Label for testbox of VMs returned
$testBoxVMsLabel = New-Object System.Windows.Forms.Label
$testBoxVMsLabel.Location = New-Object System.Drawing.Size(10,600)
$testBoxVMsLabel.Text = "Testing VM"
$form.Controls.Add($testBoxVMsLabel)
#Listbox populated with VMs
$testBoxVMs.Location = New-Object System.Drawing.Size(10,625)
$testBoxVMs.Size = New-Object System.Drawing.Size(200,60)
$testBoxVMs.Height = 200
$testBoxVMs.Items.Clear()
$form.Controls.Add($testBoxVMs)

#Text Label for testbox of VLAN
$testBoxVLANsLabel = New-Object System.Windows.Forms.Label
$testBoxVLANsLabel.Location = New-Object System.Drawing.Size(300,600)
$testBoxVLANsLabel.Text = "VLAN"
$form.Controls.Add($testBoxVLANsLabel)
#Listbox populated with VLANs
$testBoxVLANs.Location = New-Object System.Drawing.Size(300,625)
$testBoxVLANs.Size = New-Object System.Drawing.Size(200,60)
$testBoxVLANs.Height = 100
$testBoxVLANs.Items.Add("668 - Backchannel")
$testBoxVLANs.Items.Add("700 - Project Servers")
$form.Controls.Add($testBoxVLANs)

#IP Address for clone label
$IPLabel = New-Object System.Windows.Forms.Label
$IPLabel.Location = New-Object System.Drawing.Size(300, 725)
$IPLabel.Text = "IP Address"
$form.Controls.Add($IPLabel)
#IP Address for clone
$IPTextBox = New-Object System.Windows.Forms.TextBox
$IPTextBox.Location = New-Object System.Drawing.Size(300, 750)
$IPTextBox.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($IPTextBox)


#Status of vm tyrant db
$StatusLabel = New-Object System.Windows.Forms.Label
$StatusLabel.Location = New-Object System.Drawing.Size(300, 775)
$StatusLabel.Text = "Status of VM in DB"
$form.Controls.Add($StatusLabel)
#status box of vm
$StatusBox = New-Object System.Windows.Forms.TextBox
$StatusBox.Location = New-Object System.Drawing.Size(300, 800)
$StatusBox.Size = New-Object System.Drawing.Size(90, 20)
$form.Controls.Add($StatusBox)

#connected to db box of vm
$ReconnBox = New-Object System.Windows.Forms.TextBox
$ReconnBox.Location = New-Object System.Drawing.Size(410, 800)
$ReconnBox.Size = New-Object System.Drawing.Size(90, 20)
$form.Controls.Add($ReconnBox)



#Dialog title name of GUI Form, and size of form
$form.Text = "DART Clone Center"
$form.Size = New-Object System.Drawing.Size(1000,1000)
$form.StartPosition = "CenterScreen"

$form.ShowDialog()

}

function ConnectVIServer() {
$cred = Get-Credential
#takes the selection in the previous function to a string, to be used as a variable
$choice = $dropDownList.SelectedItem.ToString()
try {
$viServer = Connect-VIServer $choice -Credential $cred
if ($viServer -eq $null) { return }
#Loads the ShowVMs function should a connection be made
ShowVMs
}
catch { Write-Host -ForegroundColor Red "Exception: $_" }
}

function ShowVMs() {



#Command used to pull VMs from vCenter filtered on vCenter tag, this can be any mixture of the Get-VM command
Get-VM -Tag "PSP VM" | % {
$listBoxVMs.Items.Add($_.Name)
}



#Powershell command used to retrieve the datastore details
Get-DataStore | % {

$freeGB = [string]::Format("{0:#,##0}", $_.FreeSpaceGB)
$listBoxDS.Items.Add("$($_.Name) | $freeGB GB Free")
}



#Powershell command to find hosts, and also parse the information so we can display the free memory on the host
Get-VMHost | % {

$memoryTotalMB = $_.MemoryTotalMB
$memoryUsageMB = $_.MemoryUsageMB
$memoryFreeMB = $_.MemoryTotalMB – $_.MemoryUsageMB
$memoryFreePerc = 0.0
try { $memoryFreePerc = $memoryFreeMB / $memoryTotalMB}
catch { }
$freeMB = [string]::Format("{0:#,##0.0%}", $memoryFreePerc)
$listBoxHost.Items.Add("$($_.Name) | $freeMB Free")

}





}




function CloneVM()
{
$vmName = $listBoxVMs.Items[$listBoxVMs.SelectedIndex].ToString()
$dsName = $listBoxDS.Items[$listBoxDS.SelectedIndex].ToString().Split("|")[0].ToString().Trim()
$hostName = $listBoxHost.Items[$listBoxHost.SelectedIndex].ToString().Split("|")[0].ToString().Trim()
$newName = $newNameTextBox.Text
$amount = $VMIPAddrTextBox.SelectedItem
#Basic error checking, unable to continue if the below items are empty
if ($vmName.Length -eq 0) { return }
if ($dsName.Length -eq 0) { return }
if ($hostName.Length -eq 0) { return }
if ($newName.Length -eq 0) { return }
$testVm = Get-VM -Name "$newName-*"
if ($testVm -ne $null) {
$buttonType = [System.Windows.MessageBoxButton]::OK
$messageBoxTitle = "Clone"
$messageBoxBody = "Clone with that name already exists."
$messageBoxIcon = [System.Windows.MessageBoxImage]::Warning
$result = [System.Windows.MessageBox]::Show($messageBoxBody,$messageBoxTitle,$buttonType,$messageBoxIcon)
return
}


#Capture current date for logging purposes
$Date = get-date

#Array to get names of vms created
[System.Collections.ArrayList]$global:listName= @()

#variables to collect information for vms
#$cloneName = $null
$cloneIP = $null
$cloneMac = $null

#Output message which reads back the selected variables and confirms the action taken upon hitting the "clone" button
$message = [string]::Format("Cloning {0} on DS {1}, host {2}", $vmName, $dsName, $hostName)

$OutputTextBox.Text = $message
$form.Controls.Add($OutputTextBox)



# Code to clone VM from selected objects
$snap = Get-Snapshot -VM $vmName -Name fresh_definitions
New-VM -VM $snap.VM -Name $newName -VMHost $hostName -ReferenceSnapshot $snap -LinkedClone -DiskStorageFormat Thin -Datastore $dsName  -Notes "Clone created $(whoami) $Date"
Start-Sleep -Seconds 90

for ($i=1; $i -le $amount ; $i++){
#$VM = New-VM -VM $vmName -Name "$newName-$i" -VMHost $hostName -DiskStorageFormat Thin -Datastore $dsName  -Notes "Clone created $(whoami) $Date"

New-VM -VM $newName -Name "$newName-$i" -VMHost $hostName -DiskStorageFormat Thin -Datastore $dsName  -Notes "Clone created $(whoami) $Date"


Start-Sleep -Seconds 60

$global:listName += "$newName-$i"
}

Remove-VM -VM $newName -DeletePermanently -Confirm:$false

#Code to add tags
for($t=0; $t -le $global:listName.Count-1; $t++){
New-TagAssignment -Tag "PSP TEST VM" -Entity(Get-VM $global:listName[$t])

$tmpVM = Get-vm -Name $global:listName[$t]
$nic = Get-NetworkAdapter -vm $tmpVM
Remove-NetworkAdapter -NetworkAdapter $nic -Confirm:$false
New-NetworkAdapter -VM $tmpVM -NetworkName "668 - Backchannel" -StartConnected 


$old = Get-VM -Name $vmName
$new = Get-VM -Name $global:listName[$t]
Get-Annotation -Entity $old  | ForEach-Object -Process { Set-Annotation -Entity $new -CustomAttribute $_.Name -Value $_.Value -Confirm:$false }
Start-Sleep -Seconds 10
}

#Code to poweron vms
for($g=0 ; $g -le $global:listName.Count-1 ; $g++){
Start-VM -VM $global:listName[$g] -RunAsync -Confirm:$false
<# while($listName[$g].PowerState -ne "Powered On"){
sleep 5
}
Get-VM $listName[$g] | Get-NetworkAdapter | Set-NetworkAdapter -Connected:$true -Confirm:$false #>
Start-Sleep -Seconds 60



}

#Code to create snapshot
for($s=0 ; $s -le $global:listName.Count-1 ; $s++){
New-Snapshot -vm $global:listName[$s] -Name 'fresh_definitions' -Memory
}
}

function BuildCSV{
$year = Get-Date -format yy
$month = Get-Date -format MM
$day = Get-Date -format dd
$minute = Get-Date -Format mm

$global:output =  'c:\temp\' + $year + $month + $day + $minute + "_machines_comp"+ '.csv'
$global:output1 =  'c:\temp\' + $year + $month + $day + $minute + "_machines_recipe"+ '.csv'
$global:recipe = $year + $month + $day + $minute + "_machines_recipe"+ '.csv'
$global:machine = $year + $month + $day + $minute + "_machines_comp"+ '.csv'

for($i=0; $i -le $global:listName.count-1 ; $i++){
$VMname = $global:listName[$i]
$cloneIP = (Get-VM -Name $global:listName[$i]).guest.IPAddress[0]
$cloneMac = Get-VM $global:listName[$i] | Get-NetworkAdapter | select -ExpandProperty MacAddress
$pal = "pal"
$vm = "vm"
$esxi = "esxi"
$folder = "PSP VMs"
$vlan = "668 - Backchannel"
$reaper1 = "reaper1"
$vmhost = "vm_host=sb-vcenter.sandbox.local"
$snapshot = "@snapshot"
$Csnapshot = "fresh_definitions"




$NewLine = "$VMname,$cloneIP,$cloneMac,$pal,$vm,$esxi,$folder,$vlan,$esxi,$reaper1,$vmhost"
Add-Content -Path $output -Value $NewLine
$NewLine2 ="$snapshot,$VMname,$Csnapshot"
Add-Content -Path $output -Value $NewLine2 

}

for($i=0; $i -le $global:listName.count-1 ; $i++){
$VMname = $global:listName[$i]
$VMfinal = Get-VM -Name $VMname
$os = Get-Annotation -Entity $VMfinal -CustomAttribute os | select -ExpandProperty value
$os_detail = Get-Annotation -Entity $VMfinal -CustomAttribute os_detail | select -ExpandProperty value 
$version = Get-Annotation -Entity $VMfinal -CustomAttribute version | select -ExpandProperty value
$lang = Get-Annotation -Entity $VMfinal -CustomAttribute lang | select -ExpandProperty value
$arch = Get-Annotation -Entity $VMfinal -CustomAttribute arch | select -ExpandProperty value
$recipe = Get-Annotation -Entity $VMfinal -CustomAttribute recipe | select -ExpandProperty value



$NewLine = "$VMname,$os,$os_detail,$version,$lang,$arch,$recipe"
Add-Content -Path $output1 -Value $NewLine


#code to upload csv to tyrant DB
$cred = get-credential
New-SSHSession -ComputerName '172.16.66.11' -Port 22 -Credential $cred -ConnectionTimeout 120 -OperationTimeout 120
Set-SCPItem -ComputerName '172.16.66.11' -Credential $cred -Path $global:output -Destination "/proj/testing/tyworkflow"
sleep 3 
Set-SCPItem -ComputerName '172.16.66.11' -Credential $cred -Path $global:output1 -Destination "/proj/testing/tyworkflow"
sleep 3
$stream = New-SSHShellStream -Index 0
$stream.WriteLine("cd /proj/testing/tyworkflow")
sleep 3
$stream.WriteLine("bin/db_admin import_recipes $global:recipe")
sleep 3
$stream.WriteLine("bin/db_admin import_computers $global:machine")
sleep 3

for($i=0; $i -le $global:listName.count-1 ; $i++){
$compName = $global:listName[$i]
$Y = 'Y'
$N = 'N'
$stream.WriteLine("bin/db_admin set_computer_flag testing_use $Y name=$compName")
sleep 3
$stream.WriteLine("bin/db_admin set_computer_flag testing_dirty $N name=$compName")

#output of array
$OutputTextBox2 = New-Object System.Windows.Forms.TextBox
$OutputTextBox2.Location = New-Object System.Drawing.Size(10, 400)
$OutputTextBox2.Size = New-Object System.Drawing.Size(600, 200)
$OutputTextBox2.Text = "Finished"
$form.Controls.Add($OutputTextBox2)
}


}


}

function UploadCSV{


}






function TestVMs(){
#Clear TextBOX
$testBoxVMs.Items.Clear()

#Command used to pull VMs from vCenter filtered on vCenter tag, this can be any mixture of the Get-VM command
Get-VM -Tag "PSP TEST VM" | % {
$testBoxVMs.Items.Add($_.Name)
}
$form.Controls.Add($testBoxVMs)
}

function DeleteVM{
$buttonType = [System.Windows.MessageBoxButton]::YesNoCancel
$messageBoxTitle = "Tyrant DB"
$messageBoxBody = "Do you also want to delete clone from DB?"
$messageBoxIcon = [System.Windows.MessageBoxImage]::Warning
$result = [System.Windows.MessageBox]::Show($messageBoxBody,$messageBoxTitle,$buttonType,$messageBoxIcon)
if($result -eq "Yes"){
$removeName = $testBoxVMs.Items[$testBoxVMs.SelectedIndex].ToString()
Stop-VM -VM $removeName -Confirm:$False
remove-vm -vm $removeName -DeletePermanently -Confirm:$false

New-SSHSession -ComputerName '172.16.66.11' -Port 22 -Credential $cred -ConnectionTimeout 120 -OperationTimeout 120

sleep 3
$stream = New-SSHShellStream -Index 0
$stream.WriteLine("cd /proj/testing/tyworkflow")
sleep 3
$stream.WriteLine("bin/db_admin del_computer $removeName")
sleep 3
$stream.WriteLine("bin/db_admin del_recipe $removeName")
} else {
$removeName = $testBoxVMs.Items[$testBoxVMs.SelectedIndex].ToString()
Stop-VM -VM $removeName -Confirm:$False
remove-vm -vm $removeName -DeletePermanently -Confirm:$false
}
}

function SetVlan{
$getNet = $testBoxVMs.Items[$testBoxVMs.SelectedIndex].ToString()
$setVlan = $testBoxVLANs.Items[$testBoxVLANs.SelectedIndex].ToString()
Get-VM $getNet | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName $setVlan -Confirm:$false
}

function SeeIP{
$vmName = $testBoxVMs.Items[$testBoxVMs.SelectedIndex].ToString()
$cloneIP = (Get-VM -Name $vmName).guest.IPAddress[0]

#output of ipaddress
$IPTextBox.Text = $cloneIP

}

function CheckDB{
$StatusBox.Text = "Checking"
$CheckComp =$testBoxVMs.Items[$testBoxVMs.SelectedIndex].ToString()
$cred = get-credential
New-SSHSession -ComputerName '172.16.66.11' -Port 22 -Credential $cred -ConnectionTimeout 120 -OperationTimeout 120

sleep 3
$stream = New-SSHShellStream -Index 0
$stream.WriteLine("cd /proj/testing/tyworkflow")
sleep 3
$stream.WriteLine("bin/db_admin list_computers")
sleep 3
$CheckOutput = $stream.Read()
$CheckOutput1 = $CheckOutput | Select-String -Pattern $CheckComp -SimpleMatch


if ($CheckOutput1 -eq $null){
$StatusBox.Text = "Not in DB"
$form.Controls.Add($StatusBox)
} else {
$StatusBox.Text = "In DB"
$form.Controls.Add($StatusBox)
}

#$output1 = $stream.WriteLine("bin/db_admin list_computers | grep -q 'gpettytest-1' && echo 'true'")

}

function ReconnDB{
$ReconnBox.Text = "Reconnecting"

$removeName = $testBoxVMs.Items[$testBoxVMs.SelectedIndex].ToString()

$compName = $removeName
$Y = 'Y'
$N = 'N'




$year = Get-Date -format yy
$month = Get-Date -format MM
$day = Get-Date -format dd
$minute = Get-Date -Format mm

$output =  'c:\temp\' + $year + $month + $day + $minute + "_machines_comp"+ '.csv'
$output1 =  'c:\temp\' + $year + $month + $day + $minute + "_machines_recipe"+ '.csv'
$recipe = $year + $month + $day + $minute + "_machines_recipe"+ '.csv'
$machine = $year + $month + $day + $minute + "_machines_comp"+ '.csv'


$VMname = $removeName
$cloneIP = (Get-VM -Name $removeName).guest.IPAddress[0]
$cloneMac = Get-VM $removeName | Get-NetworkAdapter | select -ExpandProperty MacAddress
$pal = "pal"
$vm = "vm"
$esxi = "esxi"
$folder = "PSP VMs"
$vlan = "668 - Backchannel"
$reaper1 = "reaper1"
$vmhost = "vm_host=sb-vcenter.sandbox.local"
$snapshot = "@snapshot"
$Csnapshot = "fresh_definitions"




$NewLine = "$VMname,$cloneIP,$cloneMac,$pal,$vm,$esxi,$folder,$vlan,$esxi,$reaper1,$vmhost"
Add-Content -Path $output -Value $NewLine
$NewLine2 ="$snapshot,$VMname,$Csnapshot"
Add-Content -Path $output -Value $NewLine2 




$VMname = $removeName
$VMfinal = Get-VM -Name $removeName
$os = Get-Annotation -Entity $VMfinal -CustomAttribute os | select -ExpandProperty value
$os_detail = Get-Annotation -Entity $VMfinal -CustomAttribute os_detail | select -ExpandProperty value 
$version = Get-Annotation -Entity $VMfinal -CustomAttribute version | select -ExpandProperty value
$lang = Get-Annotation -Entity $VMfinal -CustomAttribute lang | select -ExpandProperty value
$arch = Get-Annotation -Entity $VMfinal -CustomAttribute arch | select -ExpandProperty value
$recipes = Get-Annotation -Entity $VMfinal -CustomAttribute recipe | select -ExpandProperty value



$NewLine = "$VMname,$os,$os_detail,$version,$lang,$arch,$recipes"
Add-Content -Path $output1 -Value $NewLine


#code to upload csv to tyrant DB

$cred = get-credential
New-SSHSession -ComputerName '172.16.66.11' -Port 22 -Credential $cred -ConnectionTimeout 120 -OperationTimeout 120
Set-SCPItem -ComputerName '172.16.66.11' -Credential $cred -Path $output -Destination "/proj/testing/tyworkflow"
sleep 3 
Set-SCPItem -ComputerName '172.16.66.11' -Credential $cred -Path $output1 -Destination "/proj/testing/tyworkflow"
sleep 3

$stream = New-SSHShellStream -Index 0
$stream.WriteLine("cd /proj/testing/tyworkflow")
sleep 3
$stream.WriteLine("bin/db_admin del_computer $removeName")
sleep 3
$stream.WriteLine("bin/db_admin del_recipe $removeName")
sleep 3

$stream.WriteLine("bin/db_admin import_recipes $recipe")
sleep 3
$stream.WriteLine("bin/db_admin import_computers $machine")
sleep 3
$stream.WriteLine("bin/db_admin set_computer_flag testing_use $Y name=$compName")
sleep 3
$stream.WriteLine("bin/db_admin set_computer_flag testing_dirty $N name=$compName")

#output 

$ReconnBox.Text = "Reconnected"
$form.Controls.Add($ReconnBox)
}

### Start form
#Add necessary modules and .Net to build GUI form
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationCore, PresentationFramework



#Hide PowerShell Console > code snippet from http://blog.dbsnet.fr/hide-powershell-console-from-a-gui
Add-Type -Name Window -Namespace Console -MemberDefinition ‘
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
‘
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

#Build form based on earlier configuration
$form = New-Object System.Windows.Forms.Form
$listBoxVMs = New-Object System.Windows.Forms.ListBox
$listBoxDS = New-Object System.Windows.Forms.ListBox
$listBoxHost = New-Object System.Windows.Forms.ListBox
$newNameTextBox = New-Object System.Windows.Forms.TextBox
$VMIPAddrTextBox = New-Object System.Windows.Forms.ListBox
$testBoxVMs = New-Object System.Windows.Forms.ListBox
$testBoxVLANs = New-Object System.Windows.Forms.ListBox
$IPTextBox = New-Object System.Windows.Forms.ListBox
$StatusBox = New-Object System.Windows.Forms.ListBox
$ReconnBox = New-Object System.Windows.Forms.ListBox




PickVcenter