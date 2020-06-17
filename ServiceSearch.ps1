#Service to Test
$servicename = ""
#List of names
$list = get-content $Path


foreach ($name in $list){
    #Search for the computer associated to the name
    $name = $name + "*"
    Get-ADComputer -Filter 'Name -like $name' -Properties IPv4Address |  Select-Object -ExpandProperty Name -outvariable computername

    #IF EXIST
    if ($computername){ 
        #IF PINGABLE

        if(Test-Connection -Computername $computername){ 
            #TEST IF SERVICE EXIST
            if (Get-Service $servicename -computername $computername -ErrorAction SilentlyContinue){

                Write-Host "Service Installed"
                }

            Else{

            Write-Host " Service Not Installed

                }
        }
    }
}
