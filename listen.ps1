$region="YOUR_COGNITIVE_SERVICES_REGION"
$key="YOUR_COGNITIVE_SERVICES_KEY"



# Code to call Speech to Text API
$wav = "./data/speech/time.wav"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","audio/wav" )


write-host "Analyzing audio..."
$result = Invoke-RestMethod -Method Post `
          -Uri "https://$region.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US" `
          -Headers $headers `
          -InFile $wav

$analysis = $result
Write-Host ("`n", $analysis.DisplayText)