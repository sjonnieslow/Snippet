Function Format-DateTime
{
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory=$false)]
        [string]$DateTime
    )

    Begin
    {
        if(!$DateTime)
        {
            $Dt = Get-Date 
        }
        else 
        {
            $Dt = Get-Date -Date $DateTime
        }
    }

    Process
    {
        New-Object psobject -Property (
            [ordered]@{
                "dateTime"    = $Dt.ToString('yyyy-MM-dd HH:mm:ss') 
                "date"        = $Dt.ToString('yyyy-MM-dd')
                "time"        = $Dt.ToString('HH:mm:ss')
            }
        )
    }

    End
    { }
}