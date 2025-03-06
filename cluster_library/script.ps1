param (
    [string]$ClusterID,
    [string[]]$Packages  # Accepts multiple package names

)

# Initialize JSON structure
$json = @{
    cluster_id = $ClusterID
    libraries = @()
}

# Loop through each package and add it to the libraries array
foreach ($package in $Packages) {
    $json.libraries += @{
        pypi = @{
            package = $package
            repo = "http://my-pypi-repo.com"
        }
    }
}

# Convert PowerShell object to JSON (with proper formatting)
$jsonOutput = $json | ConvertTo-Json -Depth 10

# Output the JSON
Write-Output $jsonOutput
