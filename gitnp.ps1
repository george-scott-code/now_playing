param(
    [string]$message
)

$programPath = "bin\Debug\net7.0-windows10.0.19041.0\now_playing.dll"
$output = ""

$processInfo = New-Object System.Diagnostics.ProcessStartInfo
$processInfo.FileName = "dotnet"
$processInfo.Arguments = """$programPath"""
$processInfo.RedirectStandardOutput = $true
$processInfo.UseShellExecute = $false
$processInfo.CreateNoWindow = $true

$process = New-Object System.Diagnostics.Process
$process.StartInfo = $processInfo

$process.Start() | Out-Null
$process.WaitForExit()

if ($process.ExitCode -eq 0) {
    $output = $process.StandardOutput.ReadToEnd()
}

&git add .
&git commit -m $message -m $output