$region="YOUR_COGNITIVE_SERVICES_REGION"
$key="YOUR_COGNITIVE_SERVICES_KEY"


# Code to call Text to Speech API
$sml = "<speak version='1.0' xml:lang='en-US'>
    <voice xml:lang='en-US' xml:gender='Female' name='en-US-AriaNeural'>
        It's coding time!
    </voice>
</speak>"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/ssml+xml" )
$headers.Add( "X-Microsoft-OutputFormat","audio-16khz-128kbitrate-mono-mp3" )

$outputFile = "output.wav"

write-host "Synthesizing speech..."
$result = Invoke-RestMethod -Method Post `
          -Uri "https://$region.tts.speech.microsoft.com/cognitiveservices/v1" `
          -Headers $headers `
          -Body $sml `
          -OutFile $outputFile

write-host $result
write-host "Results saved in $outputFile `n"