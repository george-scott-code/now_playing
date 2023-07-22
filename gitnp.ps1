param(
    [string]$message
)

# Check if $message is provided
if (-not $message) {
    Write-Error "Please provide a commit message using -message parameter."
    return
}

# Check if dotnet and git commands are available
if (-not (Get-Command "dotnet" -ErrorAction SilentlyContinue)) {
    Write-Error "dotnet command not found. Please make sure it is installed and in your PATH."
    return
}
if (-not (Get-Command "git" -ErrorAction SilentlyContinue)) {
    Write-Error "git command not found. Please make sure it is installed and in your PATH."
    return
}

$programPath = "bin\Debug\net7.0-windows10.0.19041.0\now_playing.dll";
$emojiIcon = [System.Convert]::toInt32("1F3A7", 16);
$trackDetail = ([System.Char]::ConvertFromUtf32($emojiIcon)) + " ";

$processInfo = New-Object System.Diagnostics.ProcessStartInfo;
$processInfo.FileName = "dotnet";
$processInfo.Arguments = $programPath;
$processInfo.RedirectStandardOutput = $true;
$processInfo.UseShellExecute = $false;
$processInfo.CreateNoWindow = $true;

$process = New-Object System.Diagnostics.Process;
$process.StartInfo = $processInfo;

$process.Start() | Out-Null;
$process.WaitForExit();

if ($process.ExitCode -eq 0) {
    $output = $process.StandardOutput.ReadToEnd()
    if($output) {
        $trackDetail += $output;
        git commit -m $message -m $trackDetail;
    }
    else {
        git commit -m $message;
    }
}
else {
    git commit -m $message;
}
