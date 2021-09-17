#Add your key here
$key="YOUR_KEY"

#You need to add your resource location if you use a Cognitive Services resource
$location="YOUR_LOCATION"

#The endpoint is global for the Translator service, do not change it 
$endpoint="https://api.cognitive.microsofttranslator.com/"

#Text to be translated 
$text="Hello what is your name"

# Code to call Text Analytics service to analyze sentiment in text
$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Ocp-Apim-Subscription-Region", $location )
$headers.Add( "Content-Type","application/json" )

$body = "[{'text': '$text'}]" 

write-host "Translating text..."
$result = Invoke-Webrequest -Method Post `
          -Uri "$endpoint/translate?api-version=3.0&from=en&to=fr&to=it&to=zh-Hans" `
          -Headers $headers `
          -Body $body 

$analysis = $result.content | ConvertFrom-Json
$french = $analysis.translations[0] 
$italian = $analysis.translations[1] 
$chinese = $analysis.translations[2] 
Write-Host ("`nOriginal Text: $text`nFrench Translation: $($french.text)`nItalian Translation: $($italian.text)`nChinese Translation: $($chinese.text)")

# Code to Translate audio 
$wav = "./data/translation/english.wav"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","audio/wav" )

write-host "`nTranslating audio..."
$audio_result = Invoke-RestMethod -Method Post `
          -Uri "https://$location.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US" `
          -Headers $headers `
          -InFile $wav

$original_audio_text = $audio_result.DisplayText
Write-Host ("`nThe audio said '$($original_audio_text)'")

#Text to be translated 
$text=$original_audio_text

# Code to call Text Analytics service to analyze sentiment in text
$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Ocp-Apim-Subscription-Region", $location )
$headers.Add( "Content-Type","application/json" )

$body = "[{'text': '$text'}]" 

write-host "`nTranslating audio..."
$result = Invoke-Webrequest -Method Post `
          -Uri "$endpoint/translate?api-version=3.0&from=en&to=fr&to=it&to=zh-Hans" `
          -Headers $headers `
          -Body $body 

$analysis = $result.content | ConvertFrom-Json
$audio_translation = $analysis.translations 
write-host ("The audio translation is: $audio_translation")












