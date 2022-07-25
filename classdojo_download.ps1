Clear
$output = '<insert download directory'

$username = '<email address>'
$password = '<password>'

$pair = "$($username):$($password)"
$credential = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $credential"

$Headers = @{
    Authorization = $basicAuthValue
}

$url = "https://home.classdojo.com/api/storyFeed?includePrivate=true"

while($url -ne $null -or $feed -ne $null)
{
    ## Connect to API
    $url = Invoke-RestMethod $url -Method GET  -Headers $Headers
    ##$url = Invoke-WebRequest -Uri $url -Headers $Headers  | ConvertFrom-Json
    
    $url._links.prev.href  ## get the previous link
    
    $feed = $url | select -expand _items
    
    ##$feed.contents.attachments.path    ## array of url href path images or videos
    if ($feed.contents.attachments.path -ne $null)
    {            
        $newdir = $feed.time[0].Substring(0,10) #
        New-Item -Path $output -Name $newdir  -ItemType "directory" -Force  # Create subdirectory
        
        foreach ($href in $feed.contents.attachments.path)
        {   
            $filename = $href.Substring($href.LastIndexOf("/") + 1)
                
            $session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
            $cookie = New-Object System.Net.Cookie
            
            # cookie informations
            $cookie.Name = "dojo_login.sid"
            $cookie.Domain = ".classdojo.com"
            
            $session.Cookies.Add($cookie);
            
            Invoke-WebRequest -uri $href -WebSession $session -TimeoutSec 900 -OutFile $output\$newdir\$filename
            
            $href
        }
    }
    $url = $url._links.prev.href
}
